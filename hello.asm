
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 1000h
mov ds, ax
mov es, ax

mov di, 0000h
mov al, 'H'
stosb
mov al, 'E'
stosb
mov al, 'A'
stosb
mov al, 'K'
stosb
mov al, 'H'
stosb
mov al, 'E'
stosb
mov al, 'L'
stosb
mov al, 'L'
stosb
mov al, 'O'
stosb
mov al, 'H'
stosb 

mov di, 0000H
mov cx, 10h

l1:
        mov al, 'H' 
        scasb
        jnz l1:
        mov al, 'E' 
        scasb
        jnz l1:
        mov al, 'L' 
        scasb
        jnz l1:
        mov al, 'L' 
        scasb
        jnz l1:
        mov al, 'O' 
        scasb
        jnz l1:
        sub di, 0005h
        mov dx, di

ret




