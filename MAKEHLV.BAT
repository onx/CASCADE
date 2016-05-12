@cls
@if  %1.==.                     goto nopar

@if  not exist %1.asm           goto noasm
@ctty nul
@del %1.obj
@del %1.lst
@del %1.crf
@del %1.ref
@del %1.map
@del %1.exe
@del %1.bin
@del _HLV_.COM
@ctty con
@masm /b63 %1,,%1,%1 %2 %3 %4;
@if not exist %1.obj            goto masm_err
@link %1,,%1;
@if not exist %1.exe            goto link_err
@x2b %1
@if not exist %1.com            goto exe2_err
@ren %1.com %1.bin
@cref %1.sbr;
@copy %1.lst+%1.map+%1.ref %1.t >  nul
@del %1.lst                    >  nul
@ren %1.t %1.lst               >  nul
@del %1.obj                    >  nul
@del %1.crf                    >  nul
@del %1.ref                    >  nul
@del %1.map                    >  nul
@del %1.exe                    >  nul
@echo n %1.bin                 >  md.inp
@echo l 11f                    >> md.inp
@echo a 110                    >> md.inp
@echo add cx,20                >> md.inp
@echo.                         >> md.inp
@echo g =110 113               >> md.inp
@echo f 110 11e 20             >> md.inp
@echo e 110 '%1'               >> md.inp
@echo f 100 10f 90             >> md.inp
@echo a 100                    >> md.inp
@echo jmp 120                  >> md.inp
@echo nop                      >> md.inp
@echo nop                      >> md.inp
@echo nop                      >> md.inp
@echo mov ax,4c00              >> md.inp
@echo int 21                   >> md.inp
@echo.                         >> md.inp
@echo n _HLV_.com              >> md.inp
@echo w                        >> md.inp
@echo q                        >> md.inp
@debug                         <  md.inp  > nul
@cls
@echo.
@echo   IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII¯
@echo   רררררררררררררררררררררררררררררררררררררררררררררררררררררררררררררררר
@echo   רררררררMAKEHLV erfolgreich beendet, _HLV_.com wurde erstellt.ררר
@echo   רררררררררררררררררררררררררררררררררררררררררררררררררררררררררררררררר
@echo   EIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII¬
@echo.
@goto ende
:nopar
@echo FEHLER !    Mindestens ein Parameter ist erforderlich !
@echo Syntax :    MAKEHLV asmfile [switches]
@goto ende
:noasm
@echo FEHLER !    Die Datei %1.ASM ist nicht zu finden !
@goto ende
:masm_err
@echo FEHLER !    %1.OBJ konnte nicht erstellt werden !
@goto ende
:link_err
@echo FEHLER !    %1.EXE konnte nicht erstellt werden !
@goto ende
:exe2_err
@echo FEHLER !    %1.BIN konnte nicht erstellt werden !
@goto ende
:ende