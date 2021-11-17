@echo off

rem Move to script directory
cd %~dp0

powershell -NoProfile -ExecutionPolicy Unrestricted .\clear_downloads_folder.ps1

pause
