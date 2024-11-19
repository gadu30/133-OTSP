.ORIG x3000
    
    LEA R0, int_array          
    LD R1, dest_of_array       
    AND R2, R2, #0            
    ADD R2, R2, #5            
    
COPY_LOOP
    LDR R3, R0, #0            
    STR R3, R1, #0            
    ADD R0, R0, #1            
    ADD R1, R1, #1            
    ADD R2, R2, #-1           
    BRp COPY_LOOP             
    
    
    LD R0, dest_of_array       
    AND R1, R1, #0           
    ADD R1, R1, #4            
    
OUTER_LOOP
    AND R2, R2, #0            
    ADD R2, R2, R1            
    LD R3, dest_of_array       
    
INNER_LOOP
    LDR R4, R3, #0           
    LDR R5, R3, #1            
    NOT R6, R5
    ADD R6, R6, #1            
    ADD R6, R4, R6            
    BRnz NO_SWAP              
    
    
    STR R5, R3, #0            
    STR R4, R3, #1            
    
NO_SWAP
    ADD R3, R3, #1            
    ADD R2, R2, #-1          
    BRp INNER_LOOP           
    
    ADD R1, R1, #-1           
    BRp OUTER_LOOP           
    
    HALT                     

int_array   .FILL #7
            .FILL #4
            .FILL #1
            .FILL #6
            .FILL #3
dest_of_array .FILL x6000    
.END