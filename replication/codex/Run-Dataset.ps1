[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('alsa-lib','ffmpeg','libgcrypt','liboqs','libsodium','openssl')]
    [string]$Dataset,
    [ValidatePattern('^[A-Za-z0-9_-]+$')]
    [string]$Series = 'corey-study',
    [switch]$Watch,
    [switch]$Preview
)
$ErrorActionPreference = 'Stop'
$folder = [IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
$batch = "$Series-$Dataset"
$statePath = Join-Path $folder "batches\$batch.json"
if ($Watch) {
    while ($true) {
        $state = $null
        try { if (Test-Path -LiteralPath $statePath) { $state = Get-Content -LiteralPath $statePath -Raw | ConvertFrom-Json } } catch { }
        Clear-Host
        if ($state) {
            Write-Host "$batch | $($state.completed)/12 runs complete | $($state.status)"
            if ($state.run) {
                Write-Host "Current run: $($state.run)"
                & python "$folder\progress.py" "$folder\runs\$($state.run)"
            }
            if ($state.error) { Write-Host $state.error }
            if ($state.status -in @('completed','stopped')) { break }
        } else { Write-Host "Waiting for $batch to start..." }
        Start-Sleep -Seconds 5
    }
    return
}

$all = Get-Content -LiteralPath "$folder\selection-proposed-three.json" -Raw | ConvertFrom-Json
$names = @($all.PSObject.Properties[$Dataset].Value)
if ($names.Count -ne 3) { throw "Expected exactly three reference functions for $Dataset" }
$plan = @(foreach ($rep in 1..3) {
    foreach ($condition in 'baseline','context','cot','context_cot') {
        [pscustomobject]@{ condition = $condition; run = "$batch-$condition-r$rep" }
    }
})
Write-Host "$Dataset : $($names -join ', ')"
Write-Host '4 prompts x 3 repetitions x 3 functions x 10 variants = 360 requested variants.'
if ($Preview) { $plan | Format-Table -AutoSize; return }

$batchFolder = Join-Path $folder 'batches'
[IO.Directory]::CreateDirectory($batchFolder) | Out-Null
$selectionPath = Join-Path $batchFolder "$batch-selection.json"
$selection = @{}; $selection[$Dataset] = $names
$json = $selection | ConvertTo-Json -Depth 4
if (Test-Path -LiteralPath $selectionPath) {
    if ((Get-Content -LiteralPath $selectionPath -Raw) -ne $json) { throw 'Saved selection differs. Choose a new -Series.' }
} else { [IO.File]::WriteAllText($selectionPath, $json) }

function Save-State($status, $count, $runName, $message) {
    $record = @{ status=$status; completed=$count; run=$runName; error=$message; updated_at=[DateTime]::UtcNow.ToString('o') }
    [IO.File]::WriteAllText($statePath, ($record | ConvertTo-Json))
}
$done = 0
$activeRun = ''
$lock = [IO.File]::Open((Join-Path $batchFolder "$batch.lock"), 'OpenOrCreate', 'ReadWrite', 'None')
try {
    foreach ($item in $plan) {
        $activeRun = $item.run
        $dir = "$folder\runs\$activeRun"
        Save-State 'running' $done $activeRun ''
        if (Test-Path -LiteralPath "$dir\archive-manifest.json") {
            $archive = Get-Content -LiteralPath "$dir\archive-manifest.json" -Raw | ConvertFrom-Json
            $gen = Get-Content -LiteralPath "$dir\generation.json" -Raw | ConvertFrom-Json
            $saved = @($gen.selection.PSObject.Properties[$Dataset].Value)
            if (-not $archive.validation_stages_completed -or -not (Test-Path -LiteralPath "$dir\summary.json") -or
                $gen.condition -ne $item.condition -or $gen.model_requested -ne 'gpt-6-astra' -or $gen.effort -ne 'medium' -or
                @($gen.selection.PSObject.Properties).Count -ne 1 -or ($saved -join '|') -ne ($names -join '|')) {
                throw "Existing run $activeRun is incomplete or differs from this plan. Inspect it before continuing."
            }
            Write-Host "Keeping completed archive: $activeRun"
        } else {
            & "$folder\Run-Condition.ps1" -Condition $item.condition -Run $activeRun -Selection $selectionPath -Model gpt-6-astra -Effort medium
        }
        $done++
    }
    Save-State 'completed' $done '' ''
    Write-Host "Finished $batch. All 12 runs are archived."
} catch {
    Save-State 'stopped' $done $activeRun $_.Exception.Message
    throw
} finally {
    $lock.Dispose()
}
