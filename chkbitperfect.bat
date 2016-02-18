@ECHO OFF

REM // build the ROM
call build %1

REM  // run fc
echo -------------------------------------------------------------
IF EXIST ps4built.bin ( fc /b ps4built.bin ps4original.bin
) ELSE echo ps4built.bin does not exist, probably due to an assembly error

REM // clean up after us
IF EXIST ps4.p del ps4.p
IF EXIST ps4.h del ps4.h
IF EXIST ps4.lst del ps4.lst
IF EXIST ps4built.bin del ps4built.bin
IF EXIST ps4built.prev.bin del ps4built.prev.bin
IF EXIST ps4.log ( IF "%1"=="-pe" del ps4.log )

REM // if someone ran this from Windows Explorer, prevent the window from disappearing immediately
pause
