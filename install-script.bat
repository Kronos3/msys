:
@echo off

rem ember value of GOTO: is used to know recursion has happened.
if "%1" == "GOTO:" goto %2

if NOT "x%WD%" == "x" set WD=

rem ember command.com only uses the first eight characters of the label.
goto _WindowsNT

start /min %COMSPEC% /e:4096 /c %0 GOTO: _Resume %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
goto EOF

rem ember that we execute here if we recursed.
:_Resume
for %%F in (1 2 3) do shift
if NOT EXIST %WD%msys-2.0.dll set WD=.\usr\bin\

rem ember that we get here even in command.com.
:_WindowsNT

if NOT EXIST %WD%msys-2.0.dll set WD=%~dp0usr\bin\

set MSYSTEM=MINGW64
rem To activate windows native symlinks uncomment next line
rem set MSYS=winsymlinks:nativestrict
rem Set debugging program for errors
rem set MSYS=error_start:%WD%../../mingw64/bin/qtcreator.exe^|-debug^|^<process-id^>
set MSYSCON=mintty.exe
if "x%1" == "x-consolez" set MSYSCON=console.exe
if "x%1" == "x-mintty" set MSYSCON=mintty.exe

if "x%MSYSCON%" == "xmintty.exe" goto startmintty
if "x%MSYSCON%" == "xconsole.exe" goto startconsolez

:startmintty
if NOT EXIST %WD%mintty.exe goto startsh
start %WD%mintty -i /msys2.ico /usr/bin/pacman -Sy --noconfirm pacman && \
/usr/bin/pacman -Syu --noconfirm && /usr/bin/pacman -Su --noconfirm && \
/usr/bin/pacman -S --noconfirm make && \
/usr/bin/pacman -S --noconfirm python3 && \
/usr/bin/pacman -S --noconfirm python2 && \
/usr/bin/pacman -S --noconfirm mingw32/mingw-w64-x86_64-gtksourceview3 && \
/usr/bin/pacman -S --noconfirm mingw64/mingw-w64-x86_64-clutter-gtk && \
/usr/bin/pacman -S --noconfirm mingw64/mingw-w64-x86_64-gtk3 && \
/usr/bin/pacman -S --noconfirm gcc && \
/usr/bin/pacman -S --noconfirm mingw-w64-x86_64-gobject-introspection && \
/usr/bin/pacman -S --noconfirm mingw-w64-x86_64-gobject-introspection-runtime && \
/usr/bin/pacman -S --noconfirm mingw-w64-x86_64-python2-gobject  && \
/usr/bin/pacman -S --noconfirm mingw-w64-x86_64-python3-gobject && \
/usr/bin/pacman -S --noconfirm mingw-w64-x86_64-gtksourceview3 && \
/usr/bin/pacman -S --noconfirm mingw64/mingw-w64-x86_64-boost && \
exit

:startconsolez
cd %WD%..\lib\ConsoleZ
sleep
exit

:startsh
exit

:EOF
