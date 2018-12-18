; multi-segment executable file template.

data segment
    arr db 12h, 15h, 17h, 20h,18h, 19h, 21h, 28h
ends


code segment
start:

    mov ax, data
    mov ds, ax
            
    lea si, arr
    mov cx, 8
    mov dx, 0000
    mov bl, 02h
    
    l1:     
        mov al, [si] 
        mov ah, 00
        div bl
        cmp ah,00
        jz even
        
        odd:
            add dh, [si]
            jmp next
        even:
            add dl, [si] 
        
        next:
        inc si
    loop l1
ends

end start 
