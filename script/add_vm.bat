@echo off

rem Move to script directory
cd %~dp0

powershell -NoProfile -ExecutionPolicy Unrestricted .\add_vm.ps1

pause
