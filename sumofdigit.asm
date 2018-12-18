
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

include 'emu8086.inc'    

mov cx, 04h

inp:    mov ah, 01h
        int 21h          

        sub al, 30h    
        mov bl, al
        mov ax, dx
        mov dx, 10h
        mul dx     
        
        mov bh, 00h
        add ax, bx
        mov dx, ax
    loop inp
    
mov ax, dx    
mov bx, 0000h
mov cx, 0010h
mov dx, 0000h

l1:          
        mov bx, 10h
        div bx 
        
        pop bx
        add bx, dx
        push bx
        mov dx, 0000h
    loop l1
    
print 'Sum is'
print bx 

ret
