* Generated with 6502to68k by JOTD
*
* include file which contains generic macros
* and also macros that the user must fill/tune


	.include	"breakpoint.inc"
	
	.ifdef	RELEASE
OPT_FIXED_RANDOM = 0   | DO NOT CHANGE
	.else
OPT_FIXED_RANDOM = 1   | set to 1 to fix random (MAME: bpset D00A,,{A=0;PC=AFFE;g})
	.endif
	
    .macro    ERROR    arg
    *.error    "\arg"     | comment out to disable errors
    .endm

	.ifdef	MC68020
* 68020 optimized
	.macro PUSH_SR
	move.w	ccr,-(sp)
	.endm

	.macro READ_LE_WORD    srcreg
	PUSH_SR
	moveq    #0,d4
	move.w    (\srcreg),d4
	rol.w    #8,d4
* we have to use long else it will
* extend sign for > 0x7FFF and will compute wrong offset
	move.l    d4,\srcreg
	POP_SR
	.endm

	.else
* 68000 compliant
	.macro PUSH_SR
	move.w	sr,-(sp)
	.endm

	.macro READ_LE_WORD    srcreg
	PUSH_SR
	moveq    #0,d4
	move.b    (1,\srcreg),d4
	lsl.w    #8,d4
	move.b    (\srcreg),d4
* we have to use long else it will
* extend sign for > 0x7FFF and will compute wrong offset
	move.l    d4,\srcreg
	POP_SR
	.endm

	.endif

	.macro POP_SR
	move.w	(sp)+,ccr
	.endm

	.macro	SET_Z_FLAG
	cmp.b	d4,d4
	.endm
	
	.macro OP_R_ON_ZP_ADDRESS	inst,offset,reg
	\inst\().b	(a6,\offset\().W),\reg
	.endm

	.macro OP_W_ON_ZP_ADDRESS	inst,offset,reg
	\inst\().b	\reg,(a6,\offset\().W)
	.endm

	.macro	SBC_X	address
	INVERT_XC_FLAGS
	GET_ADDRESS	\address
	move.b	(a0,d1.w),d4
	SET_Z_FLAG		| set Z flag as subx never sets it!
	subx.b	d4,d0
	INVERT_XC_FLAGS
	.endm
	
	.macro	SBC_Y	address
	INVERT_XC_FLAGS
	GET_ADDRESS	\address
	move.b	(a0,d2.w),d4
	SET_Z_FLAG		| set Z flag as subx never sets it!
	subx.b	d4,d0
	INVERT_XC_FLAGS
	.endm
	
	.macro	SBC	address
	INVERT_XC_FLAGS
	GET_ADDRESS	\address
	move.b	(a0),d4
	SET_Z_FLAG		| set Z flag as subx never sets it!
	subx.b	d4,d0
	INVERT_XC_FLAGS
	.endm

	.macro	SBC_IND_Y	address
	INVERT_XC_FLAGS
	GET_INDIRECT_ADDRESS	\address
	move.b	(a0,d2.w),d4
	SET_Z_FLAG		| set Z flag as subx never sets it!
	subx.b	d4,d0
	INVERT_XC_FLAGS
	.endm

	.macro	SBCD_DIRECT	address
	INVERT_XC_FLAGS
	GET_ADDRESS	\address
	move.b	(a0),d4
	SET_Z_FLAG
	scbd	d4,d0
	INVERT_XC_FLAGS
	.endm
	
	.macro	SBC_IMM	param
	INVERT_XC_FLAGS
	move.b	#\param,d4
	SET_Z_FLAG		| set Z flag as subx never sets it!
	subx.b	d4,d0
	INVERT_XC_FLAGS
	.endm

	.macro	SBCD_IMM	param
	INVERT_XC_FLAGS
	move.b	#\param,d4
	SET_Z_FLAG
	sbcd	d4,d0
	INVERT_XC_FLAGS
	.endm

	.macro INVERT_XC_FLAGS
	eor.b	#0x11,ccr
	.endm

	.macro	TXS
	lea		stack_top,a7
	.endm
* useful to recall C from X (add then move then bcx)
	.macro	SET_C_FROM_X
	PUSH_SR
	move.w	(sp),d4
	bset	#0,d4   | set C
	btst	#4,d4
	bne.b	0f
	bclr	#0,d4   | X is clear: clear C
0:
	move.w	d4,(sp)
	POP_SR
	.endm

	.macro	SET_X_FROM_CLEARED_C
	PUSH_SR
	move.w	(sp),d4
	bset	#4,d4   | set X
	btst	#0,d4
	beq.b	skip\@
	bclr	#4,d4   | C is set: clear X
skip\@:
	move.w	d4,(sp)
	POP_SR
	.endm

* N and V flag set on bits 7 and 6 is now supported
	.macro    BIT    arg
	move.b    d0,d4
	and.b    \arg,d4	| zero flag
	PUSH_SR
	move.b	\arg,d4
	move.w	(a7),d3
	bclr	#3,d3
	tst.b	d4
	jpl		pos\@
	bset	#3,d3	| set N
pos\@:
	bclr	#1,d3
	btst.b	#6,d4
	jeq		b6\@
	bset	#1,d3	| set V
b6\@:
	move.w	d3,(a7)
	POP_SR
	.endm

	.macro CLR_XC_FLAGS
	and.b	#0xEE,ccr		| bit 4 = X, bit 0 = C
	.endm
	
	.macro SET_XC_FLAGS
	or.b	#0x11,ccr		| bit 4 = X, bit 0 = C
	.endm

	.macro CLR_V_FLAG
	and.b	#0xFD,ccr		| bit 1 = V
	.endm
	
	.macro SET_V_FLAG
	or.b	#0x2,ccr		| bit 1 = V
	.endm
	
	.macro	SET_NV_FLAGS 
	or.b	#0xA,ccr		| bit 1 = V, bit 3 = N
	.endm
	

	.macro SET_I_FLAG
	.endm
	.macro CLR_I_FLAG
	.endm


	.macro	VIDEO_BYTE_DIRTY
	jbsr	osd_video_byte_dirty
	.endm
	.macro	MAYBE_VIDEO_BYTE_DIRTY
	move.l	a0,a5
	sub.l	a6,a5
	cmp.w	#0x2000,a5
	jcs		skip\@
	cmp.w	#0x4000,a5
	jcc		skip\@
	VIDEO_BYTE_DIRTY
skip\@:
	.endm

	.macro GET_ADDRESS	offset
	lea	\offset,a0
	GET_ADDRESS_FUNC
	.endm

	.macro GET_UNCHECKED_ADDRESS	offset
	lea	\offset,a0
	lea		(a6,a0.l),a0
	.endm
	
	.macro	PREP_GET_ADDRESS_X	offset
	.ifgt	\offset-0x8000
	lea	\offset,a0
	.else
	lea	\offset\().w,a0
	.endif
	GET_ADDRESS_FUNC
	lea	(a0,d1.w),a0
	READ_LE_WORD	a0
	.endm
	
	.macro GET_ADDRESS_X	offset
	PREP_GET_ADDRESS_X	\offset
	GET_ADDRESS_FUNC
	.endm
	.macro GET_UNCHECKED_ADDRESS_X	offset
	PREP_GET_ADDRESS_X	\offset
	GET_UNCHECKED_ADDRESS_FUNC
	.endm

	.macro GET_INDIRECT_ADDRESS	offset
	GET_ADDRESS	\offset
	READ_LE_WORD	a0
	GET_ADDRESS_FUNC
	.endm
	.macro GET_INDIRECT_UNCHECKED_ADDRESS	offset
	GET_ADDRESS	\offset
	READ_LE_WORD	a0
	GET_UNCHECKED_ADDRESS_FUNC
	.endm
	.macro	GET_UNCHECKED_ADDRESS_FUNC
	lea		(a6,a0.l),a0
	.endm
	.ifdef	RELEASE
	.macro	GET_ADDRESS_FUNC
	GET_UNCHECKED_ADDRESS_FUNC
	.endm
	.else
	.macro	GET_ADDRESS_FUNC
	jbsr	get_address
	.endm

* dev mode, more checks about the address
get_address:
	cmp.l	#0x8000,a0
	jcc		10f		| rom: ok

	* 0X2000 <= range < 0x4000, video ram
	cmp.w	#0x4000,a0
	jcc	10f
	cmp.w	#0x2000,a0
	jcs		10f
	* 0X2000 <= range < 0x4000, video ram
	* video/attribute: must be done without "get_address"
	jbsr	osd_get_last_known_pc
	BREAKPOINT	"unsupported address range 0x2000-0x3FFF, PC in D6"
	jra		10f
10:
	GET_UNCHECKED_ADDRESS_FUNC
	rts

	.endif

	.macro	PUSH_TABLE_X_ADDRESS	table
	lea		\table,a0
	and.w	#0xFF,d1
	.ifdef	MC68020
	move.l	(a0,d1.w*2),-(a7)
	.else
	add.w	d1,d1
	move.l	(a0,d1.w),-(a7)
	.ifndef	RELEASE
	lsr.w	#1,d1
	.endif
	.endif
	.endm

	.macro	PUSH_TABLE_Y_ADDRESS	table
	lea		\table,a0
	and.w	#0xFF,d2
	.ifdef	MC68020
	move.l	(a0,d2.w*2),-(a7)
	.else
	add.w	d2,d2
	move.l	(a0,d2.w),-(a7)
	.ifndef	RELEASE
	lsr.w	#1,d2
	.endif
	.endif
	.endm

