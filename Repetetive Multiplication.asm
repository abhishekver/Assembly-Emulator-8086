
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AL, 34H
MOV CL, 10H
MOV BX, 0000H
LOOP1: ADD BX,AX
       LOOP LOOP1

ret




