.ORIG x3000

	LD R0, NUM1
	AND R1, R1, #0

	ADD R1, R0, #0
	ADD R1, R1, R0
	ADD R1, R1, R0

	STI R0, LOC
	STI R1, RESULT

	HALT

NUM1 .FILL #5
LOC .FILL x3000
RESULT .FILL x3001

.END