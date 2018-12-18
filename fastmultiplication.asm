
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al, 1001b
mov bl, 1101b
mov cl, 1000b
mov dx, 0000b

loop:   cmp cl,0000b
        jz out 
    
        dec cl
        shl dx, 1
        shl bl, 1
    
        jnc noadd
        add dx, ax
    
        noadd:
    jmp loop
out:

ret




