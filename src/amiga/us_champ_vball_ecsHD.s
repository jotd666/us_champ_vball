; US Championship V'ball slave
	INCDIR	Include:
	INCLUDE	whdload.i
	INCLUDE	whdmacros.i



EXPMEM = $180000
CHIPSIZE = $100000

_base	SLAVE_HEADER					; ws_security + ws_id
	dc.w	17					; ws_version (was 10)
	dc.w	WHDLF_NoError
    IFEQ RELEASE
	dc.l	$200000					; ws_basememsize
	ELSE
	dc.l	CHIPSIZE
	ENDC
	dc.l	0					; ws_execinstall
	dc.w	start-_base		; ws_gameloader
	dc.w	_data-_base					; ws_currentdir
	dc.w	0					; ws_dontcache
_keydebug
	dc.b	$0					; ws_keydebug
_keyexit
	dc.b	$59					; ws_keyexit
_expmem
    IFEQ RELEASE
    dc.l    $700000
    ELSE
	dc.l	EXPMEM					; ws_expmem
    ENDC
	dc.w	_name-_base				; ws_name
	dc.w	_copy-_base				; ws_copy
	dc.w	_info-_base				; ws_info
    dc.w    0     ; kickstart name
    dc.l    $0         ; kicksize
    dc.w    $0         ; kickcrc
    dc.w    _config-_base
;---
_config
;	dc.b	"C1:X:invincible:0;"
;	dc.b	"C1:X:infinite lives:1;"
	dc.b	"C1:X:cheat keys:4;"
	dc.b	"C2:X:50 Hz update:0;"
	dc.b	"C2:X:win in 7 points:1;"
	dc.b	"C3:L:difficulty level:easy,medium,hard,very hard;"
	dc.b	"C4:L:start level:Daytona,New York,Los Angeles,Hawaii,Daytona 2,New York 2,Los Angeles 2,Hawaii 2,Air Base;"

	dc.b	0

	IFD BARFLY
	DOSCMD	"WDate  >T:date"
	ENDC

DECL_VERSION:MACRO
	dc.b	"1.1"
	IFD BARFLY
		dc.b	" "
		INCBIN	"T:date"
	ENDC
	IFD	DATETIME
		dc.b	" "
		incbin	datetime
	ENDC
	ENDM
_data   dc.b    "data",0
_name	dc.b	"US Championship Volleyball ECS"
	IFEQ	RELEASE
	dc.b	" (dev mode)"
	ENDC
		dc.b	0
_copy	dc.b	'2025 JOTD',0
_info
    dc.b    "Original by Technos 1988",0
	dc.b	0
_kickname   dc.b    0
;--- version id

    dc.b	0
    even

start:
	LEA	_resload(PC),A1
	MOVE.L	A0,(A1)
	move.l	a0,a2

	;setup cache: max cache everywhere
	move.l	#WCPUF_Base_NC|WCPUF_Exp_CB|WCPUF_Slave_CB|WCPUF_IC|WCPUF_DC|WCPUF_BC|WCPUF_SS|WCPUF_SB,d0
	move.l	#WCPUF_All,d1
	jsr	(resload_SetCPU,a2)
   

	move.l	_expmem(pc),a0
	add.l	#EXPMEM,a0
	move.l 	a0,a7		; top of fastmem

    lea progstart(pc),a0
    move.l  _expmem(pc),(a0)

	lea	exe(pc),a0
	move.l  progstart(pc),a1
	jsr	(resload_LoadFileDecrunch,a2)
	move.l  progstart(pc),a0
    bsr   _Relocate
	move.l	_resload(pc),a0
    move.l  #'WHDL',d0
    move.b  _keyexit(pc),d1
	move.l  progstart(pc),-(a7)
    
    lea  _custom,a1
    move.w  #$1200,bplcon0(a1)
    move.w  #$0024,bplcon2(a1)
	

    rts
	
_Relocate	movem.l	d0-d1/a0-a2,-(sp)
        clr.l   -(a7)                   ;TAG_DONE
;        pea     -1                      ;true
;        pea     WHDLTAG_LOADSEG
		IFND		CHIP_ONLY
        move.l  #$400,-(a7)       ;chip area
        pea     WHDLTAG_CHIPPTR        
        pea     8                       ;8 byte alignment
        pea     WHDLTAG_ALIGN
		ENDC
        move.l  a7,a1                   ;tags	
		move.l	_resload(pc),a2
		jsr	resload_Relocate(a2)
		IFND		CHIP_ONLY
        add.w   #5*4,a7
		ELSE
		addq.w	#4,a7
		ENDC
		
        movem.l	(sp)+,d0-d1/a0-a2
		rts

_resload:
	dc.l	0
progstart
    dc.l    0

exe:
	dc.b	"us_champ_vball_000",0

	