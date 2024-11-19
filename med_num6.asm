.ORIG x3000

    
AND R1, R1, #0      
    
ADD R1, R1, #15      
    
STI R1, DIVIDEND_ADDR    

    
AND R1, R1, #0      
    
ADD R1, R1, #3      
    
STI R1, DIVISOR_ADDR     

    
LDI R0, DIVIDEND_ADDR    
    
LDI R1, DIVISOR_ADDR    
        
       
        ADD R1, R1, #0
        BRz DIV_BY_ZERO
        
        
        AND R2, R2, #0      
        ADD R3, R0, #0     
        
        
        ADD R0, R0, #0
        BRn NEG_DIVIDEND
        
DIV_LOOP
       
        ADD R4, R3, #0      
        NOT R5, R1         
        ADD R5, R5, #1      
        ADD R4, R4, R5     
        BRn DIV_DONE       
        
        ADD R2, R2, #1      
        ADD R3, R4, #0     
        BR DIV_LOOP         
        
DIV_DONE
        
        LD R0, QUOTIENT_ADDR
        STR R2, R0, #0
        
        
        LD R0, REMAINDER_ADDR
        STR R3, R0, #0
        BR DONE
        
NEG_DIVIDEND
       
        NOT R0, R0          
        ADD R0, R0, #1     
        ADD R3, R0, #0      
        BR DIV_LOOP
        
DIV_BY_ZERO
        
        LD R0, QUOTIENT_ADDR
        AND R1, R1, #0
        ADD R1, R1, #-1
        STR R1, R0, #0
        
        LD R0, REMAINDER_ADDR
        STR R1, R0, #0
        
DONE    HALT

DIVIDEND_ADDR   .FILL x320A    
DIVISOR_ADDR    .FILL x320B   
QUOTIENT_ADDR   .FILL x320C   
REMAINDER_ADDR  .FILL x320D   
.END