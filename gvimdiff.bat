@echo off
rem -- Run Vim --

set VIM_EXE="gvim.exe"

rem for WinNT we can use %*
start "dummy" /b "gvim.exe" -d %*
