@echo off

rem Move to script directory
cd %~dp0

powershell -NoProfile -ExecutionPolicy Unrestricted .\backup_vm.ps1

pause
