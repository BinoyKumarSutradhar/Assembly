.MODEL SMALL
.STACK 100H 
.DATA 
    N DB 0
    S DB 0
    I DB 0
    B DB 0
    TEMP DB 0
    mm db 'Do you want to give a negative number?    Press y for yes n for no$'
    mmm db 'Enter the Number$'
    mmmm db 0

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    mov ah,9
    lea dx,mm
    int 21h
     
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    mov ah,1
    int 21h
    mov mmmm,al
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    mov ah,9
    lea dx,mmm
    int 21h
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    mov dx,0
    
    cmp mmmm,'y'
    jne FOR
    
    
    mov ah,1
    int 21h 
    mov dx,0
  
   
    FOR:
        
        MOV AH,1
        INT 21H
        CMP AL,0DH
        JE END_FOR
        SUB AL,48
        MOV N,AL
        MOV AL,10
        MUL DL
        ADD AL,N
        MOV DL,AL
        JMP FOR
    END_FOR:
    
    
    cmp mmmm,'y'
    jne fl
    
    mov al,-1
    imul dl
    
    mov dl,al
    
    
    fl:
             
    MOV S,DL 
     MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV I,0
    MOV B,0
    
    TEST S,1
    JZ B_0
    
    MOV B,1
    JMP EXIT
    
    B_0:
    
        MOV B,0
        
    EXIT:
        
    MOV AH,2
    MOV DL,B
    ADD DL,48
    INT 21H 
    
    WHILE:
        CMP S,0
        JE END_WHILE 
        
                
        MOV CL,B
        SUB S,CL
        
        
        SAR S,1
        MOV AL,-1
        IMUL S
        
        MOV S,AL
        
        
        TEST S,1
        JZ   B_00
        
        MOV B,1
        JMP EXIT1 
        
        B_00:
    
        MOV B,0
        
        EXIT1:
        CMP S,0
        JE END_WHILE 
            MOV AH,2
            MOV DL,B
            ADD DL,48            
            INT 21H 
            JMP WHILE
        
    END_WHILE:
mov ah, 02h         ; DOS Display character call 
;mov dl, 20h         ; A space to clear old character 
;int 21h             ; Display it  
mov dl, 08h         ; Another backspace character to move cursor back again
int 21h             ; Display it 
  ;            
;    CMP DL,0
;    JE IF1
   
          
    
          
          
   
   
   
  
    ;
;    MOV AH,2
;    MOV DL,0AH
;    INT 21H
;    MOV DL,0DH
;    INT 21H
;    
;    
    
    ;MOV AH,2
    ;MOV DL,S
    ;INT 21H   
  ;///////////////////////////////////////////
  
  ;
;  
;    IF1:
;    MOV S,0
;    SUB S,48
;    MOV AH,2
;    MOV DL,S
;    INT 21H
;    JMP END_IF
;    END_IF:
    
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
    END MAIN