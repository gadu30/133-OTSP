.ORIG x3000

	LD R0, VAR
	STI R0, LOC
	TRAP x21

	HALT

VAR .FILL x41
LOC .FILL x4000

.END