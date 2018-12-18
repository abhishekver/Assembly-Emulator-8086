; multi-segment executable file template.

data segment          
    
    v_lays db 20h, 0fh
    v_dairy_milk db 15h, 14h
    v_coke db 10h, 19h
    v_cookies db 15h, 0ah 
    
    str db 3 dup('$') 
    choice db dup('$')
    quantity db dup('$')
    price db dup('$')
    bill db dup('$')  
    select dw dup('$')   
    
ends

code segment
start:
    
    include 'emu8086.inc'
    mov ax, data
    mov ds, ax
    mov es, ax 
    cld
    
    jmp MAIN
            
    ;Definition for all the procedures used in the program
                
        ;Procedure to print new line
                        
            NewLine PROC
                
                push ax
                push dx
                    mov dl, 10
                    mov ah, 02h
                    int 21h
                    mov dl, 13
                    mov ah, 02h
                    int 21h  
                    mov ax, 00
                pop dx  
                pop ax
              ret
                
            NewLine endp            
                         
                         
                         
        ;Procedure to take input
            
            Input proc
                        
                mov ah, 01h
                int 21h
                
                sub al,30h
                cmp al,9
                jle nxt
                    sub al, 7                    
                    cmp al, 9
                    jle nxt
                        sub al, 32
                        cmp al, 9                         
                        jle nxt
                            add al, 87
                        
                nxt:
                ret
                
            Input endp   
            
            
                         
        ;Procedure to convert number to string
        
            proc num2str 
                
                push si
                
                 mov  bx, 10
                 mov  cx, 0 
                  
                 cycle1:       
                     
                     mov  dx, 0 
                     div  bx 
                     push dx 
                     inc  cx 
                     cmp  ax, 0  
                     
                 jne  cycle1     
                  
                 
                 ;NOW RETRIEVE PUSHED DIGITS.
                  
                 mov  si, offset str
                 
                 cycle2:  
                 
                      pop  dx        
                      add  dl, 48 
                      mov  [ si ], dl
                      inc  si
                 
                 loop cycle2  
                pop si
                 ret
            num2str endp   
            
            
        ;Procedure to print the contents of the register
        
            printr proc
                
                  push ax
                    mov ah, 00
                    call num2str
        
                    mov ah,9  
                    mov dx, offset str
                    mov dh, 00
                    int 21h
                  pop ax 
                
                ret   
                
            printr endp
            
    ;Procedure Definitions End            
              
              
    MAIN:                         
    
    print 'Welcome to our vending machine '    
    call NewLine
    print 'We offer you variety of eatables to survive from the bad hostel food'   
    call NewLine  
    call NewLine
   

    CHOOSE:    

            print 'Please enter the number in front of the item you want:'
            call NewLine
            call NewLine
            print 'For now we have the following options : '
            call NewLine
            print '1: Lays'
            call NewLine
            print '2: Dairy Milk'
            call NewLine
            print '3: Coke'
            call NewLine
            print '4: Cookies'
            call NewLine
            call NewLine
            print 'Please enter your choice'
            call NewLine  
                
            call Input     
            call NewLine
            
            mov choice, al   
            
            cmp choice, 01
            jz LAYS
            
            cmp choice, 02
            jz DAIRY_MILK 
            
            cmp choice, 03
            jz COKE
            
            cmp choice, 04
            jz COOKIES
            
            print 'You have selected a wrong option'
            call NewLine

        jmp CHOOSE
        
        LAYS:
        
            print 'You have selected Lays'
            lea si, v_lays
            
        jmp SHOP    
        
        DAIRY_MILK:
        
            print 'You have selected Dairy Milk'
            lea si, v_dairy_milk
        
        jmp SHOP                
                
        COKE:
        
            print 'You have selected Coke'
            lea si, v_coke
        
        jmp SHOP
        
        COOKIES:
        
            print 'You have selected Cookies'
            lea si, v_cookies
        
        jmp SHOP
        
    
    
    
    SHOP:        
    
          call NewLine
          print 'Current available quantity is:  '
          mov al, [si]  
          call printr       
           
          call NewLine
          print 'Current price of the item is: '
          mov al, [si+1]
          mov price, al
          call printr        
          
          call NewLine 
          call NewLine 
          print 'Enter the quantity you want, Max=5'
          call NewLine 
          call Input       
          mov quantity, al          
                                      
          cmp al, 5
          jle BILLING
          
          call NewLine 
          print 'The quantity exceeds the max limit, Please try again!!  '
          jmp SHOP
                
                
                
    BILLING:
    
          mov al, price
          mul quantity
          mov bill, al
          
          mov bl, quantity
          sub [si], bl
          call NewLine 
          call NewLine
          print 'Your billing amount is: '           
          call printr      
                              
          call NewLine
          print 'Please enter a single note, from the accepted note range'
          call NewLine                                                    
          print 'For now, we only accept rupee 20, 50 and 100 note '
          call NewLine                                          
          print 'Enter 1: for 20 or 2: for 50 or 3: for 100'
          call NewLine                         
          call Input
          
            cmp al, 01
            jz l1
            cmp al, 02
            jz l2                  
            cmp al, 03  
            jz l3          
            call NewLine
            print 'Invalid amount'            
            jmp BILLING
            
            l1:
                mov al, 20
                jmp l4
            
            l2:
                mov al, 50
                jmp l4
            
            l3: 
                mov al, 100
           
          l4:                                       
          
          cmp al, bill
          jge l5                              
          call NewLine
          print 'The amount is not sufficient'
          jmp BILLING
  
  
       l5:
               
          sub al, bill
          call NewLine            
          print 'Here is your change: '
          call NewLine
          call printr           
          
                    
          call NewLine
          print 'Do you want to buy more. y/n '
          call Input
            
          cmp al, 'y'
          call NewLine
          jz CHOOSE        
          print 'Thank you for shoping with us'            
    
ends     

end start 