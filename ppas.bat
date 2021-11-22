@echo off
SET THEFILE=cb_config.exe
echo Linking %THEFILE%
D:\Development\lazarus\fpc\2.6.0\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections  -s --subsystem windows --entry=_WinMainCRTStartup    -o cb_config.exe link.res
if errorlevel 1 goto linkend
D:\Development\lazarus\fpc\2.6.0\bin\i386-win32\postw32.exe --subsystem gui --input cb_config.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
