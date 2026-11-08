@echo off
cd /d "%~dp0"
where node >nul 2>nul
if %ERRORLEVEL% equ 0 (
    node deploy.js
) else (
    powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0deploy.ps1"
)
pause
