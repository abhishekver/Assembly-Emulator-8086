; multi-segment executable file template.

data segment
    arr db 12h, 15h, 17h, 29h,18h, 19h, 21h, 28h
    max db 00h
    min db 50h
ends


code segment
start:

    mov ax, data
    mov ds, ax
            
    lea si, arr
    mov cx, 8
    mov dx, 0000
    
    l1:     
        mov al, [si] 
        
        cmp al, max
        jl next2:
        mov max, al
        
        next2: 
            cmp al, min
            jg next   
            mov min, al
        
        next:
        inc si
    loop l1     
    
    mov bh, max
    mov bl, min
    
ends

end start 
