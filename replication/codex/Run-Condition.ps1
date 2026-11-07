[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('baseline','context','cot','context_cot')]
    [string]$Condition,
    [Parameter(Mandatory=$true)]
    [ValidatePattern('^[A-Za-z0-9_-]+$')]
    [string]$Run,
    [string]$Selection = '',
    [string]$Model = 'gpt-6-astra',
    [ValidateSet('low','medium','high','xhigh','max')]
    [string]$Effort = 'medium',
    [switch]$Preview
)
$ErrorActionPreference = 'Stop'
$scriptFolder = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
if (-not $Selection) { $Selection = [System.IO.Path]::Combine($scriptFolder, 'selection-alsa.json') }
$selectionPath = (Resolve-Path -LiteralPath $Selection).Path
$selectionData = Get-Content -LiteralPath $selectionPath -Raw | ConvertFrom-Json
$functionCount = 0
foreach ($entry in $selectionData.PSObject.Properties) { $functionCount += @($entry.Value).Count }
Write-Host "Run: $Run | condition: $Condition | model: $Model | effort: $Effort"
Write-Host "Selection: $selectionPath"
Write-Host "Scope: $functionCount reference functions, $($functionCount * 10) requested variants, ONE condition, ONE repetition."
Write-Host "No other conditions or datasets will start automatically."
Write-Host "Watch from another PowerShell terminal:"
Write-Host "python `"$scriptFolder\progress.py`" `"$scriptFolder\runs\$Run`" --watch"
if ($Preview) { Write-Host 'Preview only: nothing started or written.'; return }

$pythonPath = (Get-Command python -ErrorAction Stop).Source
Write-Host 'Step 1: generating variants (existing matching replies are preserved).'
& $pythonPath "$scriptFolder\generate_variants_codex.py" --condition $Condition --run $Run --model $Model --effort $Effort --selection $selectionPath
if ($LASTEXITCODE -ne 0) { throw 'Generation stopped. Saved replies are kept; validation was not started.' }

Write-Host 'Step 2: validating in Ubuntu and archiving this run.'
& wsl -d Ubuntu -- bash /mnt/c/COMS6650/FinalProject/replication/codex/validate_run.sh $Run
if ($LASTEXITCODE -ne 0) { throw 'Validation stopped. Inspect this run progress and logs before retrying; saved evidence is retained.' }
Write-Host "Finished. Review $scriptFolder\runs\$Run\summary.json"
