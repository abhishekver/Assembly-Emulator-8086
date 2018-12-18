
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 9000h
mov ds, ax
mov ax, 0C100h
mov es, ax   

mov si, 0513h
mov di, 0009h
mov cx, 1024

rep movsw

ret




