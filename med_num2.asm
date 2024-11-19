.ORIG x3000
    
    LEA R0, orig_str        
    LD R1, orig_add        
    
COPY_LOOP
    LDR R2, R0, #0         
    BRz END_COPY           
    STR R2, R1, #0         
    ADD R0, R0, #1         
    ADD R1, R1, #1         
    BR COPY_LOOP          
    
END_COPY
    
    LD R0, orig_add        
    LD R1, dest_add        
    
    
    AND R2, R2, #0         
COUNT_LOOP
    LDR R3, R0, #0         
    BRz END_COUNT         
    ADD R2, R2, #1         
    ADD R0, R0, #1        
    BR COUNT_LOOP
    
END_COUNT
    LD R0, orig_add        
    ADD R0, R0, R2         
    ADD R0, R0, #-1        
    
REVERSE_LOOP
    LDR R3, R0, #0        
    STR R3, R1, #0         
    ADD R0, R0, #-1        
    ADD R1, R1, #1         
    ADD R2, R2, #-1        
    BRp REVERSE_LOOP       
    
    AND R3, R3, #0         
    STR R3, R1, #0         

    HALT                   

orig_str .STRINGZ "racecar"
orig_add .FILL x4000
dest_add .FILL x4100
.END