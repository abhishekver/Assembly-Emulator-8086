
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AL, -13H
MOV BL, 05H
IMUL BL

ret




