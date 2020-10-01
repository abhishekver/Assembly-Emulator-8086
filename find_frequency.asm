
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 1000h;
mov es, ax
mov ds, ax
mov di, 1000h

mov ax, 'AE'
stosw       
mov ax, 'BC'
stosw
mov ax, 'DE'
stosw
mov ax, 'EE'
stosw
mov ax, 'BE'
stosw

mov di, 1000h
mov cx, 0010
mov bl, 00h   
mov al, 'E' 

loop1:    
        scasb
        jnz loop2
        inc bl
loop2:
        loop loop1

ret




