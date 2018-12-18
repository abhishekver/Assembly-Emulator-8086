
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 7000h
mov es, ax   
mov di, 0000h
mov ax, 0adadh

mov cx, 4096h
rep stosw

ret




