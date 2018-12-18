
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov cx, 0010d
mov ax, 0000d
   
l1: add ax,cx
    loop l1

ret




