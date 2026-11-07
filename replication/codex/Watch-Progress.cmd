@echo off
set "RUN=%~1"
if "%RUN%"=="" set "RUN=corey-pilot-baseline"
python "%~dp0progress.py" "%~dp0runs\%RUN%" --watch
pause
