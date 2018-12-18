
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX, 1180H
MOV BX, 0534H
MOV CX, 00H

LOOP1:  SUB AX,BX
        INC CX
        CMP AX,BX
        JNC LOOP1
ret




