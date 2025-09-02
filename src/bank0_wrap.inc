	.include	"breakpoint.inc"
	
	.ifndef	RELEASE
	.macro	BANK1_WRAP	arg
rom_\arg:
	st.b	disable_bank_0_check	
	*BREAKPOINT	"BANK01 \arg"
	jbsr	l_\arg
	clr.b	disable_bank_0_check
	rts
	.endm
	.else
	.macro	BANK1_WRAP	arg
rom_\arg = l_\arg
	.endm
	.endif
