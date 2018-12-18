
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 1146h
shr ax, 01h
jnc con2   
mov bx,01h
con2:

ret