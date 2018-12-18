
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 1101101100110010b
mov cl, 00b              
loop:
    shl ax, 01
    jnc noinc
    add cx, 01
    
noinc:
    cmp ax,00b
    jnz loop
out:

ret




