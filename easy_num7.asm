.ORIG x3006

VAL1    .FILL #4
VAL2    .FILL #7

        LD R0, VAL1
        LD R1, VAL2

        NOT R2, R0
        ADD R2, R2, #1
        ADD R3, R1, R2

        BRp LARGER_VAL2
        ST R0, LARGER_NUM
        BR DONE

LARGER_VAL2:
        STI R1, LARGER_NUM

DONE    HALT

LARGER_NUM .FILL x3008

        .END