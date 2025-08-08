; US Championship Volleyball
; disassembly by JOTD (c) 2025
;
;	map(0x0000, 0x07ff).ram();
;	map(0x0800, 0x08ff).ram().share(m_spriteram);
;	map(0x1000, 0x1000).portr("P1");
;	map(0x1001, 0x1001).portr("P2");
;	map(0x1002, 0x1002).portr("SYSTEM");
;	map(0x1003, 0x1003).portr("DSW1");
;	map(0x1004, 0x1004).portr("DSW2");
;	map(0x1005, 0x1005).portr("P3");
;	map(0x1006, 0x1006).portr("P4");
;	map(0x1008, 0x1008).w(FUNC(vball_state::scrollx_hi_w));
;	map(0x1009, 0x1009).w(FUNC(vball_state::bankswitch_w));
;	map(0x100a, 0x100b).w(FUNC(vball_state::irq_ack_w));  // is there a scanline counter here?
;	map(0x100c, 0x100c).w(FUNC(vball_state::scrollx_lo_w));
;	map(0x100d, 0x100d).w("soundlatch", FUNC(generic_latch_8_device::write));
;	map(0x100e, 0x100e).writeonly().share(m_scrolly_lo);
;	map(0x2000, 0x2fff).w(FUNC(vball_state::videoram_w)).share(m_videoram);
;	map(0x3000, 0x3fff).w(FUNC(vball_state::attrib_w)).share(m_attribram);
;	map(0x4000, 0x7fff).bankr(m_mainbank);
;	map(0x8000, 0xffff).rom();

nb_credits_0035 = $35

p1_1000 = $1000
p2_1001 = $1001
system_1002 = $1002
dsw1_1003 = $1003
dsw2_1004 = $1004
scrollx_hi_1008 = $1008
bankswitch_1009 = $1009
irq_ack_100a = $100a
irq_ack_100b = $100b
scrollx_lo_100c = $100c
sound_100d = $100d
scrolly_lo_100e = $100e

bankswitch_copy_022d = $022d

; code from bank 0

5BF6: 48       pha
5BF7: 8A       txa
5BF8: 48       pha
5BF9: 98       tya
5BFA: 48       pha
5BFB: A5 46    lda $46
5BFD: 29 08    and #$08
5BFF: F0 03    beq $5c04
5C01: 4C E0 5C jmp $5ce0
5C04: A5 47    lda $47
5C06: 30 1F    bmi $5c27
5C08: A5 56    lda $56
5C0A: 30 0F    bmi $5c1b
5C0C: A9 00    lda #$00
5C0E: 85 00    sta $00
5C10: 85 01    sta $01
5C12: 20 FD 5C jsr $5cfd
5C15: A5 56    lda $56
5C17: 09 80    ora #$80
5C19: 85 56    sta $56
5C1B: A9 00    lda #$00
5C1D: 85 00    sta $00
5C1F: 85 01    sta $01
5C21: 20 AE 62 jsr $62ae
5C24: 4C 6A 5C jmp $5c6a
5C27: A5 56    lda $56
5C29: 30 3F    bmi $5c6a
5C2B: 09 80    ora #$80
5C2D: 85 56    sta $56
5C2F: A5 4F    lda $4f
5C31: 30 0B    bmi $5c3e
5C33: A9 15    lda #$15
5C35: 8D 16 03 sta $0316
5C38: 8D 17 03 sta $0317
5C3B: 4C 6A 5C jmp $5c6a
5C3E: A5 56    lda $56
5C40: 29 0F    and #$0f
5C42: C9 09    cmp #$09
5C44: F0 1C    beq $5c62
5C46: A5 56    lda $56
5C48: 29 3F    and #$3f
5C4A: C9 03    cmp #$03
5C4C: F0 09    beq $5c57
5C4E: C9 04    cmp #$04
5C50: F0 05    beq $5c57
5C52: A9 14    lda #$14
5C54: 4C 64 5C jmp $5c64
5C57: A5 53    lda $53
5C59: C9 01    cmp #$01
5C5B: D0 F5    bne $5c52
5C5D: A9 0B    lda #$0b
5C5F: 4C 64 5C jmp $5c64
5C62: A9 00    lda #$00
5C64: 8D 16 03 sta $0316
5C67: 8D 17 03 sta $0317
5C6A: A5 48    lda $48
5C6C: 30 25    bmi $5c93
5C6E: A5 56    lda $56
5C70: 29 40    and #$40
5C72: D0 11    bne $5c85
5C74: A9 01    lda #$01
5C76: 85 00    sta $00
5C78: A9 10    lda #$10
5C7A: 85 01    sta $01
5C7C: 20 FD 5C jsr $5cfd
5C7F: A5 56    lda $56
5C81: 09 40    ora #$40
5C83: 85 56    sta $56
5C85: A9 01    lda #$01
5C87: 85 00    sta $00
5C89: A9 02    lda #$02
5C8B: 85 01    sta $01
5C8D: 20 AE 62 jsr $62ae
5C90: 4C DA 5C jmp $5cda
5C93: A5 56    lda $56
5C95: 29 40    and #$40
5C97: D0 41    bne $5cda
5C99: A5 56    lda $56
5C9B: 09 40    ora #$40
5C9D: 85 56    sta $56
5C9F: A5 4F    lda $4f
5CA1: 30 0B    bmi $5cae
5CA3: A9 15    lda #$15
5CA5: 8D 18 03 sta $0318
5CA8: 8D 19 03 sta $0319
5CAB: 4C DA 5C jmp $5cda
5CAE: A5 56    lda $56
5CB0: 29 0F    and #$0f
5CB2: C9 09    cmp #$09
5CB4: F0 1C    beq $5cd2
5CB6: A5 56    lda $56
5CB8: 29 3F    and #$3f
5CBA: C9 13    cmp #$13
5CBC: F0 09    beq $5cc7
5CBE: C9 14    cmp #$14
5CC0: F0 05    beq $5cc7
5CC2: A9 14    lda #$14
5CC4: 4C D4 5C jmp $5cd4
5CC7: A5 53    lda $53
5CC9: C9 01    cmp #$01
5CCB: D0 F5    bne $5cc2
5CCD: A9 0B    lda #$0b
5CCF: 4C D4 5C jmp $5cd4
5CD2: A9 00    lda #$00
5CD4: 8D 18 03 sta $0318
5CD7: 8D 19 03 sta $0319
5CDA: 68       pla
5CDB: A8       tay
5CDC: 68       pla
5CDD: AA       tax
5CDE: 68       pla
5CDF: 60       rts
5CE0: A5 56    lda $56
5CE2: 09 C0    ora #$c0
5CE4: 85 56    sta $56
5CE6: A0 00    ldy #$00
5CE8: A9 15    lda #$15
5CEA: 99 16 03 sta $0316, y
5CED: B9 0A 03 lda $030a, y
5CF0: 29 7F    and #$7f
5CF2: 99 0A 03 sta $030a, y
5CF5: C8       iny
5CF6: C0 04    cpy #$04
5CF8: 90 EE    bcc $5ce8
5CFA: 4C DA 5C jmp $5cda
5CFD: A5 4F    lda $4f
5CFF: 30 15    bmi $5d16
5D01: 4A       lsr a
5D02: 45 00    eor $00
5D04: D0 08    bne $5d0e
5D06: 20 1B 62 jsr $621b
5D09: A9 12    lda #$12
5D0B: 4C 58 5E jmp $5e58
5D0E: 20 DF 61 jsr $61df
5D11: A9 13    lda #$13
5D13: 4C 58 5E jmp $5e58
5D16: A5 56    lda $56
5D18: 29 0F    and #$0f
5D1A: C9 0A    cmp #$0a
5D1C: B0 FE    bcs $5d1c
5D1E: 0A       asl a
5D1F: A8       tay
5D20: B9 2D 5D lda table_5d2d, y
5D23: 85 1B    sta $1b
5D25: B9 2E 5D lda $5d2e, y
5D28: 85 1C    sta $1c
5D2A: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

5D41: 20 68 5F jsr $5f68
5D44: B0 69    bcs $5daf
5D46: 20 71 5E jsr $5e71
5D49: 20 73 5F jsr $5f73
5D4C: B0 66    bcs $5db4
5D4E: 20 74 62 jsr $6274
5D51: 90 5C    bcc $5daf
5D53: 20 37 60 jsr $6037
5D56: 90 07    bcc $5d5f
5D58: 20 3F 60 jsr $603f
5D5B: F0 4D    beq $5daa
5D5D: 90 50    bcc $5daf
5D5F: 20 70 60 jsr $6070
5D62: 4C 58 5E jmp $5e58
5D65: 20 68 5F jsr $5f68
5D68: B0 70    bcs $5dda
5D6A: 20 BE 60 jsr $60be
5D6D: B0 5E    bcs $5dcd
5D6F: 4C AF 5D jmp $5daf
5D72: 20 68 5F jsr $5f68
5D75: B0 63    bcs $5dda
5D77: 4C AF 5D jmp $5daf
5D7A: 20 68 5F jsr $5f68
5D7D: B0 1A    bcs $5d99
5D7F: 20 71 5E jsr $5e71
5D82: 20 74 62 jsr $6274
5D85: 90 28    bcc $5daf
5D87: 20 37 60 jsr $6037
5D8A: 90 07    bcc $5d93
5D8C: 20 3F 60 jsr $603f
5D8F: F0 19    beq $5daa
5D91: 90 1C    bcc $5daf
5D93: 20 70 60 jsr $6070
5D96: 4C 58 5E jmp $5e58
5D99: A6 00    ldx $00
5D9B: B5 54    lda $54, x
5D9D: 29 0F    and #$0f
5D9F: C9 05    cmp #$05
5DA1: F0 F0    beq $5d93
5DA3: C9 04    cmp #$04
5DA5: F0 08    beq $5daf
5DA7: 4C DD 5D jmp $5ddd
5DAA: A9 03    lda #$03
5DAC: 4C 58 5E jmp $5e58
5DAF: A9 00    lda #$00
5DB1: 4C 58 5E jmp $5e58
5DB4: A5 00    lda $00
5DB6: 0A       asl a
5DB7: AA       tax
5DB8: BD 0E 03 lda $030e, x
5DBB: 29 FD    and #$fd
5DBD: 9D 0E 03 sta $030e, x
5DC0: BD 0F 03 lda $030f, x
5DC3: 29 FD    and #$fd
5DC5: 9D 0F 03 sta $030f, x
5DC8: A9 04    lda #$04
5DCA: 4C 58 5E jmp $5e58
5DCD: 20 9E 61 jsr $619e
5DD0: A9 05    lda #$05
5DD2: 4C 58 5E jmp $5e58
5DD5: A9 10    lda #$10
5DD7: 4C 58 5E jmp $5e58
5DDA: 4C 8B 5E jmp $5e8b
5DDD: 4C 70 5E jmp $5e70
5DE0: 4C 5C 5E jmp $5e5c
5DE3: 20 74 62 jsr $6274
5DE6: 90 C7    bcc $5daf
5DE8: 20 68 5F jsr $5f68
5DEB: B0 F3    bcs $5de0
5DED: 20 71 5E jsr $5e71
5DF0: 20 80 62 jsr $6280
5DF3: 90 BA    bcc $5daf
5DF5: 20 37 60 jsr $6037
5DF8: 90 07    bcc $5e01
5DFA: 20 3F 60 jsr $603f
5DFD: F0 AB    beq $5daa
5DFF: 90 AE    bcc $5daf
5E01: 20 70 60 jsr $6070
5E04: 4C 58 5E jmp $5e58
5E07: 20 68 62 jsr $6268
5E0A: 90 A3    bcc $5daf
5E0C: 20 68 5F jsr $5f68
5E0F: 90 9E    bcc $5daf
5E11: 20 71 5E jsr $5e71
5E14: 20 70 60 jsr $6070
5E17: 4C 58 5E jmp $5e58
5E1A: 20 68 5F jsr $5f68
5E1D: 90 90    bcc $5daf
5E1F: AD E1 03 lda $03e1
5E22: E9 01    sbc #$01
5E24: C9 03    cmp #$03
5E26: 90 87    bcc $5daf
5E28: A9 07    lda #$07
5E2A: 4C 58 5E jmp $5e58
5E2D: AD E9 03 lda $03e9
5E30: 29 0F    and #$0f
5E32: C9 09    cmp #$09
5E34: 90 0D    bcc $5e43
5E36: AD 11 04 lda $0411
5E39: 30 11    bmi $5e4c
5E3B: 4A       lsr a
5E3C: 45 00    eor $00
5E3E: D0 11    bne $5e51
5E40: 4C 4C 5E jmp $5e4c
5E43: AD E9 03 lda $03e9
5E46: 29 10    and #$10
5E48: 45 01    eor $01
5E4A: D0 05    bne $5e51
5E4C: A9 00    lda #$00
5E4E: 4C 58 5E jmp $5e58
5E51: A9 10    lda #$10
5E53: 4C 58 5E jmp $5e58
5E56: A9 10    lda #$10
5E58: A6 00    ldx $00
5E5A: 95 54    sta $54, x
5E5C: A5 00    lda $00
5E5E: 0A       asl a
5E5F: AA       tax
5E60: BD 0E 03 lda $030e, x
5E63: 09 01    ora #$01
5E65: 9D 0E 03 sta $030e, x
5E68: BD 0F 03 lda $030f, x
5E6B: 09 01    ora #$01
5E6D: 9D 0F 03 sta $030f, x
5E70: 60       rts
5E71: A5 00    lda $00
5E73: 0A       asl a
5E74: AA       tax
5E75: BD 0E 03 lda $030e, x
5E78: 09 02    ora #$02
5E7A: 9D 0E 03 sta $030e, x
5E7D: BD 0F 03 lda $030f, x
5E80: 09 02    ora #$02
5E82: 9D 0F 03 sta $030f, x
5E85: A9 00    lda #$00
5E87: 8D FB 07 sta $07fb
5E8A: 60       rts
5E8B: A6 00    ldx $00
5E8D: 38       sec
5E8E: A5 53    lda $53
5E90: C9 01    cmp #$01
5E92: F0 07    beq $5e9b
5E94: C9 03    cmp #$03
5E96: B0 FE    bcs $5e96
5E98: 4C 4E 5F jmp $5f4e
5E9B: B5 54    lda $54, x
5E9D: C9 11    cmp #$11
5E9F: B0 FE    bcs $5e9f
5EA1: 0A       asl a
5EA2: A8       tay
5EA3: B9 B0 5E lda table_5eb0, y
5EA6: 85 1B    sta $1b
5EA8: B9 B1 5E lda $5eb1, y
5EAB: 85 1C    sta $1c
5EAD: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

5ED0: 20 70 60 jsr $6070
5ED3: A6 00    ldx $00
5ED5: 95 54    sta $54, x
5ED7: 4C 9B 5E jmp $5e9b
5EDA: 20 FE 60 jsr $60fe
5EDD: 90 05    bcc $5ee4
5EDF: 20 F5 60 jsr $60f5
5EE2: B0 67    bcs $5f4b
5EE4: A9 06    lda #$06
5EE6: 4C 58 5E jmp $5e58
5EE9: 20 5D 62 jsr $625d
5EEC: 90 21    bcc $5f0f
5EEE: 20 FE 60 jsr $60fe
5EF1: 90 F1    bcc $5ee4
5EF3: 20 F5 60 jsr $60f5
5EF6: B0 53    bcs $5f4b
5EF8: A9 09    lda #$09
5EFA: 4C 58 5E jmp $5e58
5EFD: 20 FE 60 jsr $60fe
5F00: 90 E2    bcc $5ee4
5F02: 20 F5 60 jsr $60f5
5F05: 90 08    bcc $5f0f
5F07: 20 8F 61 jsr $618f
5F0A: 90 EC    bcc $5ef8
5F0C: 4C 5C 5E jmp $5e5c
5F0F: 20 0F 61 jsr $610f
5F12: B0 E4    bcs $5ef8
5F14: A9 07    lda #$07
5F16: 4C 58 5E jmp $5e58
5F19: 20 5D 62 jsr $625d
5F1C: 90 0A    bcc $5f28
5F1E: 20 FE 60 jsr $60fe
5F21: 90 C1    bcc $5ee4
5F23: 20 F5 60 jsr $60f5
5F26: B0 23    bcs $5f4b
5F28: 20 0F 61 jsr $610f
5F2B: 90 E7    bcc $5f14
5F2D: A9 0D    lda #$0d
5F2F: 4C 58 5E jmp $5e58
5F32: 20 5D 62 jsr $625d
5F35: 90 0A    bcc $5f41
5F37: 20 FE 60 jsr $60fe
5F3A: 90 A8    bcc $5ee4
5F3C: 20 F5 60 jsr $60f5
5F3F: B0 0A    bcs $5f4b
5F41: 20 0F 61 jsr $610f
5F44: 90 CE    bcc $5f14
5F46: A9 0F    lda #$0f
5F48: 4C 58 5E jmp $5e58
5F4B: 4C 5C 5E jmp $5e5c
5F4E: B5 54    lda $54, x
5F50: C9 11    cmp #$11
5F52: B0 FE    bcs $5f52
5F54: 20 F5 60 jsr $60f5
5F57: 90 0A    bcc $5f63
5F59: 20 5D 62 jsr $625d
5F5C: 90 05    bcc $5f63
5F5E: A6 00    ldx $00
5F60: 4C 5C 5E jmp $5e5c
5F63: A9 07    lda #$07
5F65: 4C 58 5E jmp $5e58
5F68: 18       clc
5F69: A5 56    lda $56
5F6B: 45 01    eor $01
5F6D: 29 10    and #$10
5F6F: D0 01    bne $5f72
5F71: 38       sec
5F72: 60       rts
5F73: A9 88    lda #$88
5F75: CD 04 04 cmp $0404
5F78: 90 1F    bcc $5f99
5F7A: AD 04 04 lda $0404
5F7D: C9 58    cmp #$58
5F7F: 90 18    bcc $5f99
5F81: A5 00    lda $00
5F83: 49 01    eor #$01
5F85: CD 01 04 cmp $0401
5F88: 18       clc
5F89: F0 0E    beq $5f99
5F8B: A4 00    ldy $00
5F8D: B6 5F    ldx $5f, y
5F8F: BD 16 03 lda $0316, x
5F92: 29 7F    and #$7f
5F94: C9 0F    cmp #$0f
5F96: 18       clc
5F97: D0 01    bne $5f9a
5F99: 60       rts
5F9A: BD 84 03 lda $0384, x
5F9D: 48       pha
5F9E: BD 80 03 lda $0380, x
5FA1: 48       pha
5FA2: BD 8C 03 lda $038c, x
5FA5: 48       pha
5FA6: BD 88 03 lda $0388, x
5FA9: 48       pha
5FAA: A0 0D    ldy #$0d
5FAC: AD 01 04 lda $0401
5FAF: 9D 84 03 sta $0384, x
5FB2: 99 9D 00 sta $009d, y
5FB5: AD 00 04 lda $0400
5FB8: 9D 80 03 sta $0380, x
5FBB: 99 8F 00 sta $008f, y
5FBE: A9 00    lda #$00
5FC0: 9D 8C 03 sta $038c, x
5FC3: 99 C7 00 sta $00c7, y
5FC6: AD 02 04 lda $0402
5FC9: 9D 88 03 sta $0388, x
5FCC: 99 B9 00 sta $00b9, y
5FCF: A5 00    lda $00
5FD1: 48       pha
5FD2: A5 01    lda $01
5FD4: 48       pha
5FD5: BD 2B 03 lda $032b, x
5FD8: 48       pha
5FD9: 8A       txa
5FDA: 85 4C    sta $4c
5FDC: A9 0D    lda #$0d
5FDE: 20 4A B4 jsr $b44a
5FE1: 9D 2B 03 sta $032b, x
5FE4: A9 00    lda #$00
5FE6: 20 49 85 jsr $8549
5FE9: 68       pla
5FEA: 9D 2B 03 sta $032b, x
5FED: 68       pla
5FEE: 85 01    sta $01
5FF0: 68       pla
5FF1: 85 00    sta $00
5FF3: 68       pla
5FF4: 9D 88 03 sta $0388, x
5FF7: 68       pla
5FF8: 9D 8C 03 sta $038c, x
5FFB: 68       pla
5FFC: 9D 80 03 sta $0380, x
5FFF: 68       pla
6000: 9D 84 03 sta $0384, x
6003: 18       clc
6004: AD 06 04 lda $0406
6007: 69 0A    adc #$0a
6009: C5 1B    cmp $1b
600B: 90 29    bcc $6036
600D: A6 00    ldx $00
600F: B4 5F    ldy $5f, x
6011: B9 12 03 lda $0312, y
6014: 0A       asl a
6015: A8       tay
6016: B9 14 40 lda $4014, y
6019: 85 10    sta $10
601B: A5 56    lda $56
601D: 29 0F    and #$0f
601F: F0 02    beq $6023
6021: A9 02    lda #$02
6023: 18       clc
6024: 65 10    adc $10
6026: 85 10    sta $10
6028: A9 00    lda #$00
602A: 79 15 40 adc $4015, y
602D: 85 11    sta $11
602F: 20 09 66 jsr $6609
6032: C9 01    cmp #$01
6034: 90 00    bcc $6036
6036: 60       rts
6037: AD E9 03 lda $03e9
603A: 29 0F    and #$0f
603C: C9 09    cmp #$09
603E: 60       rts
603F: A6 00    ldx $00
6041: B5 61    lda $61, x
6043: AA       tax
6044: BD 12 03 lda $0312, x
6047: 0A       asl a
6048: A8       tay
6049: B9 3E 40 lda $403e, y
604C: 85 10    sta $10
604E: B9 3F 40 lda $403f, y
6051: 85 11    sta $11
6053: 38       sec
6054: AD E9 03 lda $03e9
6057: 29 0F    and #$0f
6059: E9 09    sbc #$09
605B: A8       tay
605C: 18       clc
605D: B9 77 40 lda $4077, y
6060: 65 10    adc $10
6062: 85 10    sta $10
6064: A9 00    lda #$00
6066: 65 11    adc $11
6068: 85 11    sta $11
606A: 20 09 66 jsr $6609
606D: C9 01    cmp #$01
606F: 60       rts
6070: A6 00    ldx $00
6072: B5 63    lda $63, x
6074: AA       tax
6075: BD 12 03 lda $0312, x
6078: 0A       asl a
6079: A8       tay
607A: B9 3E 40 lda $403e, y
607D: 85 10    sta $10
607F: B9 3F 40 lda $403f, y
6082: 85 11    sta $11
6084: AD E9 03 lda $03e9
6087: 29 0F    and #$0f
6089: A8       tay
608A: 18       clc
608B: B9 68 40 lda $4068, y
608E: 65 10    adc $10
6090: 85 10    sta $10
6092: A9 00    lda #$00
6094: 65 11    adc $11
6096: 85 11    sta $11
6098: 20 09 66 jsr $6609
609B: 18       clc
609C: 69 06    adc #$06
609E: 85 1B    sta $1b
60A0: A5 56    lda $56
60A2: 29 0F    and #$0f
60A4: F0 0B    beq $60b1
60A6: C9 05    cmp #$05
60A8: F0 07    beq $60b1
60AA: C9 06    cmp #$06
60AC: F0 03    beq $60b1
60AE: A5 1B    lda $1b
60B0: 60       rts
60B1: A5 1B    lda $1b
60B3: 29 09    and #$09
60B5: C9 08    cmp #$08
60B7: D0 02    bne $60bb
60B9: E6 1B    inc $1b
60BB: A5 1B    lda $1b
60BD: 60       rts
60BE: A6 00    ldx $00
60C0: B5 5F    lda $5f, x
60C2: AA       tax
60C3: 18       clc
60C4: BD 73 03 lda $0373, x
60C7: 29 0F    and #$0f
60C9: 85 1B    sta $1b
60CB: A9 02    lda #$02
60CD: C5 1B    cmp $1b
60CF: 90 19    bcc $60ea
60D1: BD 12 03 lda $0312, x
60D4: 0A       asl a
60D5: A8       tay
60D6: 18       clc
60D7: B9 14 40 lda $4014, y
60DA: 69 04    adc #$04
60DC: 85 10    sta $10
60DE: B9 15 40 lda $4015, y
60E1: 69 00    adc #$00
60E3: 85 11    sta $11
60E5: 20 09 66 jsr $6609
60E8: C9 01    cmp #$01
60EA: 60       rts
60EB: A5 00    lda $00
60ED: 49 01    eor #$01
60EF: AA       tax
60F0: B5 57    lda $57, x
60F2: C9 15    cmp #$15
60F4: 60       rts
60F5: 18       clc
60F6: A5 56    lda $56
60F8: 29 20    and #$20
60FA: D0 01    bne $60fd
60FC: 38       sec
60FD: 60       rts
60FE: 18       clc
60FF: A6 00    ldx $00
6101: B5 51    lda $51, x
6103: 49 01    eor #$01
6105: AA       tax
6106: BD 0E 03 lda $030e, x
6109: 29 40    and #$40
610B: D0 01    bne $610e
610D: 38       sec
610E: 60       rts
610F: 18       clc
6110: A4 00    ldy $00
6112: B6 51    ldx $51, y
6114: AD E9 03 lda $03e9
6117: 29 0F    and #$0f
6119: C9 0D    cmp #$0d
611B: D0 02    bne $611f
611D: 18       clc
611E: 60       rts
611F: BD 84 03 lda $0384, x
6122: 48       pha
6123: BD 80 03 lda $0380, x
6126: 48       pha
6127: BD 8C 03 lda $038c, x
612A: 48       pha
612B: BD 88 03 lda $0388, x
612E: 48       pha
612F: A0 0D    ldy #$0d
6131: AD F6 03 lda $03f6
6134: 9D 84 03 sta $0384, x
6137: 99 9D 00 sta $009d, y
613A: AD F5 03 lda $03f5
613D: 9D 80 03 sta $0380, x
6140: 99 8F 00 sta $008f, y
6143: A9 00    lda #$00
6145: 9D 8C 03 sta $038c, x
6148: 99 C7 00 sta $00c7, y
614B: AD F7 03 lda $03f7
614E: 9D 88 03 sta $0388, x
6151: 99 B9 00 sta $00b9, y
6154: A5 00    lda $00
6156: 48       pha
6157: A5 01    lda $01
6159: 48       pha
615A: BD 2B 03 lda $032b, x
615D: 48       pha
615E: 8A       txa
615F: 85 4C    sta $4c
6161: A9 0D    lda #$0d
6163: 20 4A B4 jsr $b44a
6166: 9D 2B 03 sta $032b, x
6169: A9 00    lda #$00
616B: 20 49 85 jsr $8549
616E: 68       pla
616F: 9D 2B 03 sta $032b, x
6172: 68       pla
6173: 85 01    sta $01
6175: 68       pla
6176: 85 00    sta $00
6178: 68       pla
6179: 9D 88 03 sta $0388, x
617C: 68       pla
617D: 9D 8C 03 sta $038c, x
6180: 68       pla
6181: 9D 80 03 sta $0380, x
6184: 68       pla
6185: 9D 84 03 sta $0384, x
6188: 18       clc
6189: AD F9 03 lda $03f9
618C: C5 1B    cmp $1b
618E: 60       rts
618F: A4 00    ldy $00
6191: B6 51    ldx $51, y
6193: BD 78 03 lda $0378, x
6196: DD 73 03 cmp $0373, x
6199: 18       clc
619A: D0 01    bne $619d
619C: 38       sec
619D: 60       rts
619E: A6 00    ldx $00
61A0: B5 5F    lda $5f, x
61A2: AA       tax
61A3: BD 12 03 lda $0312, x
61A6: 0A       asl a
61A7: A8       tay
61A8: 18       clc
61A9: B9 14 40 lda $4014, y
61AC: 69 06    adc #$06
61AE: 85 10    sta $10
61B0: B9 15 40 lda $4015, y
61B3: 69 00    adc #$00
61B5: 85 11    sta $11
61B7: 20 09 66 jsr $6609
61BA: 9D BC 03 sta $03bc, x
61BD: 60       rts
61BE: A6 00    ldx $00
61C0: B5 51    lda $51, x
61C2: 49 01    eor #$01
61C4: AA       tax
61C5: BD 12 03 lda $0312, x
61C8: 0A       asl a
61C9: A8       tay
61CA: 18       clc
61CB: B9 14 40 lda $4014, y
61CE: 69 BB    adc #$bb
61D0: 85 10    sta $10
61D2: B9 15 40 lda $4015, y
61D5: 69 00    adc #$00
61D7: 85 11    sta $11
61D9: 20 09 66 jsr $6609
61DC: C9 01    cmp #$01
61DE: 60       rts
61DF: A6 00    ldx $00
61E1: B5 47    lda $47, x
61E3: 0A       asl a
61E4: A8       tay
61E5: B9 00 40 lda $4000, y
61E8: 85 10    sta $10
61EA: B9 01 40 lda $4001, y
61ED: 85 11    sta $11
61EF: 8A       txa
61F0: 49 01    eor #$01
61F2: A8       tay
61F3: A9 00    lda #$00
61F5: 85 1B    sta $1b
61F7: 38       sec
61F8: B5 57    lda $57, x
61FA: F9 57 00 sbc $0057, y
61FD: F0 04    beq $6203
61FF: B0 04    bcs $6205
6201: E6 1B    inc $1b
6203: E6 1B    inc $1b
6205: A5 1B    lda $1b
6207: 0A       asl a
6208: 0A       asl a
6209: 65 1B    adc $1b
620B: 65 10    adc $10
620D: 85 10    sta $10
620F: A5 11    lda $11
6211: 69 00    adc #$00
6213: 85 11    sta $11
6215: 20 09 66 jsr $6609
6218: 85 5D    sta $5d
621A: 60       rts
621B: A6 4F    ldx $4f
621D: BD 12 03 lda $0312, x
6220: 0A       asl a
6221: A8       tay
6222: B9 14 40 lda $4014, y
6225: 85 10    sta $10
6227: B9 15 40 lda $4015, y
622A: 85 11    sta $11
622C: A5 00    lda $00
622E: AA       tax
622F: 49 01    eor #$01
6231: A8       tay
6232: A9 00    lda #$00
6234: 85 1B    sta $1b
6236: 38       sec
6237: B5 57    lda $57, x
6239: F9 57 00 sbc $0057, y
623C: F0 04    beq $6242
623E: B0 04    bcs $6244
6240: E6 1B    inc $1b
6242: E6 1B    inc $1b
6244: A5 1B    lda $1b
6246: 0A       asl a
6247: 0A       asl a
6248: 69 44    adc #$44
624A: 65 10    adc $10
624C: 85 10    sta $10
624E: A5 11    lda $11
6250: 69 00    adc #$00
6252: 85 11    sta $11
6254: 20 09 66 jsr $6609
6257: A6 4F    ldx $4f
6259: 9D AC 03 sta $03ac, x
625C: 60       rts
625D: A5 56    lda $56
625F: 29 0F    and #$0f
6261: C9 02    cmp #$02
6263: 18       clc
6264: D0 01    bne $6267
6266: 38       sec
6267: 60       rts
6268: 18       clc
6269: AD E9 03 lda $03e9
626C: 29 10    and #$10
626E: 45 01    eor $01
6270: D0 01    bne $6273
6272: 38       sec
6273: 60       rts
6274: AD FA 03 lda $03fa
6277: 45 01    eor $01
6279: 29 10    and #$10
627B: 18       clc
627C: D0 01    bne $627f
627E: 38       sec
627F: 60       rts
6280: A5 38    lda $38
6282: C9 04    cmp #$04
6284: 90 02    bcc $6288
6286: A9 04    lda #$04
6288: 0A       asl a
6289: A8       tay
628A: A9 A4    lda #$a4
628C: 85 10    sta $10
628E: A9 62    lda #$62
6290: 85 11    sta $11
6292: 98       tya
6293: 18       clc
6294: 65 10    adc $10
6296: 85 10    sta $10
6298: A5 11    lda $11
629A: 69 00    adc #$00
629C: 85 11    sta $11
629E: 20 09 66 jsr $6609
62A1: C9 01    cmp #$01
62A3: 60       rts

62AE: A6 01    ldx $01
62B0: BD 0E 03 lda $030e, x
62B3: 29 01    and #$01
62B5: D0 01    bne $62b8
62B7: 60       rts
62B8: BD 0E 03 lda $030e, x
62BB: 29 02    and #$02
62BD: F0 37    beq $62f6
62BF: A5 56    lda $56
62C1: 29 0F    and #$0f
62C3: F0 20    beq $62e5
62C5: A5 38    lda $38
62C7: C9 10    cmp #$10
62C9: 90 02    bcc $62cd
62CB: A9 09    lda #$09
62CD: A8       tay
62CE: A5 3A    lda $3a
62D0: F0 01    beq $62d3
62D2: C8       iny
62D3: B9 EB 62 lda $62eb, y
62D6: 8D FC 07 sta $07fc
62D9: EE FB 07 inc $07fb
62DC: AD FB 07 lda $07fb
62DF: CD FC 07 cmp $07fc
62E2: B0 32    bcs $6316
62E4: 60       rts
62E5: AD B3 02 lda $02b3
62E8: 30 2C    bmi $6316
62EA: 60       rts

62F6: A5 01    lda $01
62F8: 0A       asl a
62F9: 0A       asl a
62FA: 0A       asl a
62FB: 0A       asl a
62FC: 85 1B    sta $1b
62FE: A5 56    lda $56
6300: 45 1B    eor $1b
6302: 29 3F    and #$3f
6304: C9 23    cmp #$23
6306: D0 16    bne $631e
6308: A9 00    lda #$00
630A: 8D FB 07 sta $07fb
630D: BD 0E 03 lda $030e, x
6310: 09 02    ora #$02
6312: 9D 0E 03 sta $030e, x
6315: 60       rts
6316: BD 0E 03 lda $030e, x
6319: 29 FD    and #$fd
631B: 9D 0E 03 sta $030e, x
631E: BD 0E 03 lda $030e, x
6321: 29 FE    and #$fe
6323: 9D 0E 03 sta $030e, x
6326: A4 00    ldy $00
6328: B9 54 00 lda $0054, y
632B: 0A       asl a
632C: A8       tay
632D: B9 3A 63 lda table_633a, y
6330: 85 1B    sta $1b
6332: B9 3B 63 lda $633b, y
6335: 85 1C    sta $1c
6337: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

6362: A5 56    lda $56
6364: 29 0F    and #$0f
6366: 38       sec
6367: E9 02    sbc #$02
6369: 30 0F    bmi $637a
636B: C9 03    cmp #$03
636D: B0 0B    bcs $637a
636F: C9 07    cmp #$07
6371: F0 07    beq $637a
6373: A9 02    lda #$02
6375: 85 1B    sta $1b
6377: 4C B4 64 jmp $64b4
637A: A9 36    lda #$36
637C: 85 1B    sta $1b
637E: 4C B4 64 jmp $64b4
6381: A9 00    lda #$00
6383: 85 1B    sta $1b
6385: 4C B4 64 jmp $64b4
6388: A9 28    lda #$28
638A: 85 1B    sta $1b
638C: 4C B4 64 jmp $64b4
638F: A9 04    lda #$04
6391: 85 1B    sta $1b
6393: 4C CC 64 jmp $64cc
6396: A9 44    lda #$44
6398: 85 1B    sta $1b
639A: 4C C2 64 jmp $64c2
639D: A5 56    lda $56
639F: 29 0F    and #$0f
63A1: C9 05    cmp #$05
63A3: F0 07    beq $63ac
63A5: A9 3A    lda #$3a
63A7: 85 1B    sta $1b
63A9: 4C C2 64 jmp $64c2
63AC: A9 38    lda #$38
63AE: 85 1B    sta $1b
63B0: 4C C2 64 jmp $64c2
63B3: A5 53    lda $53
63B5: D0 07    bne $63be
63B7: A9 1E    lda #$1e
63B9: 85 1B    sta $1b
63BB: 4C D6 64 jmp $64d6
63BE: A9 2A    lda #$2a
63C0: 85 1B    sta $1b
63C2: 4C 94 65 jmp $6594
63C5: A5 53    lda $53
63C7: F0 EE    beq $63b7
63C9: C9 02    cmp #$02
63CB: B0 F1    bcs $63be
63CD: A9 1E    lda #$1e
63CF: 85 1B    sta $1b
63D1: 4C 94 65 jmp $6594
63D4: A5 53    lda $53
63D6: D0 13    bne $63eb
63D8: 20 0F 61 jsr $610f
63DB: 90 07    bcc $63e4
63DD: A9 1C    lda #$1c
63DF: 85 1B    sta $1b
63E1: 4C D6 64 jmp $64d6
63E4: A9 26    lda #$26
63E6: 85 1B    sta $1b
63E8: 4C D6 64 jmp $64d6
63EB: 20 BE 61 jsr $61be
63EE: B0 07    bcs $63f7
63F0: A9 40    lda #$40
63F2: 85 1B    sta $1b
63F4: 4C 94 65 jmp $6594
63F7: A9 42    lda #$42
63F9: 85 1B    sta $1b
63FB: 4C 94 65 jmp $6594
63FE: A5 53    lda $53
6400: C9 02    cmp #$02
6402: B0 E7    bcs $63eb
6404: C9 01    cmp #$01
6406: B0 07    bcs $640f
6408: A9 20    lda #$20
640A: 85 1B    sta $1b
640C: 4C D6 64 jmp $64d6
640F: 20 0F 61 jsr $610f
6412: 90 07    bcc $641b
6414: A9 1C    lda #$1c
6416: 85 1B    sta $1b
6418: 4C 94 65 jmp $6594
641B: A9 26    lda #$26
641D: 85 1B    sta $1b
641F: 4C 94 65 jmp $6594
6422: A5 53    lda $53
6424: F0 E2    beq $6408
6426: C9 02    cmp #$02
6428: B0 07    bcs $6431
642A: A9 14    lda #$14
642C: 85 1B    sta $1b
642E: 4C 94 65 jmp $6594
6431: A6 00    ldx $00
6433: B5 51    lda $51, x
6435: A8       tay
6436: B9 16 03 lda $0316, y
6439: 29 7F    and #$7f
643B: C9 07    cmp #$07
643D: D0 13    bne $6452
643F: 20 BE 61 jsr $61be
6442: B0 07    bcs $644b
6444: A9 08    lda #$08
6446: 85 1B    sta $1b
6448: 4C 94 65 jmp $6594
644B: A9 0A    lda #$0a
644D: 85 1B    sta $1b
644F: 4C 94 65 jmp $6594
6452: 60       rts
6453: A5 53    lda $53
6455: D0 13    bne $646a
6457: 20 0F 61 jsr $610f
645A: 90 07    bcc $6463
645C: A9 1A    lda #$1a
645E: 85 1B    sta $1b
6460: 4C D6 64 jmp $64d6
6463: A9 24    lda #$24
6465: 85 1B    sta $1b
6467: 4C D6 64 jmp $64d6
646A: 20 BE 61 jsr $61be
646D: B0 07    bcs $6476
646F: A9 3C    lda #$3c
6471: 85 1B    sta $1b
6473: 4C 94 65 jmp $6594
6476: A9 3E    lda #$3e
6478: 85 1B    sta $1b
647A: 4C 94 65 jmp $6594
647D: A5 53    lda $53
647F: F0 87    beq $6408
6481: C9 02    cmp #$02
6483: B0 E5    bcs $646a
6485: 20 0F 61 jsr $610f
6488: 90 07    bcc $6491
648A: A9 1A    lda #$1a
648C: 85 1B    sta $1b
648E: 4C 94 65 jmp $6594
6491: A9 24    lda #$24
6493: 85 1B    sta $1b
6495: 4C 94 65 jmp $6594
6498: A9 2E    lda #$2e
649A: 85 1B    sta $1b
649C: 4C B4 64 jmp $64b4
649F: A9 30    lda #$30
64A1: 85 1B    sta $1b
64A3: 4C B4 64 jmp $64b4
64A6: A9 32    lda #$32
64A8: 85 1B    sta $1b
64AA: 4C BB 64 jmp $64bb
64AD: A9 34    lda #$34
64AF: 85 1B    sta $1b
64B1: 4C B4 64 jmp $64b4
64B4: A5 01    lda $01
64B6: 85 2A    sta $2a
64B8: 4C 9B 65 jmp $659b
64BB: A5 4F    lda $4f
64BD: 85 2A    sta $2a
64BF: 4C 9B 65 jmp $659b
64C2: A4 00    ldy $00
64C4: B9 5F 00 lda $005f, y
64C7: 85 2A    sta $2a
64C9: 4C 9B 65 jmp $659b
64CC: A4 00    ldy $00
64CE: B9 61 00 lda $0061, y
64D1: 85 2A    sta $2a
64D3: 4C 9B 65 jmp $659b
64D6: A9 FF    lda #$ff
64D8: A8       tay
64D9: A6 01    ldx $01
64DB: BD 1A 03 lda $031a, x
64DE: 29 7F    and #$7f
64E0: C9 22    cmp #$22
64E2: D0 02    bne $64e6
64E4: C8       iny
64E5: C8       iny
64E6: E8       inx
64E7: BD 1A 03 lda $031a, x
64EA: 29 7F    and #$7f
64EC: C9 22    cmp #$22
64EE: D0 01    bne $64f1
64F0: C8       iny
64F1: 98       tya
64F2: 30 0B    bmi $64ff
64F4: C9 02    cmp #$02
64F6: F0 07    beq $64ff
64F8: 05 01    ora $01
64FA: 85 2A    sta $2a
64FC: 4C 9B 65 jmp $659b
64FF: A4 00    ldy $00
6501: B6 63    ldx $63, y
6503: BD 0E 03 lda $030e, x
6506: 10 03    bpl $650b
6508: 4C 8C 65 jmp $658c
650B: BD 84 03 lda $0384, x
650E: 48       pha
650F: BD 80 03 lda $0380, x
6512: 48       pha
6513: BD 8C 03 lda $038c, x
6516: 48       pha
6517: BD 88 03 lda $0388, x
651A: 48       pha
651B: A5 00    lda $00
651D: 48       pha
651E: A5 01    lda $01
6520: 48       pha
6521: A5 1B    lda $1b
6523: 48       pha
6524: BD 2B 03 lda $032b, x
6527: 48       pha
6528: A0 0D    ldy #$0d
652A: AD F0 03 lda $03f0
652D: 9D 84 03 sta $0384, x
6530: 99 9D 00 sta $009d, y
6533: AD EF 03 lda $03ef
6536: 9D 80 03 sta $0380, x
6539: 99 8F 00 sta $008f, y
653C: A9 00    lda #$00
653E: 9D 8C 03 sta $038c, x
6541: 99 C7 00 sta $00c7, y
6544: AD F1 03 lda $03f1
6547: 9D 88 03 sta $0388, x
654A: 99 B9 00 sta $00b9, y
654D: 8A       txa
654E: 85 4C    sta $4c
6550: A9 0D    lda #$0d
6552: 20 4A B4 jsr $b44a
6555: 9D 2B 03 sta $032b, x
6558: A9 01    lda #$01
655A: 20 49 85 jsr $8549
655D: AD F4 03 lda $03f4
6560: 38       sec
6561: E9 04    sbc #$04
6563: C5 1B    cmp $1b
6565: 68       pla
6566: 9D 2B 03 sta $032b, x
6569: 68       pla
656A: 85 1B    sta $1b
656C: 68       pla
656D: 85 01    sta $01
656F: 68       pla
6570: 85 00    sta $00
6572: 68       pla
6573: 9D 88 03 sta $0388, x
6576: 68       pla
6577: 9D 8C 03 sta $038c, x
657A: 68       pla
657B: 9D 80 03 sta $0380, x
657E: 68       pla
657F: 9D 84 03 sta $0384, x
6582: B0 03    bcs $6587
6584: 4C CC 64 jmp $64cc
6587: 86 2A    stx $2a
6589: 4C 9B 65 jmp $659b
658C: 8A       txa
658D: 49 01    eor #$01
658F: 85 2A    sta $2a
6591: 4C 9B 65 jmp $659b
6594: A4 00    ldy $00
6596: B9 51 00 lda $0051, y
6599: 85 2A    sta $2a
659B: A4 1B    ldy $1b
659D: B9 C3 65 lda $65c3, y
65A0: 85 1C    sta $1c
65A2: B9 C4 65 lda $65c4, y
65A5: 85 1D    sta $1d
65A7: A5 2A    lda $2a
65A9: C5 01    cmp $01
65AB: F0 09    beq $65b6
65AD: A5 1C    lda $1c
65AF: 85 1D    sta $1d
65B1: B9 C4 65 lda $65c4, y
65B4: 85 1C    sta $1c
65B6: A6 01    ldx $01
65B8: A5 1C    lda $1c
65BA: 9D 16 03 sta $0316, x
65BD: A5 1D    lda $1d
65BF: 9D 17 03 sta $0317, x
65C2: 60       rts

6609: 98       tya
660A: 48       pha
660B: A0 00    ldy #$00
660D: 20 0A D0 jsr $d00a
6610: 18       clc
6611: 4A       lsr a
6612: C9 64    cmp #$64
6614: 90 07    bcc $661d
6616: C8       iny
6617: C0 03    cpy #$03
6619: 90 F2    bcc $660d
661B: A9 32    lda #$32
661D: 85 1C    sta $1c
661F: A9 A0    lda #$a0
6621: 85 1D    sta $1d
6623: A9 00    lda #$00
6625: 85 1E    sta $1e
6627: A0 00    ldy #$00
6629: A5 1C    lda $1c
662B: 38       sec
662C: E5 1D    sbc $1d
662E: 90 05    bcc $6635
6630: E6 1E    inc $1e
6632: 4C 37 66 jmp $6637
6635: 65 1D    adc $1d
6637: 46 1D    lsr $1d
6639: 06 1E    asl $1e
663B: C8       iny
663C: C0 05    cpy #$05
663E: 90 EB    bcc $662b
6640: 06 1E    asl $1e
6642: 06 1E    asl $1e
6644: 06 1E    asl $1e
6646: 05 1E    ora $1e
6648: 85 1B    sta $1b
664A: A9 00    lda #$00
664C: A0 00    ldy #$00
664E: F8       sed
664F: 18       clc
6650: 71 10    adc ($10), y
6652: B0 0A    bcs $665e
6654: F0 04    beq $665a
6656: C5 1B    cmp $1b
6658: B0 04    bcs $665e
665A: C8       iny
665B: 4C 4F 66 jmp $664f
665E: D8       cld
665F: 84 1B    sty $1b
6661: 68       pla
6662: A8       tay
6663: A5 1B    lda $1b
6665: 60       rts
6666: 8A       txa
6667: 48       pha
6668: 98       tya
6669: 48       pha
666A: A5 47    lda $47
666C: 10 1C    bpl $668a
666E: AD 0A 03 lda $030a
6671: 29 04    and #$04
6673: D0 15    bne $668a
6675: A9 00    lda #$00
6677: 85 00    sta $00
6679: 85 01    sta $01
667B: A5 42    lda $42
667D: C5 43    cmp $43
667F: D0 06    bne $6687
6681: 20 C6 66 jsr $66c6
6684: 4C 8A 66 jmp $668a
6687: 20 B1 66 jsr $66b1
668A: A5 48    lda $48
668C: 10 1E    bpl $66ac
668E: AD 0C 03 lda $030c
6691: 29 04    and #$04
6693: D0 17    bne $66ac
6695: A9 01    lda #$01
6697: 85 00    sta $00
6699: A9 10    lda #$10
669B: 85 01    sta $01
669D: A5 44    lda $44
669F: C5 45    cmp $45
66A1: D0 06    bne $66a9
66A3: 20 C6 66 jsr $66c6
66A6: 4C AC 66 jmp $66ac
66A9: 20 B1 66 jsr $66b1
66AC: 68       pla
66AD: A8       tay
66AE: 68       pla
66AF: AA       tax
66B0: 60       rts
66B1: A5 00    lda $00
66B3: 0A       asl a
66B4: AA       tax
66B5: BD 0A 03 lda $030a, x
66B8: 09 84    ora #$84
66BA: 9D 0A 03 sta $030a, x
66BD: BD 0B 03 lda $030b, x
66C0: 09 84    ora #$84
66C2: 9D 0B 03 sta $030b, x
66C5: 60       rts
66C6: A5 4F    lda $4f
66C8: 10 4C    bpl $6716
66CA: A5 56    lda $56
66CC: 45 01    eor $01
66CE: 29 1F    and #$1f
66D0: 85 1B    sta $1b
66D2: 29 10    and #$10
66D4: F0 07    beq $66dd
66D6: A5 1B    lda $1b
66D8: 38       sec
66D9: E9 06    sbc #$06
66DB: 85 1B    sta $1b
66DD: A5 1B    lda $1b
66DF: 0A       asl a
66E0: A8       tay
66E1: B9 EE 66 lda table_66ee, y
66E4: 85 1B    sta $1b
66E6: B9 EF 66 lda $66ef, y
66E9: 85 1C    sta $1c
66EB: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

6716: A5 00    lda $00
6718: AA       tax
6719: 0A       asl a
671A: A8       tay
671B: B9 0A 03 lda $030a, y
671E: 29 80    and #$80
6720: D0 01    bne $6723
6722: C8       iny
6723: 98       tya
6724: 95 4D    sta $4d, x
6726: 60       rts
6727: A6 00    ldx $00
6729: B5 5F    lda $5f, x
672B: AA       tax
672C: BD 1A 03 lda $031a, x
672F: 29 7F    and #$7f
6731: C9 0E    cmp #$0e
6733: D0 03    bne $6738
6735: 4C 69 68 jmp $6869
6738: A5 00    lda $00
673A: A9 01    lda #$01
673C: 85 1B    sta $1b
673E: 20 B1 68 jsr $68b1
6741: D0 04    bne $6747
6743: EE FD 07 inc $07fd
6746: 60       rts
6747: A5 00    lda $00
6749: 0A       asl a
674A: AA       tax
674B: BD 0E 03 lda $030e, x
674E: 29 40    and #$40
6750: F0 03    beq $6755
6752: 4C 48 68 jmp $6848
6755: BD 0F 03 lda $030f, x
6758: 29 40    and #$40
675A: F0 03    beq $675f
675C: 4C 2B 68 jmp $682b
675F: AD FD 07 lda $07fd
6762: C9 05    cmp #$05
6764: 90 0C    bcc $6772
6766: BD 1A 03 lda $031a, x
6769: 29 7F    and #$7f
676B: C9 06    cmp #$06
676D: 90 03    bcc $6772
676F: 4C C7 67 jmp $67c7
6772: 4C 09 68 jmp $6809
6775: A6 00    ldx $00
6777: A5 56    lda $56
6779: 29 20    and #$20
677B: D0 06    bne $6783
677D: A5 53    lda $53
677F: C9 01    cmp #$01
6781: F0 0E    beq $6791
6783: 8A       txa
6784: 0A       asl a
6785: AA       tax
6786: A9 14    lda #$14
6788: 9D 16 03 sta $0316, x
678B: 9D 17 03 sta $0317, x
678E: 4C D9 67 jmp $67d9
6791: AC 11 04 ldy $0411
6794: B9 0E 03 lda $030e, y
6797: 29 40    and #$40
6799: D0 E8    bne $6783
679B: 94 4D    sty $4d, x
679D: B9 0A 03 lda $030a, y
67A0: 09 80    ora #$80
67A2: 99 0A 03 sta $030a, y
67A5: 98       tya
67A6: 49 01    eor #$01
67A8: A8       tay
67A9: B9 0A 03 lda $030a, y
67AC: 29 7F    and #$7f
67AE: 99 0A 03 sta $030a, y
67B1: 4C C7 67 jmp $67c7
67B4: A4 00    ldy $00
67B6: AD 11 04 lda $0411
67B9: D9 5F 00 cmp $005f, y
67BC: F0 1B    beq $67d9
67BE: A5 53    lda $53
67C0: C9 01    cmp #$01
67C2: F0 B1    beq $6775
67C4: 4C D9 67 jmp $67d9
67C7: A5 00    lda $00
67C9: 0A       asl a
67CA: A8       tay
67CB: B9 0A 03 lda $030a, y
67CE: 09 04    ora #$04
67D0: 99 0A 03 sta $030a, y
67D3: A9 00    lda #$00
67D5: 8D FD 07 sta $07fd
67D8: 60       rts
67D9: A5 00    lda $00
67DB: 0A       asl a
67DC: AA       tax
67DD: BD 16 03 lda $0316, x
67E0: 29 7F    and #$7f
67E2: C9 0B    cmp #$0b
67E4: F0 E1    beq $67c7
67E6: A6 00    ldx $00
67E8: AD 11 04 lda $0411
67EB: A8       tay
67EC: 49 01    eor #$01
67EE: 95 4D    sta $4d, x
67F0: AA       tax
67F1: BD 0A 03 lda $030a, x
67F4: 09 84    ora #$84
67F6: 9D 0A 03 sta $030a, x
67F9: B9 0A 03 lda $030a, y
67FC: 29 7F    and #$7f
67FE: 09 04    ora #$04
6800: 99 0A 03 sta $030a, y
6803: A9 00    lda #$00
6805: 8D FD 07 sta $07fd
6808: 60       rts
6809: A6 00    ldx $00
680B: B5 61    lda $61, x
680D: 95 4D    sta $4d, x
680F: AA       tax
6810: 49 01    eor #$01
6812: A8       tay
6813: BD 0A 03 lda $030a, x
6816: 09 84    ora #$84
6818: 9D 0A 03 sta $030a, x
681B: B9 0A 03 lda $030a, y
681E: 29 7F    and #$7f
6820: 09 04    ora #$04
6822: 99 0A 03 sta $030a, y
6825: A9 00    lda #$00
6827: 8D FD 07 sta $07fd
682A: 60       rts
682B: A5 00    lda $00
682D: AA       tax
682E: 0A       asl a
682F: 95 4D    sta $4d, x
6831: AA       tax
6832: BD 0A 03 lda $030a, x
6835: 09 84    ora #$84
6837: 9D 0A 03 sta $030a, x
683A: BD 0B 03 lda $030b, x
683D: 29 7F    and #$7f
683F: 9D 0B 03 sta $030b, x
6842: A9 00    lda #$00
6844: 8D FD 07 sta $07fd
6847: 60       rts
6848: A5 00    lda $00
684A: AA       tax
684B: 0A       asl a
684C: 09 01    ora #$01
684E: 95 4D    sta $4d, x
6850: AA       tax
6851: BD 0A 03 lda $030a, x
6854: 09 80    ora #$80
6856: 9D 0A 03 sta $030a, x
6859: BD 09 03 lda $0309, x
685C: 29 7F    and #$7f
685E: 09 04    ora #$04
6860: 9D 09 03 sta $0309, x
6863: A9 00    lda #$00
6865: 8D FD 07 sta $07fd
6868: 60       rts
6869: A6 00    ldx $00
686B: B5 5F    lda $5f, x
686D: AA       tax
686E: 49 01    eor #$01
6870: A8       tay
6871: B9 0A 03 lda $030a, y
6874: 09 84    ora #$84
6876: 99 0A 03 sta $030a, y
6879: BD 0A 03 lda $030a, x
687C: 29 7F    and #$7f
687E: 09 04    ora #$04
6880: 9D 0A 03 sta $030a, x
6883: 8A       txa
6884: 4A       lsr a
6885: AA       tax
6886: 98       tya
6887: 95 4D    sta $4d, x
6889: A9 00    lda #$00
688B: 8D FD 07 sta $07fd
688E: 60       rts
688F: A6 00    ldx $00
6891: B5 5F    lda $5f, x
6893: 95 4D    sta $4d, x
6895: AA       tax
6896: 49 01    eor #$01
6898: A8       tay
6899: BD 0A 03 lda $030a, x
689C: 09 84    ora #$84
689E: 9D 0A 03 sta $030a, x
68A1: B9 0A 03 lda $030a, y
68A4: 29 7F    and #$7f
68A6: 09 04    ora #$04
68A8: 99 0A 03 sta $030a, y
68AB: A9 00    lda #$00
68AD: 8D FD 07 sta $07fd
68B0: 60       rts
68B1: AD 77 03 lda $0377
68B4: 29 0F    and #$0f
68B6: C9 03    cmp #$03
68B8: B0 42    bcs $68fc
68BA: 85 2A    sta $2a
68BC: A5 00    lda $00
68BE: 6A       ror a
68BF: 6A       ror a
68C0: 85 29    sta $29
68C2: 38       sec
68C3: A5 93    lda $93
68C5: E9 C8    sbc #$c8
68C7: 85 28    sta $28
68C9: 06 1B    asl $1b
68CB: A5 00    lda $00
68CD: 65 1B    adc $1b
68CF: 85 1B    sta $1b
68D1: 0A       asl a
68D2: 65 1B    adc $1b
68D4: 65 2A    adc $2a
68D6: A8       tay
68D7: 38       sec
68D8: A5 28    lda $28
68DA: F9 FF 68 sbc $68ff, y
68DD: 30 18    bmi $68f7
68DF: 98       tya
68E0: 0A       asl a
68E1: A8       tay
68E2: 38       sec
68E3: B9 0B 69 lda $690b, y
68E6: E5 28    sbc $28
68E8: 30 12    bmi $68fc
68EA: 0A       asl a
68EB: 0A       asl a
68EC: 0A       asl a
68ED: 79 0C 69 adc $690c, y
68F0: 85 2A    sta $2a
68F2: 38       sec
68F3: A5 BD    lda $bd
68F5: E5 2A    sbc $2a
68F7: 45 29    eor $29
68F9: 29 80    and #$80
68FB: 60       rts
68FC: A9 00    lda #$00
68FE: 60       rts
6923: 48       pha
6924: 8A       txa
6925: 48       pha
6926: 98       tya
6927: 48       pha
6928: A6 1B    ldx $1b
692A: A4 1C    ldy $1c
692C: 38       sec
692D: B5 8F    lda $8f, x
692F: F9 8F 00 sbc $008f, y
6932: 85 1B    sta $1b
6934: B5 9D    lda $9d, x
6936: F9 9D 00 sbc $009d, y
6939: F0 14    beq $694f
693B: C9 FF    cmp #$ff
693D: B0 07    bcs $6946
693F: A9 FF    lda #$ff
6941: 85 1B    sta $1b
6943: 4C 4F 69 jmp $694f
6946: 18       clc
6947: A5 1B    lda $1b
6949: 49 FF    eor #$ff
694B: 69 01    adc #$01
694D: 85 1B    sta $1b
694F: 38       sec
6950: B5 B9    lda $b9, x
6952: F9 B9 00 sbc $00b9, y
6955: 85 1C    sta $1c
6957: B5 C7    lda $c7, x
6959: F9 C7 00 sbc $00c7, y
695C: F0 14    beq $6972
695E: C9 FF    cmp #$ff
6960: B0 07    bcs $6969
6962: A9 FF    lda #$ff
6964: 85 1C    sta $1c
6966: 4C 72 69 jmp $6972
6969: 18       clc
696A: A5 1C    lda $1c
696C: 49 FF    eor #$ff
696E: 69 01    adc #$01
6970: 85 1C    sta $1c
6972: 38       sec
6973: B5 E3    lda $e3, x
6975: F9 E3 00 sbc $00e3, y
6978: 85 1D    sta $1d
697A: B5 F1    lda $f1, x
697C: F9 F1 00 sbc $00f1, y
697F: F0 14    beq $6995
6981: C9 FF    cmp #$ff
6983: B0 07    bcs $698c
6985: A9 FF    lda #$ff
6987: 85 1D    sta $1d
6989: 4C 95 69 jmp $6995
698C: 18       clc
698D: A5 1D    lda $1d
698F: 49 FF    eor #$ff
6991: 69 01    adc #$01
6993: 85 1D    sta $1d
6995: A5 1B    lda $1b
6997: C9 FF    cmp #$ff
6999: F0 38    beq $69d3
699B: 85 10    sta $10
699D: 85 12    sta $12
699F: A9 00    lda #$00
69A1: 85 11    sta $11
69A3: 85 13    sta $13
69A5: 20 29 D1 jsr $d129
69A8: A5 14    lda $14
69AA: 85 1E    sta $1e
69AC: A5 15    lda $15
69AE: 85 1F    sta $1f
69B0: A5 1C    lda $1c
69B2: C9 FF    cmp #$ff
69B4: F0 1D    beq $69d3
69B6: 85 10    sta $10
69B8: 85 12    sta $12
69BA: A9 00    lda #$00
69BC: 85 11    sta $11
69BE: 85 13    sta $13
69C0: 20 29 D1 jsr $d129
69C3: 18       clc
69C4: A5 14    lda $14
69C6: 65 1E    adc $1e
69C8: 85 1E    sta $1e
69CA: A5 15    lda $15
69CC: 65 1F    adc $1f
69CE: 85 1F    sta $1f
69D0: 4C D9 69 jmp $69d9
69D3: A9 FF    lda #$ff
69D5: 85 1E    sta $1e
69D7: 85 1F    sta $1f
69D9: 68       pla
69DA: A8       tay
69DB: 68       pla
69DC: AA       tax
69DD: 68       pla
69DE: 60       rts
69DF: 48       pha
69E0: 8A       txa
69E1: 48       pha
69E2: 98       tya
69E3: 48       pha
69E4: A5 56    lda $56
69E6: 29 0F    and #$0f
69E8: C9 06    cmp #$06
69EA: B0 25    bcs $6a11
69EC: 0A       asl a
69ED: A8       tay
69EE: 8A       txa
69EF: 0A       asl a
69F0: 0A       asl a
69F1: 0A       asl a
69F2: 49 10    eor #$10
69F4: 29 10    and #$10
69F6: 85 00    sta $00
69F8: B9 05 6A lda table_6a05, y
69FB: 85 1B    sta $1b
69FD: B9 06 6A lda $6a06, y
6A00: 85 1C    sta $1c
6A02: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

6A11: A9 FF    lda #$ff
6A13: 85 1B    sta $1b
6A15: 4C 79 6B jmp $6b79

6A18: A9 09    lda #$09
6A1A: 85 27    sta $27
6A1C: A9 2F    lda #$2f
6A1E: 85 28    sta $28
6A20: A9 11    lda #$11
6A22: 85 29    sta $29
6A24: A9 14    lda #$14
6A26: 85 2A    sta $2a
6A28: 4C 3B 6A jmp $6a3b
6A2B: A9 50    lda #$50
6A2D: 85 27    sta $27
6A2F: A9 76    lda #$76
6A31: 85 28    sta $28
6A33: A9 58    lda #$58
6A35: 85 29    sta $29
6A37: A9 5B    lda #$5b
6A39: 85 2A    sta $2a
6A3B: A9 00    lda #$00
6A3D: 85 26    sta $26
6A3F: 86 1C    stx $1c
6A41: 8A       txa
6A42: 4A       lsr a
6A43: AA       tax
6A44: 49 01    eor #$01
6A46: A8       tay
6A47: 38       sec
6A48: B5 57    lda $57, x
6A4A: F9 57 00 sbc $0057, y
6A4D: F0 04    beq $6a53
6A4F: 10 04    bpl $6a55
6A51: E6 26    inc $26
6A53: E6 26    inc $26
6A55: A6 1C    ldx $1c
6A57: BD 12 03 lda $0312, x
6A5A: 0A       asl a
6A5B: A8       tay
6A5C: 18       clc
6A5D: A5 3A    lda $3a
6A5F: 0A       asl a
6A60: 85 1C    sta $1c
6A62: 18       clc
6A63: B9 14 40 lda $4014, y
6A66: 85 16    sta $16
6A68: 65 1C    adc $1c
6A6A: 65 27    adc $27
6A6C: 85 10    sta $10
6A6E: B9 15 40 lda $4015, y
6A71: 85 17    sta $17
6A73: 69 00    adc #$00
6A75: 85 11    sta $11
6A77: 20 09 66 jsr $6609
6A7A: C9 01    cmp #$01
6A7C: B0 27    bcs $6aa5
6A7E: A5 56    lda $56
6A80: 09 20    ora #$20
6A82: 85 56    sta $56
6A84: A5 26    lda $26
6A86: 0A       asl a
6A87: 65 26    adc $26
6A89: 0A       asl a
6A8A: 65 26    adc $26
6A8C: 65 28    adc $28
6A8E: 65 16    adc $16
6A90: 85 10    sta $10
6A92: A5 17    lda $17
6A94: 69 00    adc #$00
6A96: 85 11    sta $11
6A98: 20 09 66 jsr $6609
6A9B: 18       clc
6A9C: 69 09    adc #$09
6A9E: 05 00    ora $00
6AA0: 85 1B    sta $1b
6AA2: 4C 79 6B jmp $6b79
6AA5: A5 56    lda $56
6AA7: 29 DF    and #$df
6AA9: 85 56    sta $56
6AAB: 18       clc
6AAC: A5 16    lda $16
6AAE: 65 29    adc $29
6AB0: 85 10    sta $10
6AB2: A5 17    lda $17
6AB4: 69 00    adc #$00
6AB6: 85 11    sta $11
6AB8: 20 09 66 jsr $6609
6ABB: D0 1E    bne $6adb
6ABD: 18       clc
6ABE: A5 26    lda $26
6AC0: 0A       asl a
6AC1: 0A       asl a
6AC2: 0A       asl a
6AC3: 65 26    adc $26
6AC5: 65 2A    adc $2a
6AC7: 65 16    adc $16
6AC9: 85 10    sta $10
6ACB: A5 17    lda $17
6ACD: 69 00    adc #$00
6ACF: 85 11    sta $11
6AD1: 20 09 66 jsr $6609
6AD4: 05 00    ora $00
6AD6: 85 1B    sta $1b
6AD8: 4C 79 6B jmp $6b79
6ADB: 85 1B    sta $1b
6ADD: 8A       txa
6ADE: 4A       lsr a
6ADF: 49 01    eor #$01
6AE1: A8       tay
6AE2: B9 5F 00 lda $005f, y
6AE5: A8       tay
6AE6: A5 1B    lda $1b
6AE8: C9 02    cmp #$02
6AEA: D0 04    bne $6af0
6AEC: 98       tya
6AED: 49 01    eor #$01
6AEF: A8       tay
6AF0: B9 73 03 lda $0373, y
6AF3: 85 1B    sta $1b
6AF5: 4C 79 6B jmp $6b79
6AF8: BD 73 03 lda $0373, x
6AFB: 29 0F    and #$0f
6AFD: C9 0C    cmp #$0c
6AFF: B0 0E    bcs $6b0f
6B01: C9 09    cmp #$09
6B03: B0 05    bcs $6b0a
6B05: A9 8B    lda #$8b
6B07: 4C 11 6B jmp $6b11
6B0A: A9 9B    lda #$9b
6B0C: 4C 11 6B jmp $6b11
6B0F: A9 AB    lda #$ab
6B11: 85 26    sta $26
6B13: A5 3A    lda $3a
6B15: 0A       asl a
6B16: 0A       asl a
6B17: 65 26    adc $26
6B19: 85 26    sta $26
6B1B: BD 1A 03 lda $031a, x
6B1E: 29 7F    and #$7f
6B20: C9 0F    cmp #$0f
6B22: F0 07    beq $6b2b
6B24: 18       clc
6B25: A5 26    lda $26
6B27: 69 02    adc #$02
6B29: 85 26    sta $26
6B2B: BD 12 03 lda $0312, x
6B2E: 0A       asl a
6B2F: A8       tay
6B30: 18       clc
6B31: B9 14 40 lda $4014, y
6B34: 65 26    adc $26
6B36: 85 10    sta $10
6B38: B9 15 40 lda $4015, y
6B3B: 69 00    adc #$00
6B3D: 85 11    sta $11
6B3F: 20 09 66 jsr $6609
6B42: C9 01    cmp #$01
6B44: B0 1B    bcs $6b61
6B46: A5 56    lda $56
6B48: 09 20    ora #$20
6B4A: 85 56    sta $56
6B4C: 20 0A D0 jsr $d00a
6B4F: 29 07    and #$07
6B51: C9 07    cmp #$07
6B53: D0 02    bne $6b57
6B55: A9 06    lda #$06
6B57: 18       clc
6B58: 69 08    adc #$08
6B5A: 05 00    ora $00
6B5C: 85 1B    sta $1b
6B5E: 4C 79 6B jmp $6b79
6B61: A5 56    lda $56
6B63: 29 DF    and #$df
6B65: 85 56    sta $56
6B67: 20 0A D0 jsr $d00a
6B6A: 29 07    and #$07
6B6C: C9 06    cmp #$06
6B6E: 90 02    bcc $6b72
6B70: A9 05    lda #$05
6B72: 18       clc
6B73: 69 03    adc #$03
6B75: 05 00    ora $00
6B77: 85 1B    sta $1b
6B79: 68       pla
6B7A: A8       tay
6B7B: 68       pla
6B7C: AA       tax
6B7D: 68       pla
6B7E: 60       rts
6B7F: 85 1C    sta $1c
6B81: 84 1B    sty $1b
6B83: 8A       txa
6B84: 48       pha
6B85: 98       tya
6B86: 48       pha
6B87: A6 1C    ldx $1c
6B89: A9 00    lda #$00
6B8B: 85 1F    sta $1f
6B8D: 85 20    sta $20
6B8F: 8A       txa
6B90: 4A       lsr a
6B91: A8       tay
6B92: B9 47 00 lda $0047, y
6B95: 29 80    and #$80
6B97: F0 02    beq $6b9b
6B99: A9 11    lda #$11
6B9B: 18       clc
6B9C: 6D E0 03 adc $03e0
6B9F: 0A       asl a
6BA0: A8       tay
6BA1: B9 BA 6B lda table_6bba, y
6BA4: 85 25    sta $25
6BA6: B9 BB 6B lda $6bbb, y
6BA9: 85 26    sta $26
6BAB: 6C 25 00 jmp ($0025)        ; [indirect_jump]
6BAE: A9 00    lda #$00
6BB0: 85 1D    sta $1d
6BB2: 68       pla
6BB3: A8       tay
6BB4: 68       pla
6BB5: AA       tax
6BB6: 60       rts
6BB7: 4C B7 6B jmp $6bb7

6BFE: 8A       txa
6BFF: 4A       lsr a
6C00: A8       tay
6C01: B9 54 00 lda $0054, y
6C04: C9 0E    cmp #$0e
6C06: F0 04    beq $6c0c
6C08: C9 0F    cmp #$0f
6C0A: D0 03    bne $6c0f
6C0C: 4C 7D 6D jmp $6d7d
6C0F: 20 DF 69 jsr $69df
6C12: A9 00    lda #$00
6C14: 85 20    sta $20
6C16: 4C 54 6E jmp $6e54
6C19: 8A       txa
6C1A: 49 01    eor #$01
6C1C: A8       tay
6C1D: B9 73 03 lda $0373, y
6C20: 85 1B    sta $1b
6C22: 29 0F    and #$0f
6C24: F0 08    beq $6c2e
6C26: C9 09    cmp #$09
6C28: B0 0D    bcs $6c37
6C2A: C9 03    cmp #$03
6C2C: D0 02    bne $6c30
6C2E: E6 1B    inc $1b
6C30: A9 50    lda #$50
6C32: 85 20    sta $20
6C34: 4C 54 6E jmp $6e54
6C37: 38       sec
6C38: E9 09    sbc #$09
6C3A: A8       tay
6C3B: B9 1D 6E lda $6e1d, y
6C3E: 85 20    sta $20
6C40: A5 1B    lda $1b
6C42: 29 10    and #$10
6C44: 05 20    ora $20
6C46: 85 1B    sta $1b
6C48: A9 50    lda #$50
6C4A: 85 20    sta $20
6C4C: 4C 54 6E jmp $6e54
6C4F: 8A       txa
6C50: 4A       lsr a
6C51: A8       tay
6C52: B9 54 00 lda $0054, y
6C55: 29 7F    and #$7f
6C57: C9 0E    cmp #$0e
6C59: F0 04    beq $6c5f
6C5B: C9 0F    cmp #$0f
6C5D: D0 53    bne $6cb2
6C5F: 8A       txa
6C60: 49 01    eor #$01
6C62: A8       tay
6C63: B9 73 03 lda $0373, y
6C66: 29 0F    and #$0f
6C68: C9 0D    cmp #$0d
6C6A: D0 11    bne $6c7d
6C6C: 8A       txa
6C6D: 29 02    and #$02
6C6F: 0A       asl a
6C70: 0A       asl a
6C71: 0A       asl a
6C72: 09 07    ora #$07
6C74: 85 1B    sta $1b
6C76: A9 78    lda #$78
6C78: 85 20    sta $20
6C7A: 4C 54 6E jmp $6e54
6C7D: B9 9D 00 lda $009d, y
6C80: 85 1B    sta $1b
6C82: B9 8F 00 lda $008f, y
6C85: 85 1C    sta $1c
6C87: B9 B9 00 lda $00b9, y
6C8A: 85 1E    sta $1e
6C8C: A9 78    lda #$78
6C8E: 85 20    sta $20
6C90: 4C AE 6B jmp $6bae
6C93: 8A       txa
6C94: 4A       lsr a
6C95: A8       tay
6C96: 8A       txa
6C97: D9 5F 00 cmp $005f, y
6C9A: F0 16    beq $6cb2
6C9C: A5 53    lda $53
6C9E: C9 01    cmp #$01
6CA0: D0 10    bne $6cb2
6CA2: A9 05    lda #$05
6CA4: 8D E0 03 sta $03e0
6CA7: A5 56    lda $56
6CA9: 29 F0    and #$f0
6CAB: 09 03    ora #$03
6CAD: 85 56    sta $56
6CAF: 4C A0 6D jmp $6da0
6CB2: 8A       txa
6CB3: 49 01    eor #$01
6CB5: 85 2A    sta $2a
6CB7: A8       tay
6CB8: A9 78    lda #$78
6CBA: 85 20    sta $20
6CBC: B9 73 03 lda $0373, y
6CBF: A8       tay
6CC0: 29 10    and #$10
6CC2: F0 02    beq $6cc6
6CC4: A9 01    lda #$01
6CC6: 85 1B    sta $1b
6CC8: B9 2A 6E lda $6e2a, y
6CCB: 85 1C    sta $1c
6CCD: 0A       asl a
6CCE: B0 09    bcs $6cd9
6CD0: 0A       asl a
6CD1: 90 03    bcc $6cd6
6CD3: 4C 6B 6D jmp $6d6b
6CD6: 0A       asl a
6CD7: B0 46    bcs $6d1f
6CD9: A4 2A    ldy $2a
6CDB: B9 B9 00 lda $00b9, y
6CDE: 85 1E    sta $1e
6CE0: 8A       txa
6CE1: 4A       lsr a
6CE2: A8       tay
6CE3: B9 47 00 lda $0047, y
6CE6: 30 34    bmi $6d1c
6CE8: B9 54 00 lda $0054, y
6CEB: 29 7F    and #$7f
6CED: C9 0C    cmp #$0c
6CEF: F0 2B    beq $6d1c
6CF1: C9 0D    cmp #$0d
6CF3: F0 27    beq $6d1c
6CF5: 20 0A D0 jsr $d00a
6CF8: 29 3F    and #$3f
6CFA: 18       clc
6CFB: 69 10    adc #$10
6CFD: 4A       lsr a
6CFE: 90 04    bcc $6d04
6D00: 49 FF    eor #$ff
6D02: 69 00    adc #$00
6D04: 18       clc
6D05: 65 1E    adc $1e
6D07: C9 B0    cmp #$b0
6D09: B0 0D    bcs $6d18
6D0B: C9 78    cmp #$78
6D0D: 90 05    bcc $6d14
6D0F: A9 78    lda #$78
6D11: 4C 1A 6D jmp $6d1a
6D14: C9 18    cmp #$18
6D16: B0 02    bcs $6d1a
6D18: A9 18    lda #$18
6D1A: 85 1E    sta $1e
6D1C: 4C AE 6B jmp $6bae
6D1F: A4 2A    ldy $2a
6D21: B9 B9 00 lda $00b9, y
6D24: C9 18    cmp #$18
6D26: 90 15    bcc $6d3d
6D28: C9 38    cmp #$38
6D2A: 90 1A    bcc $6d46
6D2C: C9 58    cmp #$58
6D2E: 90 20    bcc $6d50
6D30: C9 78    cmp #$78
6D32: 90 26    bcc $6d5a
6D34: A5 1C    lda $1c
6D36: 29 04    and #$04
6D38: 85 1C    sta $1c
6D3A: 4C 6B 6D jmp $6d6b
6D3D: A5 1C    lda $1c
6D3F: 29 0A    and #$0a
6D41: 85 1C    sta $1c
6D43: 4C 6B 6D jmp $6d6b
6D46: A5 1C    lda $1c
6D48: 29 08    and #$08
6D4A: 0A       asl a
6D4B: 09 02    ora #$02
6D4D: 4C 62 6D jmp $6d62
6D50: A5 1C    lda $1c
6D52: 29 08    and #$08
6D54: 0A       asl a
6D55: 09 01    ora #$01
6D57: 4C 62 6D jmp $6d62
6D5A: A5 1C    lda $1c
6D5C: 29 08    and #$08
6D5E: 0A       asl a
6D5F: 4C 62 6D jmp $6d62
6D62: A8       tay
6D63: B9 2A 6E lda $6e2a, y
6D66: 85 1C    sta $1c
6D68: 4C D9 6C jmp $6cd9
6D6B: A5 1C    lda $1c
6D6D: 29 0F    and #$0f
6D6F: A8       tay
6D70: B9 4A 6E lda $6e4a, y
6D73: 85 1C    sta $1c
6D75: B9 4B 6E lda $6e4b, y
6D78: 85 1E    sta $1e
6D7A: 4C AE 6B jmp $6bae
6D7D: 20 0A D0 jsr $d00a
6D80: 29 03    and #$03
6D82: C9 02    cmp #$02
6D84: 90 02    bcc $6d88
6D86: A9 02    lda #$02
6D88: 18       clc
6D89: 69 06    adc #$06
6D8B: 85 1B    sta $1b
6D8D: 8A       txa
6D8E: 49 02    eor #$02
6D90: 29 02    and #$02
6D92: 0A       asl a
6D93: 0A       asl a
6D94: 0A       asl a
6D95: 65 1B    adc $1b
6D97: 85 1B    sta $1b
6D99: A9 00    lda #$00
6D9B: 85 20    sta $20
6D9D: 4C 54 6E jmp $6e54
6DA0: 8A       txa
6DA1: 49 01    eor #$01
6DA3: A8       tay
6DA4: B9 0E 03 lda $030e, y
6DA7: 29 40    and #$40
6DA9: F0 10    beq $6dbb
6DAB: A9 04    lda #$04
6DAD: 8D E0 03 sta $03e0
6DB0: A5 56    lda $56
6DB2: 29 F0    and #$f0
6DB4: 09 01    ora #$01
6DB6: 85 56    sta $56
6DB8: 4C 7D 6D jmp $6d7d
6DBB: 8A       txa
6DBC: 4A       lsr a
6DBD: A8       tay
6DBE: 8A       txa
6DBF: D9 5F 00 cmp $005f, y
6DC2: D0 23    bne $6de7
6DC4: 49 01    eor #$01
6DC6: A8       tay
6DC7: B9 73 03 lda $0373, y
6DCA: 29 0F    and #$0f
6DCC: C9 02    cmp #$02
6DCE: 90 05    bcc $6dd5
6DD0: E9 03    sbc #$03
6DD2: 4C CC 6D jmp $6dcc
6DD5: 85 1B    sta $1b
6DD7: B9 73 03 lda $0373, y
6DDA: 29 10    and #$10
6DDC: 05 1B    ora $1b
6DDE: 85 1B    sta $1b
6DE0: A9 50    lda #$50
6DE2: 85 20    sta $20
6DE4: 4C 54 6E jmp $6e54
6DE7: 8A       txa
6DE8: 49 01    eor #$01
6DEA: A8       tay
6DEB: B9 73 03 lda $0373, y
6DEE: 85 1B    sta $1b
6DF0: 29 0F    and #$0f
6DF2: F0 08    beq $6dfc
6DF4: C9 09    cmp #$09
6DF6: B0 0D    bcs $6e05
6DF8: C9 03    cmp #$03
6DFA: D0 02    bne $6dfe
6DFC: E6 1B    inc $1b
6DFE: A9 50    lda #$50
6E00: 85 20    sta $20
6E02: 4C 54 6E jmp $6e54
6E05: 38       sec
6E06: E9 09    sbc #$09
6E08: A8       tay
6E09: B9 1D 6E lda $6e1d, y
6E0C: 85 20    sta $20
6E0E: A5 1B    lda $1b
6E10: 29 10    and #$10
6E12: 05 20    ora $20
6E14: 85 1B    sta $1b
6E16: A9 50    lda #$50
6E18: 85 20    sta $20
6E1A: 4C 54 6E jmp $6e54

6E23: A9 00    lda #$00
6E25: 85 20    sta $20
6E27: 4C 54 6E jmp $6e54

6E54: A5 1B    lda $1b
6E56: 85 28    sta $28
6E58: 29 0F    and #$0f
6E5A: C9 0A    cmp #$0a
6E5C: F0 59    beq $6eb7
6E5E: C9 0D    cmp #$0d
6E60: F0 55    beq $6eb7
6E62: C9 0F    cmp #$0f
6E64: D0 03    bne $6e69
6E66: 4C EF 6E jmp $6eef
6E69: AD E0 03 lda $03e0
6E6C: C9 0A    cmp #$0a
6E6E: D0 1E    bne $6e8e
6E70: A5 1B    lda $1b
6E72: 29 0F    and #$0f
6E74: 85 24    sta $24
6E76: C9 03    cmp #$03
6E78: B0 14    bcs $6e8e
6E7A: A5 1B    lda $1b
6E7C: 29 10    and #$10
6E7E: F0 07    beq $6e87
6E80: 18       clc
6E81: A5 24    lda $24
6E83: 69 03    adc #$03
6E85: 85 1B    sta $1b
6E87: 18       clc
6E88: A5 1B    lda $1b
6E8A: 69 20    adc #$20
6E8C: 85 1B    sta $1b
6E8E: A5 1B    lda $1b
6E90: 0A       asl a
6E91: 0A       asl a
6E92: A8       tay
6E93: A9 59    lda #$59
6E95: 85 25    sta $25
6E97: A9 6F    lda #$6f
6E99: 85 26    sta $26
6E9B: A5 28    lda $28
6E9D: 85 1B    sta $1b
6E9F: A5 1B    lda $1b
6EA1: 29 10    and #$10
6EA3: F0 02    beq $6ea7
6EA5: A9 01    lda #$01
6EA7: 85 1B    sta $1b
6EA9: 20 1B 6F jsr $6f1b
6EAC: 85 1C    sta $1c
6EAE: C8       iny
6EAF: 20 1B 6F jsr $6f1b
6EB2: 85 1E    sta $1e
6EB4: 4C AE 6B jmp $6bae
6EB7: 38       sec
6EB8: A5 1B    lda $1b
6EBA: E9 0A    sbc #$0a
6EBC: 85 1B    sta $1b
6EBE: 20 0A D0 jsr $d00a
6EC1: 29 03    and #$03
6EC3: C9 03    cmp #$03
6EC5: D0 02    bne $6ec9
6EC7: A9 01    lda #$01
6EC9: 18       clc
6ECA: 65 1B    adc $1b
6ECC: 85 1B    sta $1b
6ECE: 29 0F    and #$0f
6ED0: 0A       asl a
6ED1: 0A       asl a
6ED2: A8       tay
6ED3: A5 1B    lda $1b
6ED5: 29 10    and #$10
6ED7: D0 0B    bne $6ee4
6ED9: A9 F1    lda #$f1
6EDB: 85 25    sta $25
6EDD: A9 6F    lda #$6f
6EDF: 85 26    sta $26
6EE1: 4C 9F 6E jmp $6e9f
6EE4: A9 09    lda #$09
6EE6: 85 25    sta $25
6EE8: A9 70    lda #$70
6EEA: 85 26    sta $26
6EEC: 4C 9F 6E jmp $6e9f
6EEF: BD 73 03 lda $0373, x
6EF2: 29 0F    and #$0f
6EF4: C9 02    cmp #$02
6EF6: 90 05    bcc $6efd
6EF8: E9 03    sbc #$03
6EFA: 4C F4 6E jmp $6ef4
6EFD: 0A       asl a
6EFE: 0A       asl a
6EFF: A8       tay
6F00: B9 21 70 lda $7021, y
6F03: 85 1B    sta $1b
6F05: B9 22 70 lda $7022, y
6F08: 85 1C    sta $1c
6F0A: B9 23 70 lda $7023, y
6F0D: 85 1D    sta $1d
6F0F: B9 24 70 lda $7024, y
6F12: 85 1E    sta $1e
6F14: A9 30    lda #$30
6F16: 85 20    sta $20
6F18: 4C AE 6B jmp $6bae
6F1B: B1 25    lda ($25), y
6F1D: 85 2A    sta $2a
6F1F: 20 0A D0 jsr $d00a
6F22: C5 2A    cmp $2a
6F24: 90 05    bcc $6f2b
6F26: E5 2A    sbc $2a
6F28: 4C 22 6F jmp $6f22
6F2B: C8       iny
6F2C: 71 25    adc ($25), y
6F2E: 60       rts
6F2F: 20 0A D0 jsr $d00a
6F32: 29 03    and #$03
6F34: C9 03    cmp #$03
6F36: D0 02    bne $6f3a
6F38: A9 01    lda #$01
6F3A: 0A       asl a
6F3B: 0A       asl a
6F3C: A8       tay
6F3D: A5 1B    lda $1b
6F3F: 29 10    and #$10
6F41: D0 0B    bne $6f4e
6F43: A9 FD    lda #$fd
6F45: 85 25    sta $25
6F47: A9 6F    lda #$6f
6F49: 85 26    sta $26
6F4B: 4C 9F 6E jmp $6e9f
6F4E: A9 15    lda #$15
6F50: 85 25    sta $25
6F52: A9 70    lda #$70
6F54: 85 26    sta $26
6F56: 4C 9F 6E jmp $6e9f

702D: 48       pha
702E: 8A       txa
702F: 48       pha
7030: 98       tya
7031: 48       pha
7032: A6 4C    ldx $4c
7034: BD 0E 03 lda $030e, x
7037: 29 40    and #$40
7039: D0 29    bne $7064
703B: BD 1A 03 lda $031a, x
703E: 29 7F    and #$7f
7040: C9 22    cmp #$22
7042: F0 20    beq $7064
7044: C9 23    cmp #$23
7046: F0 1C    beq $7064
7048: C9 24    cmp #$24
704A: F0 18    beq $7064
704C: BD 16 03 lda $0316, x
704F: 29 7F    and #$7f
7051: C9 16    cmp #$16
7053: B0 FE    bcs $7053
7055: 0A       asl a
7056: A8       tay
7057: B9 7A 70 lda table_707a, y
705A: 85 1B    sta $1b
705C: B9 7B 70 lda $707b, y
705F: 85 1C    sta $1c
7061: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
7064: BD 16 03 lda $0316, x
7067: 29 7F    and #$7f
7069: 9D 16 03 sta $0316, x
706C: BD 0A 03 lda $030a, x
706F: 29 FE    and #$fe
7071: 9D 0A 03 sta $030a, x
7074: 68       pla
7075: A8       tay
7076: 68       pla
7077: AA       tax
7078: 68       pla
7079: 60       rts

70A6: BD 16 03 lda $0316, x
70A9: 30 13    bmi $70be
70AB: 09 80    ora #$80
70AD: 9D 16 03 sta $0316, x
70B0: AD E0 03 lda $03e0
70B3: C9 0B    cmp #$0b
70B5: F0 0A    beq $70c1
70B7: A9 00    lda #$00
70B9: 09 80    ora #$80
70BB: 9D 27 03 sta $0327, x
70BE: 4C 6C 70 jmp $706c
70C1: A9 04    lda #$04
70C3: 09 80    ora #$80
70C5: 9D 27 03 sta $0327, x
70C8: 4C 6C 70 jmp $706c
70CB: 20 B0 90 jsr $90b0
70CE: 90 03    bcc $70d3
70D0: 4C 31 71 jmp $7131
70D3: BD 16 03 lda $0316, x
70D6: 10 0A    bpl $70e2
70D8: BD B8 03 lda $03b8, x
70DB: C9 FF    cmp #$ff
70DD: F0 52    beq $7131
70DF: 4C 0F 71 jmp $710f
70E2: 09 80    ora #$80
70E4: 9D 16 03 sta $0316, x
70E7: A9 00    lda #$00
70E9: 9D B8 03 sta $03b8, x
70EC: 20 E0 85 jsr $85e0
70EF: A5 1B    lda $1b
70F1: 9D 84 03 sta $0384, x
70F4: A5 1C    lda $1c
70F6: 9D 80 03 sta $0380, x
70F9: A5 1D    lda $1d
70FB: 9D 88 03 sta $0388, x
70FE: A9 00    lda #$00
7100: 9D 8C 03 sta $038c, x
7103: 20 3E 90 jsr $903e
7106: 9D 78 03 sta $0378, x
7109: 20 26 90 jsr $9026
710C: 9D 2B 03 sta $032b, x
710F: 20 29 82 jsr $8229
7112: 90 3E    bcc $7152
7114: BD B8 03 lda $03b8, x
7117: D0 18    bne $7131
7119: A9 01    lda #$01
711B: 20 96 82 jsr $8296
711E: 90 23    bcc $7143
7120: 20 FA 83 jsr $83fa
7123: 90 0F    bcc $7134
7125: A9 08    lda #$08
7127: 09 80    ora #$80
7129: 9D 27 03 sta $0327, x
712C: A9 01    lda #$01
712E: 9D B8 03 sta $03b8, x
7131: 4C 6C 70 jmp $706c
7134: A9 07    lda #$07
7136: 09 80    ora #$80
7138: 9D 27 03 sta $0327, x
713B: A9 01    lda #$01
713D: 9D B8 03 sta $03b8, x
7140: 4C 6C 70 jmp $706c
7143: A9 09    lda #$09
7145: 09 80    ora #$80
7147: 9D 27 03 sta $0327, x
714A: A9 01    lda #$01
714C: 9D B8 03 sta $03b8, x
714F: 4C 6C 70 jmp $706c
7152: A5 56    lda $56
7154: 29 0F    and #$0f
7156: C9 02    cmp #$02
7158: D0 0F    bne $7169
715A: A9 04    lda #$04
715C: 09 80    ora #$80
715E: 9D 27 03 sta $0327, x
7161: A9 FF    lda #$ff
7163: 9D B8 03 sta $03b8, x
7166: 4C 6C 70 jmp $706c
7169: A9 00    lda #$00
716B: 09 80    ora #$80
716D: 9D 27 03 sta $0327, x
7170: A9 FF    lda #$ff
7172: 9D B8 03 sta $03b8, x
7175: 4C 6C 70 jmp $706c
7178: 20 B0 90 jsr $90b0
717B: 90 03    bcc $7180
717D: 4C D9 71 jmp $71d9
7180: BD 16 03 lda $0316, x
7183: 10 0A    bpl $718f
7185: BD B8 03 lda $03b8, x
7188: C9 FF    cmp #$ff
718A: F0 4D    beq $71d9
718C: 4C BC 71 jmp $71bc
718F: 09 80    ora #$80
7191: 9D 16 03 sta $0316, x
7194: A9 00    lda #$00
7196: 9D B8 03 sta $03b8, x
7199: 20 D8 86 jsr $86d8
719C: A5 1B    lda $1b
719E: 9D 84 03 sta $0384, x
71A1: A5 1C    lda $1c
71A3: 9D 80 03 sta $0380, x
71A6: A5 1D    lda $1d
71A8: 9D 88 03 sta $0388, x
71AB: A9 00    lda #$00
71AD: 9D 8C 03 sta $038c, x
71B0: 20 3E 90 jsr $903e
71B3: 9D 78 03 sta $0378, x
71B6: 20 26 90 jsr $9026
71B9: 9D 2B 03 sta $032b, x
71BC: 20 29 82 jsr $8229
71BF: 90 2A    bcc $71eb
71C1: BD B8 03 lda $03b8, x
71C4: D0 13    bne $71d9
71C6: A9 02    lda #$02
71C8: 20 96 82 jsr $8296
71CB: 90 0F    bcc $71dc
71CD: A9 08    lda #$08
71CF: 09 80    ora #$80
71D1: 9D 27 03 sta $0327, x
71D4: A9 01    lda #$01
71D6: 9D B8 03 sta $03b8, x
71D9: 4C 6C 70 jmp $706c
71DC: A9 09    lda #$09
71DE: 09 80    ora #$80
71E0: 9D 27 03 sta $0327, x
71E3: A9 01    lda #$01
71E5: 9D B8 03 sta $03b8, x
71E8: 4C 6C 70 jmp $706c
71EB: A9 00    lda #$00
71ED: 09 80    ora #$80
71EF: 9D 27 03 sta $0327, x
71F2: A9 FF    lda #$ff
71F4: 9D B8 03 sta $03b8, x
71F7: 4C 6C 70 jmp $706c
71FA: A9 04    lda #$04
71FC: 09 80    ora #$80
71FE: 9D 27 03 sta $0327, x
7201: A9 FF    lda #$ff
7203: 9D B8 03 sta $03b8, x
7206: 4C 6C 70 jmp $706c
7209: 20 B0 90 jsr $90b0
720C: 90 03    bcc $7211
720E: 4C 68 72 jmp $7268
7211: BD 16 03 lda $0316, x
7214: 10 0A    bpl $7220
7216: BD B8 03 lda $03b8, x
7219: C9 FF    cmp #$ff
721B: F0 4B    beq $7268
721D: 4C 4D 72 jmp $724d
7220: 09 80    ora #$80
7222: 9D 16 03 sta $0316, x
7225: A9 00    lda #$00
7227: 9D B8 03 sta $03b8, x
722A: 20 92 8E jsr $8e92
722D: A5 1B    lda $1b
722F: 9D 84 03 sta $0384, x
7232: A5 1C    lda $1c
7234: 9D 80 03 sta $0380, x
7237: A5 1D    lda $1d
7239: 9D 8C 03 sta $038c, x
723C: A5 1E    lda $1e
723E: 9D 88 03 sta $0388, x
7241: 20 3E 90 jsr $903e
7244: 9D 78 03 sta $0378, x
7247: 20 26 90 jsr $9026
724A: 9D 2B 03 sta $032b, x
724D: 20 29 82 jsr $8229
7250: 90 28    bcc $727a
7252: BD B8 03 lda $03b8, x
7255: D0 11    bne $7268
7257: 20 89 82 jsr $8289
725A: B0 0F    bcs $726b
725C: A9 08    lda #$08
725E: 09 80    ora #$80
7260: 9D 27 03 sta $0327, x
7263: A9 01    lda #$01
7265: 9D B8 03 sta $03b8, x
7268: 4C 6C 70 jmp $706c
726B: A9 09    lda #$09
726D: 09 80    ora #$80
726F: 9D 27 03 sta $0327, x
7272: A9 01    lda #$01
7274: 9D B8 03 sta $03b8, x
7277: 4C 6C 70 jmp $706c
727A: A9 00    lda #$00
727C: 09 80    ora #$80
727E: 9D 27 03 sta $0327, x
7281: A9 FF    lda #$ff
7283: 9D B8 03 sta $03b8, x
7286: 4C 6C 70 jmp $706c
7289: BD 16 03 lda $0316, x
728C: 10 0A    bpl $7298
728E: BD B8 03 lda $03b8, x
7291: C9 FF    cmp #$ff
7293: F0 5D    beq $72f2
7295: 4C C6 72 jmp $72c6
7298: 09 80    ora #$80
729A: 9D 16 03 sta $0316, x
729D: A9 00    lda #$00
729F: 9D B8 03 sta $03b8, x
72A2: AD EB 03 lda $03eb
72A5: 9D 84 03 sta $0384, x
72A8: AD EA 03 lda $03ea
72AB: 9D 80 03 sta $0380, x
72AE: AD ED 03 lda $03ed
72B1: 9D 8C 03 sta $038c, x
72B4: AD EC 03 lda $03ec
72B7: 9D 88 03 sta $0388, x
72BA: AD E9 03 lda $03e9
72BD: 9D 78 03 sta $0378, x
72C0: 20 26 90 jsr $9026
72C3: 9D 2B 03 sta $032b, x
72C6: 20 29 84 jsr $8429
72C9: 90 39    bcc $7304
72CB: A9 0B    lda #$0b
72CD: 20 96 82 jsr $8296
72D0: B0 32    bcs $7304
72D2: BD B8 03 lda $03b8, x
72D5: D0 1B    bne $72f2
72D7: A9 00    lda #$00
72D9: 20 49 85 jsr $8549
72DC: A5 1B    lda $1b
72DE: 9D B4 03 sta $03b4, x
72E1: 20 7D 82 jsr $827d
72E4: B0 0F    bcs $72f5
72E6: A9 08    lda #$08
72E8: 09 80    ora #$80
72EA: 9D 27 03 sta $0327, x
72ED: A9 01    lda #$01
72EF: 9D B8 03 sta $03b8, x
72F2: 4C 6C 70 jmp $706c
72F5: A9 09    lda #$09
72F7: 09 80    ora #$80
72F9: 9D 27 03 sta $0327, x
72FC: A9 01    lda #$01
72FE: 9D B8 03 sta $03b8, x
7301: 4C 6C 70 jmp $706c
7304: A9 00    lda #$00
7306: 09 80    ora #$80
7308: 9D 27 03 sta $0327, x
730B: A9 FF    lda #$ff
730D: 9D B8 03 sta $03b8, x
7310: 4C 6C 70 jmp $706c
7313: A9 04    lda #$04
7315: 09 80    ora #$80
7317: 9D 27 03 sta $0327, x
731A: A9 FF    lda #$ff
731C: 9D B8 03 sta $03b8, x
731F: 4C 6C 70 jmp $706c
7322: 20 B0 90 jsr $90b0
7325: 90 03    bcc $732a
7327: 4C B3 73 jmp $73b3
732A: BD 16 03 lda $0316, x
732D: 10 1E    bpl $734d
732F: BD B8 03 lda $03b8, x
7332: C9 FF    cmp #$ff
7334: F0 7D    beq $73b3
7336: 0A       asl a
7337: A8       tay
7338: B9 45 73 lda table_7345, y
733B: 85 1B    sta $1b
733D: B9 46 73 lda $7346, y
7340: 85 1C    sta $1c
7342: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

734D: 09 80    ora #$80
734F: 9D 16 03 sta $0316, x
7352: A9 00    lda #$00
7354: 9D B8 03 sta $03b8, x
7357: AD 01 04 lda $0401
735A: 9D 84 03 sta $0384, x
735D: AD 00 04 lda $0400
7360: 9D 80 03 sta $0380, x
7363: AD 02 04 lda $0402
7366: 9D 88 03 sta $0388, x
7369: A9 00    lda #$00
736B: 9D 8C 03 sta $038c, x
736E: 20 95 90 jsr $9095
7371: 20 3E 90 jsr $903e
7374: 9D 78 03 sta $0378, x
7377: 20 26 90 jsr $9026
737A: 9D 2B 03 sta $032b, x
737D: A9 00    lda #$00
737F: 85 2A    sta $2a
7381: AD 04 04 lda $0404
7384: 20 C5 88 jsr $88c5
7387: A5 1B    lda $1b
7389: 9D B0 03 sta $03b0, x
738C: 20 29 82 jsr $8229
738F: B0 56    bcs $73e7
7391: 20 EA 82 jsr $82ea
7394: B0 3B    bcs $73d1
7396: AD 06 04 lda $0406
7399: 85 1B    sta $1b
739B: A9 01    lda #$01
739D: 20 F9 82 jsr $82f9
73A0: B0 14    bcs $73b6
73A2: BD 0E 03 lda $030e, x
73A5: 10 54    bpl $73fb
73A7: A9 0C    lda #$0c
73A9: 09 80    ora #$80
73AB: 9D 27 03 sta $0327, x
73AE: A9 FF    lda #$ff
73B0: 9D B8 03 sta $03b8, x
73B3: 4C 6C 70 jmp $706c
73B6: BD B8 03 lda $03b8, x
73B9: C9 03    cmp #$03
73BB: F0 F6    beq $73b3
73BD: A9 01    lda #$01
73BF: 20 0E B9 jsr $b90e
73C2: A9 0A    lda #$0a
73C4: 09 80    ora #$80
73C6: 9D 27 03 sta $0327, x
73C9: A9 03    lda #$03
73CB: 9D B8 03 sta $03b8, x
73CE: 4C 6C 70 jmp $706c
73D1: BD B8 03 lda $03b8, x
73D4: C9 02    cmp #$02
73D6: F0 DB    beq $73b3
73D8: A9 01    lda #$01
73DA: 09 80    ora #$80
73DC: 9D 27 03 sta $0327, x
73DF: A9 02    lda #$02
73E1: 9D B8 03 sta $03b8, x
73E4: 4C 6C 70 jmp $706c
73E7: BD B8 03 lda $03b8, x
73EA: D0 C7    bne $73b3
73EC: A9 07    lda #$07
73EE: 09 80    ora #$80
73F0: 9D 27 03 sta $0327, x
73F3: A9 01    lda #$01
73F5: 9D B8 03 sta $03b8, x
73F8: 4C 6C 70 jmp $706c
73FB: A9 00    lda #$00
73FD: 09 80    ora #$80
73FF: 9D 27 03 sta $0327, x
7402: A9 FF    lda #$ff
7404: 9D B8 03 sta $03b8, x
7407: 4C 6C 70 jmp $706c
740A: 20 B0 90 jsr $90b0
740D: 90 03    bcc $7412
740F: 4C C6 74 jmp $74c6
7412: BD 16 03 lda $0316, x
7415: 10 23    bpl $743a
7417: BD B8 03 lda $03b8, x
741A: C9 FF    cmp #$ff
741C: D0 03    bne $7421
741E: 4C C6 74 jmp $74c6
7421: 0A       asl a
7422: A8       tay
7423: B9 30 74 lda table_7430, y
7426: 85 1B    sta $1b
7428: B9 31 74 lda $7431, y
742B: 85 1C    sta $1c
742D: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

743A: 09 80    ora #$80
743C: 9D 16 03 sta $0316, x
743F: A9 00    lda #$00
7441: 9D B8 03 sta $03b8, x
7444: 20 89 82 jsr $8289
7447: 90 03    bcc $744c
7449: 4C 10 75 jmp $7510
744C: A5 56    lda $56
744E: 29 0F    and #$0f
7450: C9 02    cmp #$02
7452: D0 08    bne $745c
7454: A9 0E    lda #$0e
7456: 9D 16 03 sta $0316, x
7459: 4C B2 79 jmp $79b2
745C: 20 19 89 jsr $8919
745F: A5 1B    lda $1b
7461: 9D 84 03 sta $0384, x
7464: 8D 0B 04 sta $040b
7467: A5 1C    lda $1c
7469: 9D 80 03 sta $0380, x
746C: 8D 0A 04 sta $040a
746F: A5 1D    lda $1d
7471: 9D 88 03 sta $0388, x
7474: 8D 0C 04 sta $040c
7477: A9 00    lda #$00
7479: 9D 8C 03 sta $038c, x
747C: A5 1E    lda $1e
747E: 8D 0D 04 sta $040d
7481: 20 95 90 jsr $9095
7484: 20 3E 90 jsr $903e
7487: 9D 78 03 sta $0378, x
748A: 20 26 90 jsr $9026
748D: 9D 2B 03 sta $032b, x
7490: A9 00    lda #$00
7492: 85 2A    sta $2a
7494: AD 0D 04 lda $040d
7497: 20 C5 88 jsr $88c5
749A: A5 1B    lda $1b
749C: 18       clc
749D: 69 04    adc #$04
749F: 8D 0E 04 sta $040e
74A2: 20 29 82 jsr $8229
74A5: B0 53    bcs $74fa
74A7: A9 00    lda #$00
74A9: 20 23 83 jsr $8323
74AC: B0 36    bcs $74e4
74AE: AD FF 03 lda $03ff
74B1: 85 1B    sta $1b
74B3: A9 02    lda #$02
74B5: 20 F9 82 jsr $82f9
74B8: B0 0F    bcs $74c9
74BA: A9 0C    lda #$0c
74BC: 09 80    ora #$80
74BE: 9D 27 03 sta $0327, x
74C1: A9 FF    lda #$ff
74C3: 9D B8 03 sta $03b8, x
74C6: 4C 6C 70 jmp $706c
74C9: BD B8 03 lda $03b8, x
74CC: C9 04    cmp #$04
74CE: F0 F6    beq $74c6
74D0: A9 01    lda #$01
74D2: 20 0E B9 jsr $b90e
74D5: A9 0A    lda #$0a
74D7: 09 80    ora #$80
74D9: 9D 27 03 sta $0327, x
74DC: A9 04    lda #$04
74DE: 9D B8 03 sta $03b8, x
74E1: 4C 6C 70 jmp $706c
74E4: BD B8 03 lda $03b8, x
74E7: C9 03    cmp #$03
74E9: F0 DB    beq $74c6
74EB: A9 01    lda #$01
74ED: 09 80    ora #$80
74EF: 9D 27 03 sta $0327, x
74F2: A9 03    lda #$03
74F4: 9D B8 03 sta $03b8, x
74F7: 4C 6C 70 jmp $706c
74FA: BD B8 03 lda $03b8, x
74FD: C9 02    cmp #$02
74FF: F0 C5    beq $74c6
7501: A9 09    lda #$09
7503: 09 80    ora #$80
7505: 9D 27 03 sta $0327, x
7508: A9 02    lda #$02
750A: 9D B8 03 sta $03b8, x
750D: 4C 6C 70 jmp $706c
7510: BD B8 03 lda $03b8, x
7513: D0 B1    bne $74c6
7515: 20 92 8E jsr $8e92
7518: A5 1B    lda $1b
751A: 9D 84 03 sta $0384, x
751D: A5 1C    lda $1c
751F: 9D 80 03 sta $0380, x
7522: A5 1D    lda $1d
7524: 9D 8C 03 sta $038c, x
7527: A5 1E    lda $1e
7529: 9D 88 03 sta $0388, x
752C: 20 3E 90 jsr $903e
752F: 9D 78 03 sta $0378, x
7532: 20 26 90 jsr $9026
7535: 9D 2B 03 sta $032b, x
7538: A9 08    lda #$08
753A: 09 80    ora #$80
753C: 9D 27 03 sta $0327, x
753F: A9 01    lda #$01
7541: 9D B8 03 sta $03b8, x
7544: 4C 6C 70 jmp $706c
7547: 20 B0 90 jsr $90b0
754A: 90 03    bcc $754f
754C: 4C 32 76 jmp $7632
754F: BD 16 03 lda $0316, x
7552: 10 25    bpl $7579
7554: BD B8 03 lda $03b8, x
7557: C9 FF    cmp #$ff
7559: D0 03    bne $755e
755B: 4C 32 76 jmp $7632
755E: 0A       asl a
755F: A8       tay
7560: B9 6D 75 lda table_756d, y
7563: 85 1B    sta $1b
7565: B9 6E 75 lda $756e, y
7568: 85 1C    sta $1c
756A: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

7579: 09 80    ora #$80
757B: 9D 16 03 sta $0316, x
757E: A9 00    lda #$00
7580: 9D B8 03 sta $03b8, x
7583: 20 7D 89 jsr $897d
7586: A5 1B    lda $1b
7588: 9D 84 03 sta $0384, x
758B: A5 1C    lda $1c
758D: 9D 80 03 sta $0380, x
7590: A5 1D    lda $1d
7592: 9D 88 03 sta $0388, x
7595: A9 00    lda #$00
7597: 9D 8C 03 sta $038c, x
759A: 20 3E 90 jsr $903e
759D: 9D 78 03 sta $0378, x
75A0: 20 26 90 jsr $9026
75A3: 9D 2B 03 sta $032b, x
75A6: 20 29 82 jsr $8229
75A9: B0 6F    bcs $761a
75AB: A9 01    lda #$01
75AD: 20 23 83 jsr $8323
75B0: 90 03    bcc $75b5
75B2: 4C 44 76 jmp $7644
75B5: AD FC 03 lda $03fc
75B8: 9D 84 03 sta $0384, x
75BB: AD FB 03 lda $03fb
75BE: 9D 80 03 sta $0380, x
75C1: AD FD 03 lda $03fd
75C4: 9D 88 03 sta $0388, x
75C7: A9 00    lda #$00
75C9: 9D 8C 03 sta $038c, x
75CC: 20 95 90 jsr $9095
75CF: 20 3E 90 jsr $903e
75D2: 9D 78 03 sta $0378, x
75D5: 20 26 90 jsr $9026
75D8: 9D 2B 03 sta $032b, x
75DB: A9 01    lda #$01
75DD: 85 2A    sta $2a
75DF: AD FE 03 lda $03fe
75E2: 20 C5 88 jsr $88c5
75E5: A5 1B    lda $1b
75E7: 9D B0 03 sta $03b0, x
75EA: 20 C7 84 jsr $84c7
75ED: A5 1B    lda $1b
75EF: 9D B4 03 sta $03b4, x
75F2: 20 C9 90 jsr $90c9
75F5: B0 03    bcs $75fa
75F7: 4C B2 79 jmp $79b2
75FA: 20 2F 83 jsr $832f
75FD: B0 5B    bcs $765a
75FF: AD FF 03 lda $03ff
7602: 85 1B    sta $1b
7604: A9 03    lda #$03
7606: 20 F9 82 jsr $82f9
7609: B0 65    bcs $7670
760B: AD FF 03 lda $03ff
760E: 85 1B    sta $1b
7610: A9 04    lda #$04
7612: 20 F9 82 jsr $82f9
7615: B0 6F    bcs $7686
7617: 4C A1 76 jmp $76a1
761A: BD B8 03 lda $03b8, x
761D: D0 13    bne $7632
761F: A9 03    lda #$03
7621: 20 96 82 jsr $8296
7624: 90 0F    bcc $7635
7626: A9 08    lda #$08
7628: 09 80    ora #$80
762A: 9D 27 03 sta $0327, x
762D: A9 01    lda #$01
762F: 9D B8 03 sta $03b8, x
7632: 4C 6C 70 jmp $706c
7635: A9 09    lda #$09
7637: 09 80    ora #$80
7639: 9D 27 03 sta $0327, x
763C: A9 01    lda #$01
763E: 9D B8 03 sta $03b8, x
7641: 4C 6C 70 jmp $706c
7644: BD B8 03 lda $03b8, x
7647: C9 02    cmp #$02
7649: F0 E7    beq $7632
764B: A9 00    lda #$00
764D: 09 80    ora #$80
764F: 9D 27 03 sta $0327, x
7652: A9 02    lda #$02
7654: 9D B8 03 sta $03b8, x
7657: 4C 6C 70 jmp $706c
765A: BD B8 03 lda $03b8, x
765D: C9 03    cmp #$03
765F: F0 D1    beq $7632
7661: A9 00    lda #$00
7663: 09 80    ora #$80
7665: 9D 27 03 sta $0327, x
7668: A9 03    lda #$03
766A: 9D B8 03 sta $03b8, x
766D: 4C 6C 70 jmp $706c
7670: BD B8 03 lda $03b8, x
7673: C9 04    cmp #$04
7675: F0 BB    beq $7632
7677: A9 09    lda #$09
7679: 09 80    ora #$80
767B: 9D 27 03 sta $0327, x
767E: A9 04    lda #$04
7680: 9D B8 03 sta $03b8, x
7683: 4C 6C 70 jmp $706c
7686: BD B8 03 lda $03b8, x
7689: C9 05    cmp #$05
768B: F0 A5    beq $7632
768D: A9 01    lda #$01
768F: 20 0E B9 jsr $b90e
7692: A9 0B    lda #$0b
7694: 09 80    ora #$80
7696: 9D 27 03 sta $0327, x
7699: A9 05    lda #$05
769B: 9D B8 03 sta $03b8, x
769E: 4C 6C 70 jmp $706c
76A1: A9 0C    lda #$0c
76A3: 09 80    ora #$80
76A5: 9D 27 03 sta $0327, x
76A8: A9 FF    lda #$ff
76AA: 9D B8 03 sta $03b8, x
76AD: 4C 6C 70 jmp $706c
76B0: 20 B0 90 jsr $90b0
76B3: 90 03    bcc $76b8
76B5: 4C A7 77 jmp $77a7
76B8: BD 16 03 lda $0316, x
76BB: 10 27    bpl $76e4
76BD: BD B8 03 lda $03b8, x
76C0: C9 FF    cmp #$ff
76C2: D0 03    bne $76c7
76C4: 4C A7 77 jmp $77a7
76C7: 0A       asl a
76C8: A8       tay
76C9: B9 D6 76 lda table_76d6, y
76CC: 85 1B    sta $1b
76CE: B9 D7 76 lda $76d7, y
76D1: 85 1C    sta $1c
76D3: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

76E4: 09 80    ora #$80
76E6: 9D 16 03 sta $0316, x
76E9: A9 00    lda #$00
76EB: 9D B8 03 sta $03b8, x
76EE: 20 23 83 jsr $8323
76F1: 90 4B    bcc $773e
76F3: 8A       txa
76F4: 4A       lsr a
76F5: A8       tay
76F6: B9 54 00 lda $0054, y
76F9: C9 0E    cmp #$0e
76FB: F0 04    beq $7701
76FD: C9 0F    cmp #$0f
76FF: D0 03    bne $7704
7701: 4C 1D 78 jmp $781d
7704: 20 60 8F jsr $8f60
7707: A5 1B    lda $1b
7709: 9D 84 03 sta $0384, x
770C: A5 1C    lda $1c
770E: 9D 80 03 sta $0380, x
7711: A5 1D    lda $1d
7713: 9D 88 03 sta $0388, x
7716: A9 00    lda #$00
7718: 9D 8C 03 sta $038c, x
771B: 20 3E 90 jsr $903e
771E: 9D 78 03 sta $0378, x
7721: 20 26 90 jsr $9026
7724: 9D 2B 03 sta $032b, x
7727: 20 29 82 jsr $8229
772A: B0 7E    bcs $77aa
772C: 20 23 83 jsr $8323
772F: 90 03    bcc $7734
7731: 4C C0 77 jmp $77c0
7734: BD B8 03 lda $03b8, x
7737: C9 01    cmp #$01
7739: D0 03    bne $773e
773B: 4C C0 77 jmp $77c0
773E: AD FC 03 lda $03fc
7741: 9D 84 03 sta $0384, x
7744: AD FB 03 lda $03fb
7747: 9D 80 03 sta $0380, x
774A: AD FD 03 lda $03fd
774D: 9D 88 03 sta $0388, x
7750: A9 00    lda #$00
7752: 9D 8C 03 sta $038c, x
7755: 20 95 90 jsr $9095
7758: 20 3E 90 jsr $903e
775B: 9D 78 03 sta $0378, x
775E: 20 26 90 jsr $9026
7761: 9D 2B 03 sta $032b, x
7764: A9 00    lda #$00
7766: 20 49 85 jsr $8549
7769: A5 1B    lda $1b
776B: 9D B4 03 sta $03b4, x
776E: A9 00    lda #$00
7770: 85 2A    sta $2a
7772: AD FE 03 lda $03fe
7775: 20 C5 88 jsr $88c5
7778: A5 1B    lda $1b
777A: 9D B0 03 sta $03b0, x
777D: 20 C9 90 jsr $90c9
7780: B0 03    bcs $7785
7782: 4C B2 79 jmp $79b2
7785: 20 2F 83 jsr $832f
7788: B0 4C    bcs $77d6
778A: 20 29 82 jsr $8229
778D: B0 5D    bcs $77ec
778F: AD FF 03 lda $03ff
7792: 85 1B    sta $1b
7794: A9 05    lda #$05
7796: 20 F9 82 jsr $82f9
7799: B0 67    bcs $7802
779B: A9 0C    lda #$0c
779D: 09 80    ora #$80
779F: 9D 27 03 sta $0327, x
77A2: A9 FF    lda #$ff
77A4: 9D B8 03 sta $03b8, x
77A7: 4C 6C 70 jmp $706c
77AA: BD B8 03 lda $03b8, x
77AD: C9 01    cmp #$01
77AF: F0 F6    beq $77a7
77B1: A9 09    lda #$09
77B3: 09 80    ora #$80
77B5: 9D 27 03 sta $0327, x
77B8: A9 01    lda #$01
77BA: 9D B8 03 sta $03b8, x
77BD: 4C 6C 70 jmp $706c
77C0: BD B8 03 lda $03b8, x
77C3: C9 02    cmp #$02
77C5: F0 E0    beq $77a7
77C7: A9 00    lda #$00
77C9: 09 80    ora #$80
77CB: 9D 27 03 sta $0327, x
77CE: A9 02    lda #$02
77D0: 9D B8 03 sta $03b8, x
77D3: 4C 6C 70 jmp $706c
77D6: BD B8 03 lda $03b8, x
77D9: C9 03    cmp #$03
77DB: F0 CA    beq $77a7
77DD: A9 00    lda #$00
77DF: 09 80    ora #$80
77E1: 9D 27 03 sta $0327, x
77E4: A9 03    lda #$03
77E6: 9D B8 03 sta $03b8, x
77E9: 4C 6C 70 jmp $706c
77EC: BD B8 03 lda $03b8, x
77EF: C9 04    cmp #$04
77F1: F0 B4    beq $77a7
77F3: A9 07    lda #$07
77F5: 09 80    ora #$80
77F7: 9D 27 03 sta $0327, x
77FA: A9 04    lda #$04
77FC: 9D B8 03 sta $03b8, x
77FF: 4C 6C 70 jmp $706c
7802: BD B8 03 lda $03b8, x
7805: C9 05    cmp #$05
7807: F0 9E    beq $77a7
7809: A9 01    lda #$01
780B: 20 0E B9 jsr $b90e
780E: A9 0A    lda #$0a
7810: 09 80    ora #$80
7812: 9D 27 03 sta $0327, x
7815: A9 05    lda #$05
7817: 9D B8 03 sta $03b8, x
781A: 4C 6C 70 jmp $706c
781D: 20 92 8E jsr $8e92
7820: A5 1B    lda $1b
7822: 9D 84 03 sta $0384, x
7825: A5 1C    lda $1c
7827: 9D 80 03 sta $0380, x
782A: A5 1D    lda $1d
782C: 9D 8C 03 sta $038c, x
782F: A5 1E    lda $1e
7831: 9D 88 03 sta $0388, x
7834: 20 3E 90 jsr $903e
7837: 9D 78 03 sta $0378, x
783A: 20 26 90 jsr $9026
783D: 9D 2B 03 sta $032b, x
7840: AD F9 03 lda $03f9
7843: 85 1B    sta $1b
7845: A9 0B    lda #$0b
7847: 20 F9 82 jsr $82f9
784A: B0 03    bcs $784f
784C: 4C C0 77 jmp $77c0
784F: 20 29 82 jsr $8229
7852: B0 03    bcs $7857
7854: 4C C0 77 jmp $77c0
7857: BD B8 03 lda $03b8, x
785A: C9 06    cmp #$06
785C: F0 0C    beq $786a
785E: A9 07    lda #$07
7860: 09 80    ora #$80
7862: 9D 27 03 sta $0327, x
7865: A9 06    lda #$06
7867: 9D B8 03 sta $03b8, x
786A: 4C 6C 70 jmp $706c
786D: BD 0E 03 lda $030e, x
7870: 30 F8    bmi $786a
7872: BD 16 03 lda $0316, x
7875: 10 20    bpl $7897
7877: BD B8 03 lda $03b8, x
787A: C9 FF    cmp #$ff
787C: F0 EC    beq $786a
787E: 0A       asl a
787F: A8       tay
7880: B9 8D 78 lda table_788d, y
7883: 85 1B    sta $1b
7885: B9 8E 78 lda $788e, y
7888: 85 1C    sta $1c
788A: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
788D: 8D 78 E4 sta $e478
7890: 78       sei
7891: E4 78    cpx $78
7893: 09 79    ora #$79
7895: 09 79    ora #$79
7897: 09 80    ora #$80
7899: 9D 16 03 sta $0316, x
789C: A9 00    lda #$00
789E: 9D B8 03 sta $03b8, x
78A1: 8A       txa
78A2: 29 02    and #$02
78A4: 4A       lsr a
78A5: A8       tay
78A6: B9 47 00 lda $0047, y
78A9: 10 03    bpl $78ae
78AB: 20 F8 AB jsr $abf8
78AE: AD F6 03 lda $03f6
78B1: 9D 84 03 sta $0384, x
78B4: AD F5 03 lda $03f5
78B7: 9D 80 03 sta $0380, x
78BA: AD F8 03 lda $03f8
78BD: 9D 8C 03 sta $038c, x
78C0: AD F7 03 lda $03f7
78C3: 9D 88 03 sta $0388, x
78C6: 20 3E 90 jsr $903e
78C9: 9D 78 03 sta $0378, x
78CC: 20 26 90 jsr $9026
78CF: 9D 2B 03 sta $032b, x
78D2: 8A       txa
78D3: 29 02    and #$02
78D5: 4A       lsr a
78D6: A8       tay
78D7: B9 47 00 lda $0047, y
78DA: 30 10    bmi $78ec
78DC: 20 C9 90 jsr $90c9
78DF: B0 03    bcs $78e4
78E1: 4C B2 79 jmp $79b2
78E4: 20 29 84 jsr $8429
78E7: B0 03    bcs $78ec
78E9: 4C 80 79 jmp $7980
78EC: 20 29 82 jsr $8229
78EF: 90 18    bcc $7909
78F1: BD B8 03 lda $03b8, x
78F4: F0 09    beq $78ff
78F6: C9 01    cmp #$01
78F8: F0 39    beq $7933
78FA: A9 09    lda #$09
78FC: 4C 01 79 jmp $7901
78FF: A9 08    lda #$08
7901: 20 96 82 jsr $8296
7904: B0 46    bcs $794c
7906: 4C 5B 79 jmp $795b
7909: AD F9 03 lda $03f9
790C: 85 1B    sta $1b
790E: A9 06    lda #$06
7910: 20 F9 82 jsr $82f9
7913: 90 0F    bcc $7924
7915: AD F9 03 lda $03f9
7918: 85 1B    sta $1b
791A: A9 0C    lda #$0c
791C: 20 F9 82 jsr $82f9
791F: 90 15    bcc $7936
7921: 4C 9C 79 jmp $799c
7924: 20 07 91 jsr $9107
7927: A9 0D    lda #$0d
7929: 09 80    ora #$80
792B: 9D 27 03 sta $0327, x
792E: A9 FF    lda #$ff
7930: 9D B8 03 sta $03b8, x
7933: 4C 6C 70 jmp $706c
7936: BD B8 03 lda $03b8, x
7939: C9 03    cmp #$03
793B: F0 F6    beq $7933
793D: A9 26    lda #$26
793F: 09 80    ora #$80
7941: 9D 27 03 sta $0327, x
7944: A9 03    lda #$03
7946: 9D B8 03 sta $03b8, x
7949: 4C 6C 70 jmp $706c
794C: A9 08    lda #$08
794E: 09 80    ora #$80
7950: 9D 27 03 sta $0327, x
7953: A9 01    lda #$01
7955: 9D B8 03 sta $03b8, x
7958: 4C 6C 70 jmp $706c
795B: BD B8 03 lda $03b8, x
795E: C9 02    cmp #$02
7960: F0 D1    beq $7933
7962: A9 09    lda #$09
7964: 09 80    ora #$80
7966: 9D 27 03 sta $0327, x
7969: A9 02    lda #$02
796B: 9D B8 03 sta $03b8, x
796E: 4C 6C 70 jmp $706c
7971: A9 00    lda #$00
7973: 09 80    ora #$80
7975: 9D 27 03 sta $0327, x
7978: A9 FF    lda #$ff
797A: 9D B8 03 sta $03b8, x
797D: 4C 6C 70 jmp $706c
7980: AD F6 03 lda $03f6
7983: 85 1B    sta $1b
7985: AD F5 03 lda $03f5
7988: 85 1C    sta $1c
798A: AD F8 03 lda $03f8
798D: 85 1D    sta $1d
798F: AD F7 03 lda $03f7
7992: 85 1E    sta $1e
7994: 20 6B 84 jsr $846b
7997: 90 D8    bcc $7971
7999: 4C 09 79 jmp $7909
799C: BD B8 03 lda $03b8, x
799F: C9 04    cmp #$04
79A1: F0 0C    beq $79af
79A3: A9 00    lda #$00
79A5: 09 80    ora #$80
79A7: 9D 27 03 sta $0327, x
79AA: A9 04    lda #$04
79AC: 9D B8 03 sta $03b8, x
79AF: 4C 6C 70 jmp $706c
79B2: BD 0E 03 lda $030e, x
79B5: 30 F8    bmi $79af
79B7: 20 F3 90 jsr $90f3
79BA: 90 F3    bcc $79af
79BC: BD 16 03 lda $0316, x
79BF: 10 2B    bpl $79ec
79C1: BD B8 03 lda $03b8, x
79C4: C9 FF    cmp #$ff
79C6: D0 03    bne $79cb
79C8: 4C 90 7B jmp $7b90
79CB: 0A       asl a
79CC: A8       tay
79CD: B9 DA 79 lda table_79da, y
79D0: 85 1B    sta $1b
79D2: B9 DB 79 lda $79db, y
79D5: 85 1C    sta $1c
79D7: 6C 1B 00 jmp ($001b)        ; [indirect_jump]

79EC: 09 80    ora #$80
79EE: 9D 16 03 sta $0316, x
79F1: A9 00    lda #$00
79F3: 9D B8 03 sta $03b8, x
79F6: AD EE 03 lda $03ee
79F9: D0 03    bne $79fe
79FB: 4C FC 7C jmp $7cfc
79FE: A5 56    lda $56
7A00: 29 0F    and #$0f
7A02: C9 06    cmp #$06
7A04: F0 25    beq $7a2b
7A06: C9 07    cmp #$07
7A08: F0 21    beq $7a2b
7A0A: A5 53    lda $53
7A0C: D0 1D    bne $7a2b
7A0E: 20 50 83 jsr $8350
7A11: 90 18    bcc $7a2b
7A13: BD A0 03 lda $03a0, x
7A16: 85 1B    sta $1b
7A18: A9 07    lda #$07
7A1A: 20 F9 82 jsr $82f9
7A1D: B0 0C    bcs $7a2b
7A1F: 20 6A 8A jsr $8a6a
7A22: A5 1B    lda $1b
7A24: C9 04    cmp #$04
7A26: F0 03    beq $7a2b
7A28: 4C E5 7A jmp $7ae5
7A2B: A9 00    lda #$00
7A2D: 20 3E 84 jsr $843e
7A30: B0 03    bcs $7a35
7A32: 4C 21 7D jmp $7d21
7A35: 20 0F 8F jsr $8f0f
7A38: 20 C4 8F jsr $8fc4
7A3B: 20 3E 90 jsr $903e
7A3E: 9D 78 03 sta $0378, x
7A41: 20 26 90 jsr $9026
7A44: 9D 2B 03 sta $032b, x
7A47: A9 00    lda #$00
7A49: 20 49 85 jsr $8549
7A4C: A5 1B    lda $1b
7A4E: 9D B4 03 sta $03b4, x
7A51: 20 69 83 jsr $8369
7A54: B0 03    bcs $7a59
7A56: 4C 16 7B jmp $7b16
7A59: A9 01    lda #$01
7A5B: 20 49 85 jsr $8549
7A5E: A5 1B    lda $1b
7A60: 9D B4 03 sta $03b4, x
7A63: 20 69 83 jsr $8369
7A66: B0 03    bcs $7a6b
7A68: 4C 35 7B jmp $7b35
7A6B: AD EB 03 lda $03eb
7A6E: 9D 84 03 sta $0384, x
7A71: AD EA 03 lda $03ea
7A74: 9D 80 03 sta $0380, x
7A77: AD ED 03 lda $03ed
7A7A: 9D 8C 03 sta $038c, x
7A7D: AD EC 03 lda $03ec
7A80: 9D 88 03 sta $0388, x
7A83: 20 3E 90 jsr $903e
7A86: 9D 78 03 sta $0378, x
7A89: 20 26 90 jsr $9026
7A8C: 9D 2B 03 sta $032b, x
7A8F: A9 01    lda #$01
7A91: 20 3E 84 jsr $843e
7A94: B0 03    bcs $7a99
7A96: 4C 45 7D jmp $7d45
7A99: A9 01    lda #$01
7A9B: 20 49 85 jsr $8549
7A9E: A5 1B    lda $1b
7AA0: 9D B4 03 sta $03b4, x
7AA3: 20 69 83 jsr $8369
7AA6: B0 06    bcs $7aae
7AA8: 20 C4 8F jsr $8fc4
7AAB: 4C 35 7B jmp $7b35
7AAE: AD EE 03 lda $03ee
7AB1: 85 1B    sta $1b
7AB3: A9 0A    lda #$0a
7AB5: 20 F9 82 jsr $82f9
7AB8: 90 03    bcc $7abd
7ABA: 4C 54 7B jmp $7b54
7ABD: A9 07    lda #$07
7ABF: 20 96 82 jsr $8296
7AC2: B0 03    bcs $7ac7
7AC4: 4C FC 7C jmp $7cfc
7AC7: 20 78 83 jsr $8378
7ACA: A5 1B    lda $1b
7ACC: F0 0A    beq $7ad8
7ACE: C9 01    cmp #$01
7AD0: F0 03    beq $7ad5
7AD2: 4C CF 7C jmp $7ccf
7AD5: 4C DE 7C jmp $7cde
7AD8: A9 05    lda #$05
7ADA: 20 96 82 jsr $8296
7ADD: B0 03    bcs $7ae2
7ADF: 4C C0 7C jmp $7cc0
7AE2: 4C B1 7C jmp $7cb1
7AE5: BD A0 03 lda $03a0, x
7AE8: 85 1B    sta $1b
7AEA: A9 08    lda #$08
7AEC: 20 F9 82 jsr $82f9
7AEF: 90 03    bcc $7af4
7AF1: 4C C0 7B jmp $7bc0
7AF4: 20 6A 8A jsr $8a6a
7AF7: A5 1B    lda $1b
7AF9: D0 03    bne $7afe
7AFB: 4C 79 7B jmp $7b79
7AFE: C9 01    cmp #$01
7B00: D0 03    bne $7b05
7B02: 4C 93 7B jmp $7b93
7B05: C9 02    cmp #$02
7B07: D0 03    bne $7b0c
7B09: 4C A2 7B jmp $7ba2
7B0C: C9 03    cmp #$03
7B0E: D0 03    bne $7b13
7B10: 4C B1 7B jmp $7bb1
7B13: 4C 2B 7A jmp $7a2b
7B16: 20 29 82 jsr $8229
7B19: 90 08    bcc $7b23
7B1B: 20 29 84 jsr $8429
7B1E: 90 03    bcc $7b23
7B20: 4C 98 7C jmp $7c98
7B23: BD B8 03 lda $03b8, x
7B26: C9 03    cmp #$03
7B28: D0 08    bne $7b32
7B2A: 20 5E 83 jsr $835e
7B2D: B0 03    bcs $7b32
7B2F: 4C 79 7B jmp $7b79
7B32: 4C D6 7B jmp $7bd6
7B35: 20 29 82 jsr $8229
7B38: 90 08    bcc $7b42
7B3A: 20 29 84 jsr $8429
7B3D: 90 03    bcc $7b42
7B3F: 4C 82 7C jmp $7c82
7B42: BD B8 03 lda $03b8, x
7B45: C9 05    cmp #$05
7B47: D0 08    bne $7b51
7B49: 20 5E 83 jsr $835e
7B4C: B0 03    bcs $7b51
7B4E: 4C 79 7B jmp $7b79
7B51: 4C 2C 7C jmp $7c2c
7B54: 20 29 84 jsr $8429
7B57: 90 07    bcc $7b60
7B59: A9 0A    lda #$0a
7B5B: 20 96 82 jsr $8296
7B5E: 90 03    bcc $7b63
7B60: 4C 0B 7D jmp $7d0b
7B63: BD B8 03 lda $03b8, x
7B66: C9 06    cmp #$06
7B68: F0 26    beq $7b90
7B6A: A9 09    lda #$09
7B6C: 09 80    ora #$80
7B6E: 9D 27 03 sta $0327, x
7B71: A9 06    lda #$06
7B73: 9D B8 03 sta $03b8, x
7B76: 4C 6C 70 jmp $706c
7B79: BD B0 03 lda $03b0, x
7B7C: C9 01    cmp #$01
7B7E: F0 31    beq $7bb1
7B80: C9 02    cmp #$02
7B82: F0 1E    beq $7ba2
7B84: A9 0F    lda #$0f
7B86: 09 80    ora #$80
7B88: 9D 27 03 sta $0327, x
7B8B: A9 FF    lda #$ff
7B8D: 9D B8 03 sta $03b8, x
7B90: 4C 6C 70 jmp $706c
7B93: A9 12    lda #$12
7B95: 09 80    ora #$80
7B97: 9D 27 03 sta $0327, x
7B9A: A9 FF    lda #$ff
7B9C: 9D B8 03 sta $03b8, x
7B9F: 4C 6C 70 jmp $706c
7BA2: A9 16    lda #$16
7BA4: 09 80    ora #$80
7BA6: 9D 27 03 sta $0327, x
7BA9: A9 FF    lda #$ff
7BAB: 9D B8 03 sta $03b8, x
7BAE: 4C 6C 70 jmp $706c
7BB1: A9 15    lda #$15
7BB3: 09 80    ora #$80
7BB5: 9D 27 03 sta $0327, x
7BB8: A9 FF    lda #$ff
7BBA: 9D B8 03 sta $03b8, x
7BBD: 4C 6C 70 jmp $706c
7BC0: BD B8 03 lda $03b8, x
7BC3: C9 01    cmp #$01
7BC5: F0 C9    beq $7b90
7BC7: A9 04    lda #$04
7BC9: 09 80    ora #$80
7BCB: 9D 27 03 sta $0327, x
7BCE: A9 01    lda #$01
7BD0: 9D B8 03 sta $03b8, x
7BD3: 4C 6C 70 jmp $706c
7BD6: BD B8 03 lda $03b8, x
7BD9: C9 03    cmp #$03
7BDB: F0 B3    beq $7b90
7BDD: BD B0 03 lda $03b0, x
7BE0: F0 0F    beq $7bf1
7BE2: A9 00    lda #$00
7BE4: 09 80    ora #$80
7BE6: 9D 27 03 sta $0327, x
7BE9: A9 03    lda #$03
7BEB: 9D B8 03 sta $03b8, x
7BEE: 4C 6C 70 jmp $706c
7BF1: 20 93 84 jsr $8493
7BF4: A5 1B    lda $1b
7BF6: F0 13    beq $7c0b
7BF8: A9 05    lda #$05
7BFA: 09 80    ora #$80
7BFC: 9D 27 03 sta $0327, x
7BFF: A9 03    lda #$03
7C01: 9D B8 03 sta $03b8, x
7C04: A5 1C    lda $1c
7C06: F0 14    beq $7c1c
7C08: 4C 24 7C jmp $7c24
7C0B: A9 04    lda #$04
7C0D: 09 80    ora #$80
7C0F: 9D 27 03 sta $0327, x
7C12: A9 03    lda #$03
7C14: 9D B8 03 sta $03b8, x
7C17: 8A       txa
7C18: 29 02    and #$02
7C1A: F0 08    beq $7c24
7C1C: A9 C0    lda #$c0
7C1E: 9D 2B 03 sta $032b, x
7C21: 4C 6C 70 jmp $706c
7C24: A9 40    lda #$40
7C26: 9D 2B 03 sta $032b, x
7C29: 4C 6C 70 jmp $706c
7C2C: BD B8 03 lda $03b8, x
7C2F: C9 05    cmp #$05
7C31: F0 4C    beq $7c7f
7C33: BD B0 03 lda $03b0, x
7C36: F0 0F    beq $7c47
7C38: A9 00    lda #$00
7C3A: 09 80    ora #$80
7C3C: 9D 27 03 sta $0327, x
7C3F: A9 05    lda #$05
7C41: 9D B8 03 sta $03b8, x
7C44: 4C 6C 70 jmp $706c
7C47: 20 93 84 jsr $8493
7C4A: A5 1B    lda $1b
7C4C: F0 13    beq $7c61
7C4E: A9 05    lda #$05
7C50: 09 80    ora #$80
7C52: 9D 27 03 sta $0327, x
7C55: A9 05    lda #$05
7C57: 9D B8 03 sta $03b8, x
7C5A: A5 1C    lda $1c
7C5C: F0 14    beq $7c72
7C5E: 4C 7A 7C jmp $7c7a
7C61: A9 04    lda #$04
7C63: 09 80    ora #$80
7C65: 9D 27 03 sta $0327, x
7C68: A9 05    lda #$05
7C6A: 9D B8 03 sta $03b8, x
7C6D: 8A       txa
7C6E: 29 02    and #$02
7C70: F0 08    beq $7c7a
7C72: A9 C0    lda #$c0
7C74: 9D 2B 03 sta $032b, x
7C77: 4C 6C 70 jmp $706c
7C7A: A9 40    lda #$40
7C7C: 9D 2B 03 sta $032b, x
7C7F: 4C 6C 70 jmp $706c
7C82: BD B8 03 lda $03b8, x
7C85: C9 04    cmp #$04
7C87: F0 F6    beq $7c7f
7C89: A9 09    lda #$09
7C8B: 09 80    ora #$80
7C8D: 9D 27 03 sta $0327, x
7C90: A9 04    lda #$04
7C92: 9D B8 03 sta $03b8, x
7C95: 4C 6C 70 jmp $706c
7C98: BD B8 03 lda $03b8, x
7C9B: C9 02    cmp #$02
7C9D: D0 03    bne $7ca2
7C9F: 4C 90 7B jmp $7b90
7CA2: A9 06    lda #$06
7CA4: 09 80    ora #$80
7CA6: 9D 27 03 sta $0327, x
7CA9: A9 02    lda #$02
7CAB: 9D B8 03 sta $03b8, x
7CAE: 4C 6C 70 jmp $706c
7CB1: A9 10    lda #$10
7CB3: 09 80    ora #$80
7CB5: 9D 27 03 sta $0327, x
7CB8: A9 FF    lda #$ff
7CBA: 9D B8 03 sta $03b8, x
7CBD: 4C 6C 70 jmp $706c
7CC0: A9 11    lda #$11
7CC2: 09 80    ora #$80
7CC4: 9D 27 03 sta $0327, x
7CC7: A9 FF    lda #$ff
7CC9: 9D B8 03 sta $03b8, x
7CCC: 4C 6C 70 jmp $706c
7CCF: A9 13    lda #$13
7CD1: 09 80    ora #$80
7CD3: 9D 27 03 sta $0327, x
7CD6: A9 FF    lda #$ff
7CD8: 9D B8 03 sta $03b8, x
7CDB: 4C 6C 70 jmp $706c
7CDE: A9 14    lda #$14
7CE0: 09 80    ora #$80
7CE2: 9D 27 03 sta $0327, x
7CE5: A9 FF    lda #$ff
7CE7: 9D B8 03 sta $03b8, x
7CEA: 4C 6C 70 jmp $706c
7CED: A9 04    lda #$04
7CEF: 09 80    ora #$80
7CF1: 9D 27 03 sta $0327, x
7CF4: A9 FF    lda #$ff
7CF6: 9D B8 03 sta $03b8, x
7CF9: 4C 6C 70 jmp $706c
7CFC: A9 00    lda #$00
7CFE: 09 80    ora #$80
7D00: 9D 27 03 sta $0327, x
7D03: A9 FF    lda #$ff
7D05: 9D B8 03 sta $03b8, x
7D08: 4C 6C 70 jmp $706c
7D0B: BD B8 03 lda $03b8, x
7D0E: C9 07    cmp #$07
7D10: F0 0C    beq $7d1e
7D12: A9 00    lda #$00
7D14: 09 80    ora #$80
7D16: 9D 27 03 sta $0327, x
7D19: A9 07    lda #$07
7D1B: 9D B8 03 sta $03b8, x
7D1E: 4C 6C 70 jmp $706c
7D21: AD EB 03 lda $03eb
7D24: 9D 84 03 sta $0384, x
7D27: AD EA 03 lda $03ea
7D2A: 9D 80 03 sta $0380, x
7D2D: AD ED 03 lda $03ed
7D30: 9D 8C 03 sta $038c, x
7D33: AD EC 03 lda $03ec
7D36: 9D 88 03 sta $0388, x
7D39: 20 3E 90 jsr $903e
7D3C: 9D 78 03 sta $0378, x
7D3F: 20 26 90 jsr $9026
7D42: 9D 2B 03 sta $032b, x
7D45: 20 29 84 jsr $8429
7D48: 90 B2    bcc $7cfc
7D4A: BD B8 03 lda $03b8, x
7D4D: C9 08    cmp #$08
7D4F: F0 CD    beq $7d1e
7D51: A9 09    lda #$09
7D53: 09 80    ora #$80
7D55: 9D 27 03 sta $0327, x
7D58: A9 08    lda #$08
7D5A: 9D B8 03 sta $03b8, x
7D5D: 4C 6C 70 jmp $706c
7D60: 20 B0 90 jsr $90b0
7D63: 90 03    bcc $7d68
7D65: 4C C2 7D jmp $7dc2
7D68: BD 16 03 lda $0316, x
7D6B: 10 0A    bpl $7d77
7D6D: BD B8 03 lda $03b8, x
7D70: C9 FF    cmp #$ff
7D72: F0 4E    beq $7dc2
7D74: 4C 81 7D jmp $7d81
7D77: 09 80    ora #$80
7D79: 9D 16 03 sta $0316, x
7D7C: A9 00    lda #$00
7D7E: 9D B8 03 sta $03b8, x
7D81: A5 53    lda $53
7D83: F0 31    beq $7db6
7D85: 20 75 88 jsr $8875
7D88: A5 1B    lda $1b
7D8A: 9D 84 03 sta $0384, x
7D8D: A5 1C    lda $1c
7D8F: 9D 80 03 sta $0380, x
7D92: AD 07 04 lda $0407
7D95: 9D 88 03 sta $0388, x
7D98: A9 00    lda #$00
7D9A: 9D 8C 03 sta $038c, x
7D9D: 20 3E 90 jsr $903e
7DA0: 9D 78 03 sta $0378, x
7DA3: 20 26 90 jsr $9026
7DA6: 9D 2B 03 sta $032b, x
7DA9: 20 A0 83 jsr $83a0
7DAC: 90 08    bcc $7db6
7DAE: 20 29 82 jsr $8229
7DB1: B0 28    bcs $7ddb
7DB3: 4C C5 7D jmp $7dc5
7DB6: A9 0E    lda #$0e
7DB8: 09 80    ora #$80
7DBA: 9D 27 03 sta $0327, x
7DBD: A9 FF    lda #$ff
7DBF: 9D B8 03 sta $03b8, x
7DC2: 4C 6C 70 jmp $706c
7DC5: BD B8 03 lda $03b8, x
7DC8: C9 02    cmp #$02
7DCA: F0 F6    beq $7dc2
7DCC: A9 01    lda #$01
7DCE: 09 80    ora #$80
7DD0: 9D 27 03 sta $0327, x
7DD3: A9 02    lda #$02
7DD5: 9D B8 03 sta $03b8, x
7DD8: 4C 6C 70 jmp $706c
7DDB: BD B8 03 lda $03b8, x
7DDE: C9 01    cmp #$01
7DE0: F0 E0    beq $7dc2
7DE2: A9 07    lda #$07
7DE4: 09 80    ora #$80
7DE6: 9D 27 03 sta $0327, x
7DE9: A9 01    lda #$01
7DEB: 9D B8 03 sta $03b8, x
7DEE: 4C 6C 70 jmp $706c
7DF1: BD 16 03 lda $0316, x
7DF4: 10 12    bpl $7e08
7DF6: BD B8 03 lda $03b8, x
7DF9: C9 FF    cmp #$ff
7DFB: F0 C5    beq $7dc2
7DFD: C9 01    cmp #$01
7DFF: F0 38    beq $7e39
7E01: C9 02    cmp #$02
7E03: F0 43    beq $7e48
7E05: 4C 8A 7E jmp $7e8a
7E08: 09 80    ora #$80
7E0A: 9D 16 03 sta $0316, x
7E0D: A9 00    lda #$00
7E0F: 9D B8 03 sta $03b8, x
7E12: A9 00    lda #$00
7E14: 85 1B    sta $1b
7E16: 20 D8 8B jsr $8bd8
7E19: A5 1B    lda $1b
7E1B: 9D 84 03 sta $0384, x
7E1E: A5 1C    lda $1c
7E20: 9D 80 03 sta $0380, x
7E23: A5 1D    lda $1d
7E25: 9D 88 03 sta $0388, x
7E28: A9 00    lda #$00
7E2A: 9D 8C 03 sta $038c, x
7E2D: 20 3E 90 jsr $903e
7E30: 9D 78 03 sta $0378, x
7E33: 20 26 90 jsr $9026
7E36: 9D 2B 03 sta $032b, x
7E39: 20 29 82 jsr $8229
7E3C: B0 16    bcs $7e54
7E3E: 8A       txa
7E3F: 4A       lsr a
7E40: A8       tay
7E41: B9 54 00 lda $0054, y
7E44: C9 0B    cmp #$0b
7E46: F0 4A    beq $7e92
7E48: 8A       txa
7E49: 49 01    eor #$01
7E4B: A8       tay
7E4C: B9 0E 03 lda $030e, y
7E4F: 30 12    bmi $7e63
7E51: 4C B0 7E jmp $7eb0
7E54: BD B8 03 lda $03b8, x
7E57: D0 45    bne $7e9e
7E59: A9 06    lda #$06
7E5B: 20 96 82 jsr $8296
7E5E: 90 41    bcc $7ea1
7E60: 4C C6 7E jmp $7ec6
7E63: A9 01    lda #$01
7E65: 85 1B    sta $1b
7E67: 20 D8 8B jsr $8bd8
7E6A: A5 1B    lda $1b
7E6C: 9D 84 03 sta $0384, x
7E6F: A5 1C    lda $1c
7E71: 9D 80 03 sta $0380, x
7E74: A5 1D    lda $1d
7E76: 9D 88 03 sta $0388, x
7E79: A9 00    lda #$00
7E7B: 9D 8C 03 sta $038c, x
7E7E: 20 3E 90 jsr $903e
7E81: 9D 78 03 sta $0378, x
7E84: 20 26 90 jsr $9026
7E87: 9D 2B 03 sta $032b, x
7E8A: 20 29 82 jsr $8229
7E8D: 90 03    bcc $7e92
7E8F: 4C D5 7E jmp $7ed5
7E92: A9 00    lda #$00
7E94: 09 80    ora #$80
7E96: 9D 27 03 sta $0327, x
7E99: A9 FF    lda #$ff
7E9B: 9D B8 03 sta $03b8, x
7E9E: 4C 6C 70 jmp $706c
7EA1: A9 09    lda #$09
7EA3: 09 80    ora #$80
7EA5: 9D 27 03 sta $0327, x
7EA8: A9 01    lda #$01
7EAA: 9D B8 03 sta $03b8, x
7EAD: 4C 6C 70 jmp $706c
7EB0: BD B8 03 lda $03b8, x
7EB3: C9 02    cmp #$02
7EB5: F0 E7    beq $7e9e
7EB7: A9 00    lda #$00
7EB9: 09 80    ora #$80
7EBB: 9D 27 03 sta $0327, x
7EBE: A9 02    lda #$02
7EC0: 9D B8 03 sta $03b8, x
7EC3: 4C 6C 70 jmp $706c
7EC6: A9 07    lda #$07
7EC8: 09 80    ora #$80
7ECA: 9D 27 03 sta $0327, x
7ECD: A9 01    lda #$01
7ECF: 9D B8 03 sta $03b8, x
7ED2: 4C 6C 70 jmp $706c
7ED5: BD B8 03 lda $03b8, x
7ED8: C9 03    cmp #$03
7EDA: F0 C2    beq $7e9e
7EDC: A9 07    lda #$07
7EDE: 09 80    ora #$80
7EE0: 9D 27 03 sta $0327, x
7EE3: A9 03    lda #$03
7EE5: 9D B8 03 sta $03b8, x
7EE8: 4C 6C 70 jmp $706c
7EEB: BD 16 03 lda $0316, x
7EEE: 30 0C    bmi $7efc
7EF0: 09 80    ora #$80
7EF2: 9D 16 03 sta $0316, x
7EF5: A9 21    lda #$21
7EF7: 09 80    ora #$80
7EF9: 9D 27 03 sta $0327, x
7EFC: 4C 6C 70 jmp $706c
7EFF: BD 16 03 lda $0316, x
7F02: 30 0C    bmi $7f10
7F04: 09 80    ora #$80
7F06: 9D 16 03 sta $0316, x
7F09: A9 1E    lda #$1e
7F0B: 09 80    ora #$80
7F0D: 9D 27 03 sta $0327, x
7F10: 4C 6C 70 jmp $706c
7F13: BD 16 03 lda $0316, x
7F16: 10 34    bpl $7f4c
7F18: BD B8 03 lda $03b8, x
7F1B: C9 FF    cmp #$ff
7F1D: F0 F1    beq $7f10
7F1F: EE FA 07 inc $07fa
7F22: AD FA 07 lda $07fa
7F25: C9 20    cmp #$20
7F27: F0 33    beq $7f5c
7F29: B0 03    bcs $7f2e
7F2B: 4C 9D 7F jmp $7f9d
7F2E: BD B8 03 lda $03b8, x
7F31: C9 FF    cmp #$ff
7F33: F0 68    beq $7f9d
7F35: 0A       asl a
7F36: A8       tay
7F37: B9 44 7F lda table_7f44, y
7F3A: 85 1B    sta $1b
7F3C: B9 45 7F lda $7f45, y
7F3F: 85 1C    sta $1c
7F41: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
7F4C: 09 80    ora #$80
7F4E: 9D 16 03 sta $0316, x
7F51: A9 00    lda #$00
7F53: 8D FA 07 sta $07fa
7F56: 20 A3 8C jsr $8ca3
7F59: 4C 05 80 jmp $8005
7F5C: A9 00    lda #$00
7F5E: 9D B8 03 sta $03b8, x
7F61: BD AC 03 lda $03ac, x
7F64: F0 0F    beq $7f75
7F66: AD FA 07 lda $07fa
7F69: C9 30    cmp #$30
7F6B: 90 73    bcc $7fe0
7F6D: 20 E0 83 jsr $83e0
7F70: B0 6E    bcs $7fe0
7F72: 4C D1 7F jmp $7fd1
7F75: AD FA 07 lda $07fa
7F78: C9 30    cmp #$30
7F7A: 90 3F    bcc $7fbb
7F7C: A0 04    ldy #$04
7F7E: B9 E3 00 lda $00e3, y
7F81: C9 70    cmp #$70
7F83: 90 36    bcc $7fbb
7F85: BD B8 03 lda $03b8, x
7F88: C9 03    cmp #$03
7F8A: D0 14    bne $7fa0
7F8C: BD AF 02 lda $02af, x
7F8F: 10 0F    bpl $7fa0
7F91: A9 0C    lda #$0c
7F93: 09 80    ora #$80
7F95: 9D 27 03 sta $0327, x
7F98: A9 FF    lda #$ff
7F9A: 9D B8 03 sta $03b8, x
7F9D: 4C 6C 70 jmp $706c
7FA0: BD B8 03 lda $03b8, x
7FA3: C9 03    cmp #$03
7FA5: F0 F6    beq $7f9d
7FA7: A9 00    lda #$00
7FA9: 20 0E B9 jsr $b90e
7FAC: A9 0A    lda #$0a
7FAE: 09 80    ora #$80
7FB0: 9D 27 03 sta $0327, x
7FB3: A9 03    lda #$03
7FB5: 9D B8 03 sta $03b8, x
7FB8: 4C 6C 70 jmp $706c
7FBB: BD B8 03 lda $03b8, x
7FBE: C9 02    cmp #$02
7FC0: F0 DB    beq $7f9d
7FC2: A9 19    lda #$19
7FC4: 09 80    ora #$80
7FC6: 9D 27 03 sta $0327, x
7FC9: A9 02    lda #$02
7FCB: 9D B8 03 sta $03b8, x
7FCE: 4C 6C 70 jmp $706c
7FD1: A9 1B    lda #$1b
7FD3: 09 80    ora #$80
7FD5: 9D 27 03 sta $0327, x
7FD8: A9 FF    lda #$ff
7FDA: 9D B8 03 sta $03b8, x
7FDD: 4C 6C 70 jmp $706c
7FE0: BD B8 03 lda $03b8, x
7FE3: C9 01    cmp #$01
7FE5: F0 B6    beq $7f9d
7FE7: A9 19    lda #$19
7FE9: 09 80    ora #$80
7FEB: 9D 27 03 sta $0327, x
7FEE: A9 01    lda #$01
7FF0: 9D B8 03 sta $03b8, x
7FF3: 4C 6C 70 jmp $706c

8005: A9 17    lda #$17
8007: 09 80    ora #$80
8009: 9D 27 03 sta $0327, x
800C: A9 00    lda #$00
800E: 9D B8 03 sta $03b8, x
8011: 4C 6C 70 jmp $706c
8014: 20 B0 90 jsr $90b0
8017: 90 03    bcc $801c
8019: 4C AF 80 jmp $80af
801C: BD 16 03 lda $0316, x
801F: 10 28    bpl $8049
8021: FE B0 03 inc $03b0, x
8024: BD B0 03 lda $03b0, x
8027: C9 10    cmp #$10
8029: 90 EE    bcc $8019
802B: F0 38    beq $8065
802D: DE B0 03 dec $03b0, x
8030: BD B8 03 lda $03b8, x
8033: C9 03    cmp #$03
8035: F0 6D    beq $80a4
8037: C9 04    cmp #$04
8039: F0 74    beq $80af
803B: C9 FF    cmp #$ff
803D: D0 73    bne $80b2
803F: BD 0E 03 lda $030e, x
8042: 29 10    and #$10
8044: F0 1F    beq $8065
8046: 4C AF 80 jmp $80af
8049: A5 53    lda $53
804B: D0 08    bne $8055
804D: A9 00    lda #$00
804F: 9D B0 03 sta $03b0, x
8052: 4C 5A 80 jmp $805a
8055: A9 0F    lda #$0f
8057: 9D B0 03 sta $03b0, x
805A: BD 16 03 lda $0316, x
805D: 09 80    ora #$80
805F: 9D 16 03 sta $0316, x
8062: 4C AF 80 jmp $80af
8065: A9 00    lda #$00
8067: 9D B8 03 sta $03b8, x
806A: A5 56    lda $56
806C: 29 0F    and #$0f
806E: C9 02    cmp #$02
8070: D0 40    bne $80b2
8072: BD 73 03 lda $0373, x
8075: 29 F0    and #$f0
8077: 85 2A    sta $2a
8079: A5 56    lda $56
807B: 29 10    and #$10
807D: 45 2A    eor $2a
807F: D0 31    bne $80b2
8081: 20 D7 89 jsr $89d7
8084: A5 1B    lda $1b
8086: 9D 84 03 sta $0384, x
8089: A5 1C    lda $1c
808B: 9D 80 03 sta $0380, x
808E: A5 1D    lda $1d
8090: 9D 88 03 sta $0388, x
8093: A9 00    lda #$00
8095: 9D 8C 03 sta $038c, x
8098: 20 3E 90 jsr $903e
809B: 9D 78 03 sta $0378, x
809E: 20 26 90 jsr $9026
80A1: 9D 2B 03 sta $032b, x
80A4: 20 29 82 jsr $8229
80A7: 90 03    bcc $80ac
80A9: 4C 42 81 jmp $8142
80AC: 4C 58 81 jmp $8158
80AF: 4C 6C 70 jmp $706c
80B2: 20 05 8B jsr $8b05
80B5: A5 1B    lda $1b
80B7: 9D 84 03 sta $0384, x
80BA: A5 1C    lda $1c
80BC: 9D 80 03 sta $0380, x
80BF: A5 1D    lda $1d
80C1: 9D 88 03 sta $0388, x
80C4: A9 00    lda #$00
80C6: 9D 8C 03 sta $038c, x
80C9: 20 3E 90 jsr $903e
80CC: 9D 78 03 sta $0378, x
80CF: BD B8 03 lda $03b8, x
80D2: D0 06    bne $80da
80D4: BD 78 03 lda $0378, x
80D7: 9D 7C 03 sta $037c, x
80DA: 20 26 90 jsr $9026
80DD: 9D 2B 03 sta $032b, x
80E0: 20 29 82 jsr $8229
80E3: 90 4E    bcc $8133
80E5: BD 78 03 lda $0378, x
80E8: DD 7C 03 cmp $037c, x
80EB: D0 0D    bne $80fa
80ED: BD 78 03 lda $0378, x
80F0: DD 73 03 cmp $0373, x
80F3: F0 05    beq $80fa
80F5: BD B8 03 lda $03b8, x
80F8: D0 B5    bne $80af
80FA: BD 78 03 lda $0378, x
80FD: 9D 7C 03 sta $037c, x
8100: A9 07    lda #$07
8102: 20 96 82 jsr $8296
8105: 90 16    bcc $811d
8107: BD B8 03 lda $03b8, x
810A: C9 01    cmp #$01
810C: F0 A1    beq $80af
810E: A9 06    lda #$06
8110: 09 80    ora #$80
8112: 9D 27 03 sta $0327, x
8115: A9 01    lda #$01
8117: 9D B8 03 sta $03b8, x
811A: 4C AF 80 jmp $80af
811D: BD B8 03 lda $03b8, x
8120: C9 02    cmp #$02
8122: F0 8B    beq $80af
8124: A9 09    lda #$09
8126: 09 80    ora #$80
8128: 9D 27 03 sta $0327, x
812B: A9 02    lda #$02
812D: 9D B8 03 sta $03b8, x
8130: 4C 6C 70 jmp $706c
8133: A9 00    lda #$00
8135: 09 80    ora #$80
8137: 9D 27 03 sta $0327, x
813A: A9 FF    lda #$ff
813C: 9D B8 03 sta $03b8, x
813F: 4C 6C 70 jmp $706c
8142: BD B8 03 lda $03b8, x
8145: C9 03    cmp #$03
8147: F0 D1    beq $811a
8149: A9 06    lda #$06
814B: 09 80    ora #$80
814D: 9D 27 03 sta $0327, x
8150: A9 03    lda #$03
8152: 9D B8 03 sta $03b8, x
8155: 4C 6C 70 jmp $706c
8158: A9 00    lda #$00
815A: 09 80    ora #$80
815C: 9D 27 03 sta $0327, x
815F: A9 04    lda #$04
8161: 9D B8 03 sta $03b8, x
8164: 4C 6C 70 jmp $706c
8167: BD 16 03 lda $0316, x
816A: 10 0E    bpl $817a
816C: BD B8 03 lda $03b8, x
816F: C9 01    cmp #$01
8171: F0 6E    beq $81e1
8173: C9 02    cmp #$02
8175: F0 47    beq $81be
8177: 4C F9 81 jmp $81f9
817A: 09 80    ora #$80
817C: 9D 16 03 sta $0316, x
817F: A9 00    lda #$00
8181: 9D B8 03 sta $03b8, x
8184: 20 A3 8C jsr $8ca3
8187: A5 46    lda $46
8189: 29 08    and #$08
818B: F0 03    beq $8190
818D: 4C F9 81 jmp $81f9
8190: A5 4F    lda $4f
8192: 29 02    and #$02
8194: 85 2A    sta $2a
8196: 8A       txa
8197: 29 02    and #$02
8199: C5 2A    cmp $2a
819B: D0 0A    bne $81a7
819D: BD 0A 03 lda $030a, x
81A0: 29 08    and #$08
81A2: D0 76    bne $821a
81A4: 4C 0B 82 jmp $820b
81A7: 8A       txa
81A8: 29 02    and #$02
81AA: 4A       lsr a
81AB: A8       tay
81AC: B9 47 00 lda $0047, y
81AF: 30 5A    bmi $820b
81B1: A5 5D    lda $5d
81B3: C9 04    cmp #$04
81B5: D0 54    bne $820b
81B7: BD 0A 03 lda $030a, x
81BA: 29 08    and #$08
81BC: D0 4D    bne $820b
81BE: 20 4E 8C jsr $8c4e
81C1: A5 1B    lda $1b
81C3: 9D 84 03 sta $0384, x
81C6: A5 1C    lda $1c
81C8: 9D 80 03 sta $0380, x
81CB: A5 1D    lda $1d
81CD: 9D 8C 03 sta $038c, x
81D0: A5 1E    lda $1e
81D2: 9D 88 03 sta $0388, x
81D5: 20 3E 90 jsr $903e
81D8: 9D 78 03 sta $0378, x
81DB: 20 26 90 jsr $9026
81DE: 9D 2B 03 sta $032b, x
81E1: 20 29 82 jsr $8229
81E4: 90 16    bcc $81fc
81E6: BD B8 03 lda $03b8, x
81E9: C9 01    cmp #$01
81EB: F0 0C    beq $81f9
81ED: A9 08    lda #$08
81EF: 09 80    ora #$80
81F1: 9D 27 03 sta $0327, x
81F4: A9 01    lda #$01
81F6: 9D B8 03 sta $03b8, x
81F9: 4C 6C 70 jmp $706c
81FC: A9 04    lda #$04
81FE: 09 80    ora #$80
8200: 9D 27 03 sta $0327, x
8203: A9 02    lda #$02
8205: 9D B8 03 sta $03b8, x
8208: 4C 6C 70 jmp $706c
820B: A9 04    lda #$04
820D: 09 80    ora #$80
820F: 9D 27 03 sta $0327, x
8212: A9 FF    lda #$ff
8214: 9D B8 03 sta $03b8, x
8217: 4C 6C 70 jmp $706c
821A: A9 17    lda #$17
821C: 09 80    ora #$80
821E: 9D 27 03 sta $0327, x
8221: A9 FF    lda #$ff
8223: 9D B8 03 sta $03b8, x
8226: 4C 6C 70 jmp $706c
8229: BD 73 03 lda $0373, x
822C: DD 78 03 cmp $0378, x
822F: D0 0F    bne $8240
8231: BD 16 03 lda $0316, x
8234: 29 7F    and #$7f
8236: C9 14    cmp #$14
8238: F0 06    beq $8240
823A: 20 26 90 jsr $9026
823D: 9D 2B 03 sta $032b, x
8240: 86 1B    stx $1b
8242: A9 0D    lda #$0d
8244: 85 1C    sta $1c
8246: A8       tay
8247: BD 84 03 lda $0384, x
824A: 99 9D 00 sta $009d, y
824D: BD 80 03 lda $0380, x
8250: 99 8F 00 sta $008f, y
8253: BD 8C 03 lda $038c, x
8256: 99 C7 00 sta $00c7, y
8259: BD 88 03 lda $0388, x
825C: 99 B9 00 sta $00b9, y
825F: A9 00    lda #$00
8261: 99 F1 00 sta $00f1, y
8264: B9 E3 00 lda $00e3, y
8267: 20 23 69 jsr $6923
826A: A5 1B    lda $1b
826C: C9 04    cmp #$04
826E: B0 09    bcs $8279
8270: A5 1C    lda $1c
8272: C9 04    cmp #$04
8274: B0 03    bcs $8279
8276: 4C 7B 82 jmp $827b
8279: 38       sec
827A: 60       rts
827B: 18       clc
827C: 60       rts
827D: AD EE 03 lda $03ee
8280: DD B4 03 cmp $03b4, x
8283: B0 02    bcs $8287
8285: 38       sec
8286: 60       rts
8287: 18       clc
8288: 60       rts
8289: BD 73 03 lda $0373, x
828C: 29 0F    and #$0f
828E: C9 09    cmp #$09
8290: 90 02    bcc $8294
8292: 38       sec
8293: 60       rts
8294: 18       clc
8295: 60       rts
8296: 48       pha
8297: 86 1B    stx $1b
8299: A9 0D    lda #$0d
829B: 85 1C    sta $1c
829D: A8       tay
829E: BD 84 03 lda $0384, x
82A1: 99 9D 00 sta $009d, y
82A4: BD 80 03 lda $0380, x
82A7: 99 8F 00 sta $008f, y
82AA: BD 8C 03 lda $038c, x
82AD: 99 C7 00 sta $00c7, y
82B0: BD 88 03 lda $0388, x
82B3: 99 B9 00 sta $00b9, y
82B6: A9 00    lda #$00
82B8: 99 F1 00 sta $00f1, y
82BB: 99 E3 00 sta $00e3, y
82BE: 20 23 69 jsr $6923
82C1: 68       pla
82C2: A8       tay
82C3: B9 DE 82 lda $82de, y
82C6: 20 A9 D1 jsr $d1a9
82C9: A5 1F    lda $1f
82CB: C5 15    cmp $15
82CD: F0 05    beq $82d4
82CF: 90 09    bcc $82da
82D1: 4C DC 82 jmp $82dc
82D4: A5 1E    lda $1e
82D6: C5 14    cmp $14
82D8: B0 02    bcs $82dc
82DA: 38       sec
82DB: 60       rts
82DC: 18       clc
82DD: 60       rts

82EA: BD B0 03 lda $03b0, x
82ED: 18       clc
82EE: 69 03    adc #$03
82F0: CD 06 04 cmp $0406
82F3: 90 02    bcc $82f7
82F5: 18       clc
82F6: 60       rts
82F7: 38       sec
82F8: 60       rts
82F9: C9 03    cmp #$03
82FB: D0 0D    bne $830a
82FD: BD B0 03 lda $03b0, x
8300: 18       clc
8301: 69 0D    adc #$0d
8303: C5 1B    cmp $1b
8305: B0 0D    bcs $8314
8307: 4C 12 83 jmp $8312
830A: A8       tay
830B: B9 16 83 lda $8316, y
830E: C5 1B    cmp $1b
8310: B0 02    bcs $8314
8312: 38       sec
8313: 60       rts
8314: 18       clc
8315: 60       rts

8323: A5 56    lda $56
8325: 29 0F    and #$0f
8327: C9 02    cmp #$02
8329: F0 02    beq $832d
832B: 38       sec
832C: 60       rts
832D: 18       clc
832E: 60       rts
832F: BD B4 03 lda $03b4, x
8332: 18       clc
8333: 7D B0 03 adc $03b0, x
8336: 69 0C    adc #$0c
8338: CD FF 03 cmp $03ff
833B: B0 02    bcs $833f
833D: 38       sec
833E: 60       rts
833F: 18       clc
8340: 60       rts
8341: BD B0 03 lda $03b0, x
8344: 18       clc
8345: 69 0E    adc #$0e
8347: CD FF 03 cmp $03ff
834A: B0 02    bcs $834e
834C: 38       sec
834D: 60       rts
834E: 18       clc
834F: 60       rts
8350: BD 9C 03 lda $039c, x
8353: D0 05    bne $835a
8355: BD 98 03 lda $0398, x
8358: D0 02    bne $835c
835A: 18       clc
835B: 60       rts
835C: 38       sec
835D: 60       rts
835E: AD F4 03 lda $03f4
8361: C9 04    cmp #$04
8363: 90 02    bcc $8367
8365: 38       sec
8366: 60       rts
8367: 18       clc
8368: 60       rts
8369: BD B4 03 lda $03b4, x
836C: 18       clc
836D: 69 04    adc #$04
836F: CD F4 03 cmp $03f4
8372: 30 02    bmi $8376
8374: 38       sec
8375: 60       rts
8376: 18       clc
8377: 60       rts
8378: BD 2B 03 lda $032b, x
837B: C9 50    cmp #$50
837D: 90 0B    bcc $838a
837F: C9 B0    cmp #$b0
8381: 90 13    bcc $8396
8383: C9 D0    cmp #$d0
8385: 90 0A    bcc $8391
8387: 4C 9B 83 jmp $839b
838A: C9 30    cmp #$30
838C: B0 03    bcs $8391
838E: 4C 9B 83 jmp $839b
8391: A9 00    lda #$00
8393: 85 1B    sta $1b
8395: 60       rts
8396: A9 01    lda #$01
8398: 85 1B    sta $1b
839A: 60       rts
839B: A9 02    lda #$02
839D: 85 1B    sta $1b
839F: 60       rts
83A0: BD BC 03 lda $03bc, x
83A3: F0 20    beq $83c5
83A5: C9 01    cmp #$01
83A7: F0 03    beq $83ac
83A9: 4C C5 83 jmp $83c5
83AC: A0 04    ldy #$04
83AE: B9 F1 00 lda $00f1, y
83B1: D0 29    bne $83dc
83B3: B9 E3 00 lda $00e3, y
83B6: C9 A0    cmp #$a0
83B8: 90 03    bcc $83bd
83BA: 4C DC 83 jmp $83dc
83BD: B9 AF 02 lda $02af, y
83C0: 10 1A    bpl $83dc
83C2: 4C DE 83 jmp $83de
83C5: 8A       txa
83C6: 29 02    and #$02
83C8: 4A       lsr a
83C9: 49 01    eor #$01
83CB: A8       tay
83CC: B9 51 00 lda $0051, y
83CF: A8       tay
83D0: B9 0E 03 lda $030e, y
83D3: 10 07    bpl $83dc
83D5: B9 E3 00 lda $00e3, y
83D8: C9 24    cmp #$24
83DA: B0 02    bcs $83de
83DC: 38       sec
83DD: 60       rts
83DE: 18       clc
83DF: 60       rts
83E0: A0 04    ldy #$04
83E2: B9 F1 00 lda $00f1, y
83E5: D0 11    bne $83f8
83E7: B9 E3 00 lda $00e3, y
83EA: C9 64    cmp #$64
83EC: 90 03    bcc $83f1
83EE: 4C F8 83 jmp $83f8
83F1: B9 AF 02 lda $02af, y
83F4: 10 02    bpl $83f8
83F6: 18       clc
83F7: 60       rts
83F8: 38       sec
83F9: 60       rts
83FA: BD 88 03 lda $0388, x
83FD: C9 60    cmp #$60
83FF: F0 07    beq $8408
8401: A9 30    lda #$30
8403: 85 1E    sta $1e
8405: 4C 0C 84 jmp $840c
8408: A9 60    lda #$60
840A: 85 1E    sta $1e
840C: B5 B9    lda $b9, x
840E: C5 1E    cmp $1e
8410: B0 0C    bcs $841e
8412: A5 1E    lda $1e
8414: 38       sec
8415: F5 B9    sbc $b9, x
8417: C9 03    cmp #$03
8419: B0 0C    bcs $8427
841B: 4C 25 84 jmp $8425
841E: 38       sec
841F: E5 1E    sbc $1e
8421: C9 03    cmp #$03
8423: B0 02    bcs $8427
8425: 18       clc
8426: 60       rts
8427: 38       sec
8428: 60       rts
8429: 18       clc
842A: BD B8 03 lda $03b8, x
842D: F0 07    beq $8436
842F: BD 0A 03 lda $030a, x
8432: 29 01    and #$01
8434: D0 01    bne $8437
8436: 38       sec
8437: 60       rts

843E: D0 17    bne $8457
8440: AD F0 03 lda $03f0
8443: 85 1B    sta $1b
8445: AD EF 03 lda $03ef
8448: 85 1C    sta $1c
844A: AD F2 03 lda $03f2
844D: 85 1D    sta $1d
844F: AD F1 03 lda $03f1
8452: 85 1E    sta $1e
8454: 4C 6B 84 jmp $846b
8457: AD EB 03 lda $03eb
845A: 85 1B    sta $1b
845C: AD EA 03 lda $03ea
845F: 85 1C    sta $1c
8461: AD ED 03 lda $03ed
8464: 85 1D    sta $1d
8466: AD EC 03 lda $03ec
8469: 85 1E    sta $1e
846B: A5 1D    lda $1d
846D: D0 22    bne $8491
846F: A5 1E    lda $1e
8471: C9 90    cmp #$90
8473: B0 1C    bcs $8491
8475: A5 1B    lda $1b
8477: C9 01    cmp #$01
8479: F0 05    beq $8480
847B: B0 14    bcs $8491
847D: 4C 89 84 jmp $8489
8480: A5 1C    lda $1c
8482: C9 E8    cmp #$e8
8484: B0 0B    bcs $8491
8486: 4C 8F 84 jmp $848f
8489: A5 1C    lda $1c
848B: C9 18    cmp #$18
848D: 90 02    bcc $8491
848F: 38       sec
8490: 60       rts
8491: 18       clc
8492: 60       rts
8493: AD F0 03 lda $03f0
8496: C9 01    cmp #$01
8498: F0 05    beq $849f
849A: B0 22    bcs $84be
849C: 4C A9 84 jmp $84a9
849F: AD EF 03 lda $03ef
84A2: C9 B4    cmp #$b4
84A4: B0 18    bcs $84be
84A6: 4C B0 84 jmp $84b0
84A9: AD EF 03 lda $03ef
84AC: C9 4D    cmp #$4d
84AE: 90 05    bcc $84b5
84B0: A9 00    lda #$00
84B2: 85 1B    sta $1b
84B4: 60       rts
84B5: A9 FF    lda #$ff
84B7: 85 1B    sta $1b
84B9: A9 00    lda #$00
84BB: 85 1C    sta $1c
84BD: 60       rts
84BE: A9 FF    lda #$ff
84C0: 85 1B    sta $1b
84C2: A9 01    lda #$01
84C4: 85 1C    sta $1c
84C6: 60       rts
84C7: 86 1B    stx $1b
84C9: A9 0D    lda #$0d
84CB: 85 1C    sta $1c
84CD: A8       tay
84CE: A9 00    lda #$00
84D0: 99 F1 00 sta $00f1, y
84D3: 99 E3 00 sta $00e3, y
84D6: BD 84 03 lda $0384, x
84D9: 99 9D 00 sta $009d, y
84DC: BD 80 03 lda $0380, x
84DF: 99 8F 00 sta $008f, y
84E2: BD 8C 03 lda $038c, x
84E5: 99 C7 00 sta $00c7, y
84E8: BD 88 03 lda $0388, x
84EB: 99 B9 00 sta $00b9, y
84EE: 20 23 69 jsr $6923
84F1: BD 2B 03 lda $032b, x
84F4: 18       clc
84F5: 69 10    adc #$10
84F7: 29 E0    and #$e0
84F9: 4A       lsr a
84FA: 4A       lsr a
84FB: 4A       lsr a
84FC: 4A       lsr a
84FD: A8       tay
84FE: B9 92 93 lda $9392, y
8501: 85 01    sta $01
8503: BD 2B 03 lda $032b, x
8506: 85 00    sta $00
8508: 20 7C B6 jsr $b67c
850B: 20 5E 90 jsr $905e
850E: A5 10    lda $10
8510: 85 16    sta $16
8512: A5 11    lda $11
8514: 85 17    sta $17
8516: A0 08    ldy #$08
8518: B9 E5 94 lda $94e5, y
851B: 85 10    sta $10
851D: B9 E6 94 lda $94e6, y
8520: 85 11    sta $11
8522: BD B0 03 lda $03b0, x
8525: 85 12    sta $12
8527: A9 00    lda #$00
8529: 85 13    sta $13
852B: 20 29 D1 jsr $d129
852E: A5 1B    lda $1b
8530: 38       sec
8531: E5 15    sbc $15
8533: 85 11    sta $11
8535: A9 00    lda #$00
8537: 85 10    sta $10
8539: A5 16    lda $16
853B: 85 12    sta $12
853D: A5 17    lda $17
853F: 85 13    sta $13
8541: 20 2E D0 jsr $d02e
8544: A5 10    lda $10
8546: 85 1B    sta $1b
8548: 60       rts
8549: 85 23    sta $23
854B: 86 1B    stx $1b
854D: A9 0D    lda #$0d
854F: 85 1C    sta $1c
8551: A8       tay
8552: A9 00    lda #$00
8554: 99 F1 00 sta $00f1, y
8557: 99 E3 00 sta $00e3, y
855A: BD 84 03 lda $0384, x
855D: 99 9D 00 sta $009d, y
8560: BD 80 03 lda $0380, x
8563: 99 8F 00 sta $008f, y
8566: BD 8C 03 lda $038c, x
8569: 99 C7 00 sta $00c7, y
856C: BD 88 03 lda $0388, x
856F: 99 B9 00 sta $00b9, y
8572: 20 23 69 jsr $6923
8575: A5 23    lda $23
8577: D0 14    bne $858d
8579: BD 2B 03 lda $032b, x
857C: 18       clc
857D: 69 10    adc #$10
857F: 29 E0    and #$e0
8581: 4A       lsr a
8582: 4A       lsr a
8583: 4A       lsr a
8584: 4A       lsr a
8585: 4A       lsr a
8586: A8       tay
8587: B9 E2 92 lda $92e2, y
858A: 4C 9D 85 jmp $859d
858D: BD 2B 03 lda $032b, x
8590: 18       clc
8591: 69 10    adc #$10
8593: 29 E0    and #$e0
8595: 4A       lsr a
8596: 4A       lsr a
8597: 4A       lsr a
8598: 4A       lsr a
8599: A8       tay
859A: B9 92 93 lda $9392, y
859D: 85 01    sta $01
859F: BD 2B 03 lda $032b, x
85A2: 85 00    sta $00
85A4: 20 7C B6 jsr $b67c
85A7: 20 5E 90 jsr $905e
85AA: BD 2B 03 lda $032b, x
85AD: C9 20    cmp #$20
85AF: 90 0C    bcc $85bd
85B1: C9 60    cmp #$60
85B3: 90 13    bcc $85c8
85B5: C9 A0    cmp #$a0
85B7: 90 04    bcc $85bd
85B9: C9 E0    cmp #$e0
85BB: 90 0B    bcc $85c8
85BD: A5 1C    lda $1c
85BF: 85 11    sta $11
85C1: A9 00    lda #$00
85C3: 85 10    sta $10
85C5: 4C D8 85 jmp $85d8
85C8: A5 10    lda $10
85CA: 85 12    sta $12
85CC: A5 11    lda $11
85CE: 85 13    sta $13
85D0: A5 1B    lda $1b
85D2: 85 11    sta $11
85D4: A9 00    lda #$00
85D6: 85 10    sta $10
85D8: 20 2E D0 jsr $d02e
85DB: A5 10    lda $10
85DD: 85 1B    sta $1b
85DF: 60       rts
85E0: 8A       txa
85E1: 49 01    eor #$01
85E3: A8       tay
85E4: B9 16 03 lda $0316, y
85E7: 29 7F    and #$7f
85E9: C9 02    cmp #$02
85EB: D0 26    bne $8613
85ED: AD E9 03 lda $03e9
85F0: 29 0F    and #$0f
85F2: C9 01    cmp #$01
85F4: D0 03    bne $85f9
85F6: 4C 6D 86 jmp $866d
85F9: B9 16 03 lda $0316, y
85FC: 10 15    bpl $8613
85FE: B9 88 03 lda $0388, y
8601: C9 60    cmp #$60
8603: F0 07    beq $860c
8605: A9 60    lda #$60
8607: 85 1D    sta $1d
8609: 4C 25 86 jmp $8625
860C: A9 30    lda #$30
860E: 85 1D    sta $1d
8610: 4C 25 86 jmp $8625
8613: B9 B9 00 lda $00b9, y
8616: C9 48    cmp #$48
8618: B0 07    bcs $8621
861A: A9 60    lda #$60
861C: 85 1D    sta $1d
861E: 4C 25 86 jmp $8625
8621: A9 30    lda #$30
8623: 85 1D    sta $1d
8625: AD E9 03 lda $03e9
8628: 85 1E    sta $1e
862A: 5D 73 03 eor $0373, x
862D: 29 F0    and #$f0
862F: D0 05    bne $8636
8631: A0 20    ldy #$20
8633: 4C 46 86 jmp $8646
8636: A5 1E    lda $1e
8638: 29 0F    and #$0f
863A: C9 09    cmp #$09
863C: 90 05    bcc $8643
863E: A0 1C    ldy #$1c
8640: 4C 46 86 jmp $8646
8643: 0A       asl a
8644: 0A       asl a
8645: A8       tay
8646: A5 1D    lda $1d
8648: C9 60    cmp #$60
864A: F0 02    beq $864e
864C: C8       iny
864D: C8       iny
864E: BD 73 03 lda $0373, x
8651: 29 F0    and #$f0
8653: D0 0D    bne $8662
8655: B9 AC 86 lda $86ac, y
8658: 85 1B    sta $1b
865A: B9 AD 86 lda $86ad, y
865D: 85 1C    sta $1c
865F: 4C 6C 86 jmp $866c
8662: B9 80 86 lda $8680, y
8665: 85 1B    sta $1b
8667: B9 81 86 lda $8681, y
866A: 85 1C    sta $1c
866C: 60       rts
866D: A9 48    lda #$48
866F: 85 1D    sta $1d
8671: B9 16 03 lda $0316, y
8674: 10 05    bpl $867b
8676: A0 06    ldy #$06
8678: 4C 4E 86 jmp $864e
867B: A0 04    ldy #$04
867D: 4C 4E 86 jmp $864e

86D7: A8       tay
86D8: A0 00    ldy #$00
86DA: 8A       txa
86DB: 29 02    and #$02
86DD: F0 01    beq $86e0
86DF: C8       iny
86E0: B9 54 00 lda $0054, y
86E3: A8       tay
86E4: B9 02 88 lda $8802, y
86E7: C9 FF    cmp #$ff
86E9: F0 FE    beq $86e9
86EB: 85 1E    sta $1e
86ED: A0 0D    ldy #$0d
86EF: AD EB 03 lda $03eb
86F2: 99 9D 00 sta $009d, y
86F5: AD EA 03 lda $03ea
86F8: 99 8F 00 sta $008f, y
86FB: AD ED 03 lda $03ed
86FE: 99 C7 00 sta $00c7, y
8701: AD EC 03 lda $03ec
8704: 99 B9 00 sta $00b9, y
8707: A9 0D    lda #$0d
8709: 20 1F B7 jsr $b71f
870C: 29 0F    and #$0f
870E: 0A       asl a
870F: A8       tay
8710: B9 1D 87 lda table_871d, y
8713: 85 1B    sta $1b
8715: B9 1E 87 lda $871e, y
8718: 85 1C    sta $1c
871A: 6C 1B 00 jmp ($001b)		; [indirect_jump]

873D: A5 1E    lda $1e
873F: 0A       asl a
8740: 65 1E    adc $1e
8742: A8       tay
8743: 8A       txa
8744: 29 02    and #$02
8746: F0 12    beq $875a
8748: B9 1B 88 lda $881b, y
874B: 85 1B    sta $1b
874D: B9 1C 88 lda $881c, y
8750: 85 1C    sta $1c
8752: B9 1D 88 lda $881d, y
8755: 85 1D    sta $1d
8757: 4C 01 88 jmp $8801
875A: B9 24 88 lda $8824, y
875D: 85 1B    sta $1b
875F: B9 25 88 lda $8825, y
8762: 85 1C    sta $1c
8764: B9 26 88 lda $8826, y
8767: 85 1D    sta $1d
8769: 4C 01 88 jmp $8801
876C: A5 1E    lda $1e
876E: 0A       asl a
876F: 65 1E    adc $1e
8771: A8       tay
8772: B5 B9    lda $b9, x
8774: C9 48    cmp #$48
8776: B0 05    bcs $877d
8778: 98       tya
8779: 18       clc
877A: 69 09    adc #$09
877C: A8       tay
877D: 8A       txa
877E: 29 02    and #$02
8780: F0 12    beq $8794
8782: B9 2D 88 lda $882d, y
8785: 85 1B    sta $1b
8787: B9 2E 88 lda $882e, y
878A: 85 1C    sta $1c
878C: B9 2F 88 lda $882f, y
878F: 85 1D    sta $1d
8791: 4C 01 88 jmp $8801
8794: B9 3F 88 lda $883f, y
8797: 85 1B    sta $1b
8799: B9 40 88 lda $8840, y
879C: 85 1C    sta $1c
879E: B9 41 88 lda $8841, y
87A1: 85 1D    sta $1d
87A3: 4C 01 88 jmp $8801
87A6: A5 1E    lda $1e
87A8: 0A       asl a
87A9: 65 1E    adc $1e
87AB: A8       tay
87AC: 8A       txa
87AD: 29 02    and #$02
87AF: F0 12    beq $87c3
87B1: B9 51 88 lda $8851, y
87B4: 85 1B    sta $1b
87B6: B9 52 88 lda $8852, y
87B9: 85 1C    sta $1c
87BB: B9 53 88 lda $8853, y
87BE: 85 1D    sta $1d
87C0: 4C 01 88 jmp $8801
87C3: B9 5A 88 lda $885a, y
87C6: 85 1B    sta $1b
87C8: B9 5B 88 lda $885b, y
87CB: 85 1C    sta $1c
87CD: B9 5C 88 lda $885c, y
87D0: 85 1D    sta $1d
87D2: 4C 01 88 jmp $8801
87D5: A5 1E    lda $1e
87D7: 0A       asl a
87D8: 65 1E    adc $1e
87DA: A8       tay
87DB: 8A       txa
87DC: 29 02    and #$02
87DE: F0 12    beq $87f2
87E0: B9 63 88 lda $8863, y
87E3: 85 1B    sta $1b
87E5: B9 64 88 lda $8864, y
87E8: 85 1C    sta $1c
87EA: B9 65 88 lda $8865, y
87ED: 85 1D    sta $1d
87EF: 4C 01 88 jmp $8801
87F2: B9 6C 88 lda $886c, y
87F5: 85 1B    sta $1b
87F7: B9 6D 88 lda $886d, y
87FA: 85 1C    sta $1c
87FC: B9 6E 88 lda $886e, y
87FF: 85 1D    sta $1d
8801: 60       rts

8875: 8A       txa
8876: 29 02    and #$02
8878: 4A       lsr a
8879: 49 01    eor #$01
887B: A8       tay
887C: B9 51 00 lda $0051, y
887F: A8       tay
8880: B9 B9 00 lda $00b9, y
8883: 8D 07 04 sta $0407
8886: A9 78    lda #$78
8888: 38       sec
8889: ED 07 04 sbc $0407
888C: 4A       lsr a
888D: 4A       lsr a
888E: 4A       lsr a
888F: 4A       lsr a
8890: 0A       asl a
8891: A8       tay
8892: 8A       txa
8893: 29 02    and #$02
8895: F0 12    beq $88a9
8897: B9 B9 88 lda $88b9, y
889A: 18       clc
889B: 69 14    adc #$14
889D: 85 1C    sta $1c
889F: B9 BA 88 lda $88ba, y
88A2: 69 00    adc #$00
88A4: 85 1B    sta $1b
88A6: 4C B8 88 jmp $88b8
88A9: B9 B9 88 lda $88b9, y
88AC: 38       sec
88AD: E9 14    sbc #$14
88AF: 85 1C    sta $1c
88B1: B9 BA 88 lda $88ba, y
88B4: E9 00    sbc #$00
88B6: 85 1B    sta $1b
88B8: 60       rts

88C5: 38       sec
88C6: E9 48    sbc #$48
88C8: 85 1C    sta $1c
88CA: A0 04    ldy #$04
88CC: A5 2A    lda $2a
88CE: F0 05    beq $88d5
88D0: 98       tya
88D1: 18       clc
88D2: 69 08    adc #$08
88D4: A8       tay
88D5: B9 E5 94 lda $94e5, y
88D8: 85 10    sta $10
88DA: 85 12    sta $12
88DC: B9 E6 94 lda $94e6, y
88DF: 85 11    sta $11
88E1: 85 13    sta $13
88E3: C8       iny
88E4: C8       iny
88E5: B9 E5 94 lda $94e5, y
88E8: 85 14    sta $14
88EA: B9 E6 94 lda $94e6, y
88ED: 85 15    sta $15
88EF: A9 00    lda #$00
88F1: 85 1B    sta $1b
88F3: E6 1B    inc $1b
88F5: A5 11    lda $11
88F7: C5 1C    cmp $1c
88F9: B0 1D    bcs $8918
88FB: 38       sec
88FC: A5 12    lda $12
88FE: E5 14    sbc $14
8900: 85 12    sta $12
8902: A5 13    lda $13
8904: E5 15    sbc $15
8906: 85 13    sta $13
8908: 18       clc
8909: A5 10    lda $10
890B: 65 12    adc $12
890D: 85 10    sta $10
890F: A5 11    lda $11
8911: 65 13    adc $13
8913: 85 11    sta $11
8915: 4C F3 88 jmp $88f3
8918: 60       rts
8919: 8A       txa
891A: 49 01    eor #$01
891C: A8       tay
891D: BD 73 03 lda $0373, x
8920: 29 F0    and #$f0
8922: D0 0A    bne $892e
8924: B5 8F    lda $8f, x
8926: D9 8F 00 cmp $008f, y
8929: 90 17    bcc $8942
892B: 4C 35 89 jmp $8935
892E: B5 8F    lda $8f, x
8930: D9 8F 00 cmp $008f, y
8933: B0 0D    bcs $8942
8935: 85 1C    sta $1c
8937: B5 9D    lda $9d, x
8939: 85 1B    sta $1b
893B: B5 B9    lda $b9, x
893D: 85 1D    sta $1d
893F: 4C 78 89 jmp $8978
8942: B9 9D 00 lda $009d, y
8945: 85 1B    sta $1b
8947: B9 8F 00 lda $008f, y
894A: 85 1C    sta $1c
894C: B5 B9    lda $b9, x
894E: D9 B9 00 cmp $00b9, y
8951: B0 13    bcs $8966
8953: B9 B9 00 lda $00b9, y
8956: 38       sec
8957: E9 18    sbc #$18
8959: C9 18    cmp #$18
895B: B0 19    bcs $8976
895D: B9 B9 00 lda $00b9, y
8960: 18       clc
8961: 69 18    adc #$18
8963: 4C 76 89 jmp $8976
8966: B9 B9 00 lda $00b9, y
8969: 18       clc
896A: 69 18    adc #$18
896C: C9 78    cmp #$78
896E: 90 06    bcc $8976
8970: B9 B9 00 lda $00b9, y
8973: 38       sec
8974: E9 18    sbc #$18
8976: 85 1D    sta $1d
8978: A9 80    lda #$80
897A: 85 1E    sta $1e
897C: 60       rts
897D: BD 73 03 lda $0373, x
8980: 29 0F    and #$0f
8982: C9 09    cmp #$09
8984: B0 1F    bcs $89a5
8986: A8       tay
8987: B9 C2 89 lda $89c2, y
898A: 0A       asl a
898B: 0A       asl a
898C: A8       tay
898D: 8A       txa
898E: 29 02    and #$02
8990: F0 02    beq $8994
8992: C8       iny
8993: C8       iny
8994: B9 CB 89 lda $89cb, y
8997: 85 1B    sta $1b
8999: B9 CC 89 lda $89cc, y
899C: 85 1C    sta $1c
899E: B5 B9    lda $b9, x
89A0: 85 1D    sta $1d
89A2: 4C C1 89 jmp $89c1
89A5: 8A       txa
89A6: 29 02    and #$02
89A8: F0 0B    beq $89b5
89AA: A9 01    lda #$01
89AC: 85 1B    sta $1b
89AE: A9 90    lda #$90
89B0: 85 1C    sta $1c
89B2: 4C BD 89 jmp $89bd
89B5: A9 00    lda #$00
89B7: 85 1B    sta $1b
89B9: A9 70    lda #$70
89BB: 85 1C    sta $1c
89BD: A9 48    lda #$48
89BF: 85 1D    sta $1d
89C1: 60       rts

89D7: 86 1B    stx $1b
89D9: 8A       txa
89DA: 48       pha
89DB: A9 0D    lda #$0d
89DD: 85 1C    sta $1c
89DF: AA       tax
89E0: AD EB 03 lda $03eb
89E3: 95 9D    sta $9d, x
89E5: AD EA 03 lda $03ea
89E8: 95 8F    sta $8f, x
89EA: AD ED 03 lda $03ed
89ED: 95 C7    sta $c7, x
89EF: AD EC 03 lda $03ec
89F2: 95 B9    sta $b9, x
89F4: 68       pla
89F5: AA       tax
89F6: 20 23 69 jsr $6923
89F9: A5 1C    lda $1c
89FB: C9 18    cmp #$18
89FD: B0 30    bcs $8a2f
89FF: B5 B9    lda $b9, x
8A01: C9 38    cmp #$38
8A03: 90 0C    bcc $8a11
8A05: C9 58    cmp #$58
8A07: 90 10    bcc $8a19
8A09: 38       sec
8A0A: E9 30    sbc #$30
8A0C: 85 1D    sta $1d
8A0E: 4C 33 8A jmp $8a33
8A11: 18       clc
8A12: 69 30    adc #$30
8A14: 85 1D    sta $1d
8A16: 4C 33 8A jmp $8a33
8A19: CD EC 03 cmp $03ec
8A1C: B0 07    bcs $8a25
8A1E: B5 B9    lda $b9, x
8A20: 38       sec
8A21: E9 10    sbc #$10
8A23: 85 1D    sta $1d
8A25: B5 B9    lda $b9, x
8A27: 18       clc
8A28: 69 10    adc #$10
8A2A: 85 1D    sta $1d
8A2C: 4C 33 8A jmp $8a33
8A2F: B5 B9    lda $b9, x
8A31: 85 1D    sta $1d
8A33: BD 73 03 lda $0373, x
8A36: 29 0F    and #$0f
8A38: C9 04    cmp #$04
8A3A: B0 1B    bcs $8a57
8A3C: 8A       txa
8A3D: 29 02    and #$02
8A3F: F0 0A    beq $8a4b
8A41: B5 8F    lda $8f, x
8A43: 18       clc
8A44: 69 18    adc #$18
8A46: 85 1C    sta $1c
8A48: 4C 52 8A jmp $8a52
8A4B: B5 8F    lda $8f, x
8A4D: 38       sec
8A4E: E9 18    sbc #$18
8A50: 85 1C    sta $1c
8A52: B5 9D    lda $9d, x
8A54: 85 1B    sta $1b
8A56: 60       rts
8A57: 8A       txa
8A58: 29 02    and #$02
8A5A: F0 07    beq $8a63
8A5C: A9 40    lda #$40
8A5E: 85 1C    sta $1c
8A60: 4C 52 8A jmp $8a52
8A63: A9 C0    lda #$c0
8A65: 85 1C    sta $1c
8A67: 4C 52 8A jmp $8a52
8A6A: A9 10    lda #$10
8A6C: 85 23    sta $23
8A6E: A5 38    lda $38
8A70: 29 0F    and #$0f
8A72: D0 12    bne $8a86
8A74: AD E0 03 lda $03e0
8A77: C9 0A    cmp #$0a
8A79: F0 07    beq $8a82
8A7B: C9 0B    cmp #$0b
8A7D: F0 03    beq $8a82
8A7F: 4C 86 8A jmp $8a86
8A82: A9 20    lda #$20
8A84: 85 23    sta $23
8A86: A9 00    lda #$00
8A88: 85 2A    sta $2a
8A8A: BD 9C 03 lda $039c, x
8A8D: D0 61    bne $8af0
8A8F: BD 98 03 lda $0398, x
8A92: C9 50    cmp #$50
8A94: B0 5A    bcs $8af0
8A96: C9 30    cmp #$30
8A98: B0 02    bcs $8a9c
8A9A: E6 2A    inc $2a
8A9C: BD 94 03 lda $0394, x
8A9F: D0 4F    bne $8af0
8AA1: B5 B9    lda $b9, x
8AA3: DD 90 03 cmp $0390, x
8AA6: B0 11    bcs $8ab9
8AA8: BD 90 03 lda $0390, x
8AAB: 38       sec
8AAC: F5 B9    sbc $b9, x
8AAE: C9 06    cmp #$06
8AB0: 90 21    bcc $8ad3
8AB2: C5 23    cmp $23
8AB4: B0 3A    bcs $8af0
8AB6: 4C C8 8A jmp $8ac8
8AB9: 38       sec
8ABA: FD 90 03 sbc $0390, x
8ABD: C9 06    cmp #$06
8ABF: 90 12    bcc $8ad3
8AC1: C5 23    cmp $23
8AC3: B0 2B    bcs $8af0
8AC5: 4C E5 8A jmp $8ae5
8AC8: A5 2A    lda $2a
8ACA: F0 12    beq $8ade
8ACC: A9 03    lda #$03
8ACE: 85 1B    sta $1b
8AD0: 4C F4 8A jmp $8af4
8AD3: A5 2A    lda $2a
8AD5: F0 07    beq $8ade
8AD7: A9 00    lda #$00
8AD9: 85 1B    sta $1b
8ADB: 4C F4 8A jmp $8af4
8ADE: A9 01    lda #$01
8AE0: 85 1B    sta $1b
8AE2: 4C F4 8A jmp $8af4
8AE5: A5 2A    lda $2a
8AE7: F0 F5    beq $8ade
8AE9: A9 02    lda #$02
8AEB: 85 1B    sta $1b
8AED: 4C F4 8A jmp $8af4
8AF0: A9 04    lda #$04
8AF2: 85 1B    sta $1b
8AF4: 8A       txa
8AF5: 29 02    and #$02
8AF7: F0 06    beq $8aff
8AF9: A9 C0    lda #$c0
8AFB: 9D 2B 03 sta $032b, x
8AFE: 60       rts
8AFF: A9 40    lda #$40
8B01: 9D 2B 03 sta $032b, x
8B04: 60       rts
8B05: 8A       txa
8B06: 48       pha
8B07: 4A       lsr a
8B08: A8       tay
8B09: B9 4D 00 lda $004d, y
8B0C: A8       tay
8B0D: A5 4F    lda $4f
8B0F: 30 2E    bmi $8b3f
8B11: 29 02    and #$02
8B13: 85 1B    sta $1b
8B15: 8A       txa
8B16: 29 02    and #$02
8B18: 85 1C    sta $1c
8B1A: C5 1B    cmp $1b
8B1C: D0 21    bne $8b3f
8B1E: A9 00    lda #$00
8B20: 85 1B    sta $1b
8B22: B9 B9 00 lda $00b9, y
8B25: C9 58    cmp #$58
8B27: B0 08    bcs $8b31
8B29: C9 38    cmp #$38
8B2B: B0 02    bcs $8b2f
8B2D: E6 1B    inc $1b
8B2F: E6 1B    inc $1b
8B31: A5 1C    lda $1c
8B33: F0 02    beq $8b37
8B35: A9 03    lda #$03
8B37: 18       clc
8B38: 65 1B    adc $1b
8B3A: 69 16    adc #$16
8B3C: 4C 5E 8B jmp $8b5e
8B3F: B9 73 03 lda $0373, y
8B42: 29 0F    and #$0f
8B44: C9 04    cmp #$04
8B46: F0 2E    beq $8b76
8B48: 90 08    bcc $8b52
8B4A: 69 00    adc #$00
8B4C: C9 0A    cmp #$0a
8B4E: 90 02    bcc $8b52
8B50: A9 0A    lda #$0a
8B52: 85 1B    sta $1b
8B54: 8A       txa
8B55: 29 02    and #$02
8B57: F0 02    beq $8b5b
8B59: A9 0B    lda #$0b
8B5B: 18       clc
8B5C: 65 1B    adc $1b
8B5E: 85 1B    sta $1b
8B60: 0A       asl a
8B61: 65 1B    adc $1b
8B63: A8       tay
8B64: B9 84 8B lda $8b84, y
8B67: 85 1B    sta $1b
8B69: B9 85 8B lda $8b85, y
8B6C: 85 1C    sta $1c
8B6E: B9 86 8B lda $8b86, y
8B71: 85 1D    sta $1d
8B73: 68       pla
8B74: AA       tax
8B75: 60       rts
8B76: B9 B9 00 lda $00b9, y
8B79: C9 48    cmp #$48
8B7B: A9 04    lda #$04
8B7D: B0 D3    bcs $8b52
8B7F: 69 01    adc #$01
8B81: 4C 52 8B jmp $8b52

8BD8: A9 00    lda #$00
8BDA: 85 2A    sta $2a
8BDC: A5 1B    lda $1b
8BDE: D0 1E    bne $8bfe
8BE0: 8A       txa
8BE1: 4A       lsr a
8BE2: A8       tay
8BE3: B9 54 00 lda $0054, y
8BE6: C9 0B    cmp #$0b
8BE8: F0 07    beq $8bf1
8BEA: E6 2A    inc $2a
8BEC: A0 00    ldy #$00
8BEE: 4C F3 8B jmp $8bf3
8BF1: A0 12    ldy #$12
8BF3: 8A       txa
8BF4: 29 02    and #$02
8BF6: F0 03    beq $8bfb
8BF8: C8       iny
8BF9: C8       iny
8BFA: C8       iny
8BFB: 4C 1B 8C jmp $8c1b
8BFE: A0 06    ldy #$06
8C00: 8A       txa
8C01: 29 02    and #$02
8C03: F0 05    beq $8c0a
8C05: 98       tya
8C06: 18       clc
8C07: 69 06    adc #$06
8C09: A8       tay
8C0A: 86 29    stx $29
8C0C: 8A       txa
8C0D: 49 01    eor #$01
8C0F: AA       tax
8C10: B5 B9    lda $b9, x
8C12: A6 29    ldx $29
8C14: C9 48    cmp #$48
8C16: B0 03    bcs $8c1b
8C18: C8       iny
8C19: C8       iny
8C1A: C8       iny
8C1B: B9 36 8C lda $8c36, y
8C1E: 85 1B    sta $1b
8C20: B9 37 8C lda $8c37, y
8C23: 85 1C    sta $1c
8C25: A5 2A    lda $2a
8C27: F0 07    beq $8c30
8C29: B5 B9    lda $b9, x
8C2B: 85 1D    sta $1d
8C2D: 4C 35 8C jmp $8c35
8C30: B9 38 8C lda $8c38, y
8C33: 85 1D    sta $1d
8C35: 60       rts

8C4D: 48       pha
8C4E: 8A       txa
8C4F: 29 02    and #$02
8C51: 4A       lsr a
8C52: 85 2A    sta $2a
8C54: A4 4F    ldy $4f
8C56: B9 B9 00 lda $00b9, y
8C59: C9 38    cmp #$38
8C5B: 90 0E    bcc $8c6b
8C5D: C9 58    cmp #$58
8C5F: 90 05    bcc $8c66
8C61: A0 00    ldy #$00
8C63: 4C 6D 8C jmp $8c6d
8C66: A0 08    ldy #$08
8C68: 4C 6D 8C jmp $8c6d
8C6B: A0 10    ldy #$10
8C6D: A5 2A    lda $2a
8C6F: F0 05    beq $8c76
8C71: 98       tya
8C72: 18       clc
8C73: 69 04    adc #$04
8C75: A8       tay
8C76: B9 8B 8C lda $8c8b, y
8C79: 85 1B    sta $1b
8C7B: B9 8C 8C lda $8c8c, y
8C7E: 85 1C    sta $1c
8C80: B9 8D 8C lda $8c8d, y
8C83: 85 1D    sta $1d
8C85: B9 8E 8C lda $8c8e, y
8C88: 85 1E    sta $1e
8C8A: 60       rts

8CA3: 8A       txa
8CA4: 29 02    and #$02
8CA6: 85 1B    sta $1b
8CA8: 4A       lsr a
8CA9: A8       tay
8CAA: A9 00    lda #$00
8CAC: 95 F1    sta $f1, x
8CAE: 95 E3    sta $e3, x
8CB0: 95 C7    sta $c7, x
8CB2: AD F9 07 lda $07f9
8CB5: F0 03    beq $8cba
8CB7: 4C C0 8D jmp $8dc0
8CBA: A5 46    lda $46
8CBC: 29 08    and #$08
8CBE: F0 03    beq $8cc3
8CC0: 4C A6 8D jmp $8da6
8CC3: B9 47 00 lda $0047, y
8CC6: 30 78    bmi $8d40
8CC8: A5 4F    lda $4f
8CCA: 29 02    and #$02
8CCC: 45 1B    eor $1b
8CCE: F0 2F    beq $8cff
8CD0: 18       clc
8CD1: BD 0A 03 lda $030a, x
8CD4: 29 08    and #$08
8CD6: F0 02    beq $8cda
8CD8: A9 05    lda #$05
8CDA: 65 5D    adc $5d
8CDC: 85 1C    sta $1c
8CDE: A5 1B    lda $1b
8CE0: F0 02    beq $8ce4
8CE2: A9 0A    lda #$0a
8CE4: 65 1C    adc $1c
8CE6: 0A       asl a
8CE7: 0A       asl a
8CE8: A8       tay
8CE9: B9 DA 8D lda $8dda, y
8CEC: 95 9D    sta $9d, x
8CEE: B9 DB 8D lda $8ddb, y
8CF1: 95 8F    sta $8f, x
8CF3: B9 DC 8D lda $8ddc, y
8CF6: 95 B9    sta $b9, x
8CF8: B9 DD 8D lda $8ddd, y
8CFB: 9D 73 03 sta $0373, x
8CFE: 60       rts
8CFF: 8A       txa
8D00: C5 4F    cmp $4f
8D02: D0 22    bne $8d26
8D04: 20 0A D0 jsr $d00a
8D07: 29 03    and #$03
8D09: 06 1B    asl $1b
8D0B: 65 1B    adc $1b
8D0D: 0A       asl a
8D0E: 0A       asl a
8D0F: A8       tay
8D10: B9 2A 8E lda $8e2a, y
8D13: 95 9D    sta $9d, x
8D15: B9 2B 8E lda $8e2b, y
8D18: 95 8F    sta $8f, x
8D1A: B9 2C 8E lda $8e2c, y
8D1D: 95 B9    sta $b9, x
8D1F: B9 2D 8E lda $8e2d, y
8D22: 9D 73 03 sta $0373, x
8D25: 60       rts
8D26: A5 1B    lda $1b
8D28: 0A       asl a
8D29: A8       tay
8D2A: B9 4A 8E lda $8e4a, y
8D2D: 95 9D    sta $9d, x
8D2F: B9 4B 8E lda $8e4b, y
8D32: 95 8F    sta $8f, x
8D34: B9 4C 8E lda $8e4c, y
8D37: 95 B9    sta $b9, x
8D39: B9 4D 8E lda $8e4d, y
8D3C: 9D 73 03 sta $0373, x
8D3F: 60       rts
8D40: A5 4F    lda $4f
8D42: 29 02    and #$02
8D44: 45 1B    eor $1b
8D46: F0 25    beq $8d6d
8D48: 18       clc
8D49: BD 0A 03 lda $030a, x
8D4C: 29 08    and #$08
8D4E: 4A       lsr a
8D4F: 4A       lsr a
8D50: 4A       lsr a
8D51: 4A       lsr a
8D52: 65 1B    adc $1b
8D54: 0A       asl a
8D55: 0A       asl a
8D56: A8       tay
8D57: B9 52 8E lda $8e52, y
8D5A: 95 9D    sta $9d, x
8D5C: B9 53 8E lda $8e53, y
8D5F: 95 8F    sta $8f, x
8D61: B9 54 8E lda $8e54, y
8D64: 95 B9    sta $b9, x
8D66: B9 55 8E lda $8e55, y
8D69: 9D 73 03 sta $0373, x
8D6C: 60       rts
8D6D: 8A       txa
8D6E: C5 4F    cmp $4f
8D70: D0 1A    bne $8d8c
8D72: A5 1B    lda $1b
8D74: 0A       asl a
8D75: A8       tay
8D76: B9 62 8E lda $8e62, y
8D79: 95 9D    sta $9d, x
8D7B: B9 63 8E lda $8e63, y
8D7E: 95 8F    sta $8f, x
8D80: B9 64 8E lda $8e64, y
8D83: 95 B9    sta $b9, x
8D85: B9 65 8E lda $8e65, y
8D88: 9D 73 03 sta $0373, x
8D8B: 60       rts
8D8C: A5 1B    lda $1b
8D8E: 0A       asl a
8D8F: A8       tay
8D90: B9 6A 8E lda $8e6a, y
8D93: 95 9D    sta $9d, x
8D95: B9 6B 8E lda $8e6b, y
8D98: 95 8F    sta $8f, x
8D9A: B9 6C 8E lda $8e6c, y
8D9D: 95 B9    sta $b9, x
8D9F: B9 6D 8E lda $8e6d, y
8DA2: 9D 73 03 sta $0373, x
8DA5: 60       rts
8DA6: 8A       txa
8DA7: 0A       asl a
8DA8: 0A       asl a
8DA9: A8       tay
8DAA: B9 72 8E lda $8e72, y
8DAD: 95 9D    sta $9d, x
8DAF: B9 73 8E lda $8e73, y
8DB2: 95 8F    sta $8f, x
8DB4: B9 74 8E lda $8e74, y
8DB7: 95 B9    sta $b9, x
8DB9: B9 75 8E lda $8e75, y
8DBC: 9D 73 03 sta $0373, x
8DBF: 60       rts
8DC0: 8A       txa
8DC1: 0A       asl a
8DC2: 0A       asl a
8DC3: A8       tay
8DC4: B9 82 8E lda $8e82, y
8DC7: 95 9D    sta $9d, x
8DC9: B9 83 8E lda $8e83, y
8DCC: 95 8F    sta $8f, x
8DCE: B9 84 8E lda $8e84, y
8DD1: 95 B9    sta $b9, x
8DD3: B9 85 8E lda $8e85, y
8DD6: 9D 73 03 sta $0373, x
8DD9: 60       rts

8E92: 8A       txa
8E93: 49 01    eor #$01
8E95: A8       tay
8E96: B9 16 03 lda $0316, y
8E99: 29 7F    and #$7f
8E9B: C9 0F    cmp #$0f
8E9D: F0 21    beq $8ec0
8E9F: 8A       txa
8EA0: 29 02    and #$02
8EA2: 4A       lsr a
8EA3: F0 03    beq $8ea8
8EA5: 18       clc
8EA6: 69 03    adc #$03
8EA8: A8       tay
8EA9: B9 F7 8E lda $8ef7, y
8EAC: 85 1B    sta $1b
8EAE: B9 F8 8E lda $8ef8, y
8EB1: 85 1C    sta $1c
8EB3: B9 F9 8E lda $8ef9, y
8EB6: 85 1D    sta $1d
8EB8: B9 FA 8E lda $8efa, y
8EBB: 85 1E    sta $1e
8EBD: 4C F6 8E jmp $8ef6
8EC0: B9 B9 00 lda $00b9, y
8EC3: C9 48    cmp #$48
8EC5: B0 0F    bcs $8ed6
8EC7: 8A       txa
8EC8: 29 02    and #$02
8ECA: F0 05    beq $8ed1
8ECC: A0 08    ldy #$08
8ECE: 4C E2 8E jmp $8ee2
8ED1: A0 00    ldy #$00
8ED3: 4C E2 8E jmp $8ee2
8ED6: 8A       txa
8ED7: 29 02    and #$02
8ED9: F0 05    beq $8ee0
8EDB: A0 0C    ldy #$0c
8EDD: 4C E2 8E jmp $8ee2
8EE0: A0 04    ldy #$04
8EE2: B9 FF 8E lda $8eff, y
8EE5: 85 1B    sta $1b
8EE7: B9 00 8F lda $8f00, y
8EEA: 85 1C    sta $1c
8EEC: B9 01 8F lda $8f01, y
8EEF: 85 1D    sta $1d
8EF1: B9 02 8F lda $8f02, y
8EF4: 85 1E    sta $1e
8EF6: 60       rts

8F0E: 38       sec
8F0F: AD F0 03 lda $03f0
8F12: 9D 84 03 sta $0384, x
8F15: AD EF 03 lda $03ef
8F18: 9D 80 03 sta $0380, x
8F1B: AD F2 03 lda $03f2
8F1E: 9D 8C 03 sta $038c, x
8F21: AD F1 03 lda $03f1
8F24: 9D 88 03 sta $0388, x
8F27: 20 93 84 jsr $8493
8F2A: A5 1B    lda $1b
8F2C: F0 07    beq $8f35
8F2E: A5 1C    lda $1c
8F30: F0 08    beq $8f3a
8F32: 4C 4E 8F jmp $8f4e
8F35: 8A       txa
8F36: 29 02    and #$02
8F38: F0 14    beq $8f4e
8F3A: BD 80 03 lda $0380, x
8F3D: 18       clc
8F3E: 69 0C    adc #$0c
8F40: 9D 80 03 sta $0380, x
8F43: BD 84 03 lda $0384, x
8F46: 69 00    adc #$00
8F48: 9D 84 03 sta $0384, x
8F4B: 4C 5F 8F jmp $8f5f
8F4E: BD 80 03 lda $0380, x
8F51: 38       sec
8F52: E9 0C    sbc #$0c
8F54: 9D 80 03 sta $0380, x
8F57: BD 84 03 lda $0384, x
8F5A: E9 00    sbc #$00
8F5C: 9D 84 03 sta $0384, x
8F5F: 60       rts
8F60: 8A       txa
8F61: 49 01    eor #$01
8F63: A8       tay
8F64: B5 B9    lda $b9, x
8F66: C9 58    cmp #$58
8F68: 90 0C    bcc $8f76
8F6A: B9 73 03 lda $0373, y
8F6D: 29 0F    and #$0f
8F6F: C9 00    cmp #$00
8F71: F0 2D    beq $8fa0
8F73: 4C 99 8F jmp $8f99
8F76: C9 38    cmp #$38
8F78: 90 13    bcc $8f8d
8F7A: B9 73 03 lda $0373, y
8F7D: 29 0F    and #$0f
8F7F: C9 01    cmp #$01
8F81: D0 1D    bne $8fa0
8F83: B9 B9 00 lda $00b9, y
8F86: C9 48    cmp #$48
8F88: B0 1D    bcs $8fa7
8F8A: 4C 99 8F jmp $8f99
8F8D: B9 73 03 lda $0373, y
8F90: 29 0F    and #$0f
8F92: C9 02    cmp #$02
8F94: D0 11    bne $8fa7
8F96: 4C A0 8F jmp $8fa0
8F99: A9 68    lda #$68
8F9B: 85 1D    sta $1d
8F9D: 4C AB 8F jmp $8fab
8FA0: A9 48    lda #$48
8FA2: 85 1D    sta $1d
8FA4: 4C AB 8F jmp $8fab
8FA7: A9 28    lda #$28
8FA9: 85 1D    sta $1d
8FAB: 8A       txa
8FAC: 29 02    and #$02
8FAE: F0 0B    beq $8fbb
8FB0: A9 01    lda #$01
8FB2: 85 1B    sta $1b
8FB4: A9 20    lda #$20
8FB6: 85 1C    sta $1c
8FB8: 4C C3 8F jmp $8fc3
8FBB: A9 00    lda #$00
8FBD: 85 1B    sta $1b
8FBF: A9 E0    lda #$e0
8FC1: 85 1C    sta $1c
8FC3: 60       rts
8FC4: BD 88 03 lda $0388, x
8FC7: C9 78    cmp #$78
8FC9: 90 08    bcc $8fd3
8FCB: A9 01    lda #$01
8FCD: 9D B0 03 sta $03b0, x
8FD0: 4C 25 90 jmp $9025
8FD3: C9 0E    cmp #$0e
8FD5: B0 08    bcs $8fdf
8FD7: A9 02    lda #$02
8FD9: 9D B0 03 sta $03b0, x
8FDC: 4C 25 90 jmp $9025
8FDF: A0 00    ldy #$00
8FE1: BD 88 03 lda $0388, x
8FE4: C9 58    cmp #$58
8FE6: B0 0B    bcs $8ff3
8FE8: C9 38    cmp #$38
8FEA: B0 05    bcs $8ff1
8FEC: A0 04    ldy #$04
8FEE: 4C F3 8F jmp $8ff3
8FF1: A0 02    ldy #$02
8FF3: 8A       txa
8FF4: 4A       lsr a
8FF5: 85 2A    sta $2a
8FF7: 98       tya
8FF8: 18       clc
8FF9: 65 2A    adc $2a
8FFB: A8       tay
8FFC: A5 2A    lda $2a
8FFE: F0 10    beq $9010
9000: B9 38 84 lda $8438, y
9003: DD 80 03 cmp $0380, x
9006: B0 18    bcs $9020
9008: A9 03    lda #$03
900A: 9D B0 03 sta $03b0, x
900D: 4C 25 90 jmp $9025
9010: B9 38 84 lda $8438, y
9013: DD 80 03 cmp $0380, x
9016: 90 08    bcc $9020
9018: A9 04    lda #$04
901A: 9D B0 03 sta $03b0, x
901D: 4C 25 90 jmp $9025
9020: A9 00    lda #$00
9022: 9D B0 03 sta $03b0, x
9025: 60       rts
9026: BD 84 03 lda $0384, x
9029: 85 11    sta $11
902B: BD 80 03 lda $0380, x
902E: 85 10    sta $10
9030: BD 88 03 lda $0388, x
9033: 85 12    sta $12
9035: BD 8C 03 lda $038c, x
9038: 85 13    sta $13
903A: 20 6A B4 jsr $b46a
903D: 60       rts
903E: A0 0D    ldy #$0d
9040: BD 84 03 lda $0384, x
9043: 99 9D 00 sta $009d, y
9046: BD 80 03 lda $0380, x
9049: 99 8F 00 sta $008f, y
904C: BD 88 03 lda $0388, x
904F: 99 B9 00 sta $00b9, y
9052: BD 8C 03 lda $038c, x
9055: 99 C7 00 sta $00c7, y
9058: A9 0D    lda #$0d
905A: 20 1F B7 jsr $b71f
905D: 60       rts
905E: A5 11    lda $11
9060: 10 17    bpl $9079
9062: 49 FF    eor #$ff
9064: 85 11    sta $11
9066: A5 10    lda $10
9068: 49 FF    eor #$ff
906A: 85 10    sta $10
906C: 18       clc
906D: A5 10    lda $10
906F: 69 01    adc #$01
9071: 85 10    sta $10
9073: A5 11    lda $11
9075: 69 00    adc #$00
9077: 85 11    sta $11
9079: A5 13    lda $13
907B: 10 17    bpl $9094
907D: 49 FF    eor #$ff
907F: 85 13    sta $13
9081: A5 12    lda $12
9083: 49 FF    eor #$ff
9085: 85 12    sta $12
9087: 18       clc
9088: A5 12    lda $12
908A: 69 01    adc #$01
908C: 85 12    sta $12
908E: A5 13    lda $13
9090: 69 00    adc #$00
9092: 85 13    sta $13
9094: 60       rts
9095: 8A       txa
9096: 29 02    and #$02
9098: F0 0C    beq $90a6
909A: BD 80 03 lda $0380, x
909D: 18       clc
909E: 69 0A    adc #$0a
90A0: 9D 80 03 sta $0380, x
90A3: 4C AF 90 jmp $90af
90A6: BD 80 03 lda $0380, x
90A9: 38       sec
90AA: E9 0A    sbc #$0a
90AC: 9D 80 03 sta $0380, x
90AF: 60       rts
90B0: BD 1A 03 lda $031a, x
90B3: 29 7F    and #$7f
90B5: C9 10    cmp #$10
90B7: F0 0E    beq $90c7
90B9: C9 11    cmp #$11
90BB: F0 0A    beq $90c7
90BD: C9 13    cmp #$13
90BF: F0 06    beq $90c7
90C1: C9 14    cmp #$14
90C3: F0 02    beq $90c7
90C5: 18       clc
90C6: 60       rts
90C7: 38       sec
90C8: 60       rts
90C9: BD 16 03 lda $0316, x
90CC: 29 7F    and #$7f
90CE: C9 09    cmp #$09
90D0: F0 13    beq $90e5
90D2: C9 08    cmp #$08
90D4: F0 0F    beq $90e5
90D6: A9 00    lda #$00
90D8: 20 49 85 jsr $8549
90DB: A5 1B    lda $1b
90DD: CD F9 03 cmp $03f9
90E0: 90 0F    bcc $90f1
90E2: 4C EA 90 jmp $90ea
90E5: 20 2F 83 jsr $832f
90E8: B0 07    bcs $90f1
90EA: A9 0E    lda #$0e
90EC: 9D 16 03 sta $0316, x
90EF: 18       clc
90F0: 60       rts
90F1: 38       sec
90F2: 60       rts
90F3: BD 1A 03 lda $031a, x
90F6: 29 7F    and #$7f
90F8: C9 0F    cmp #$0f
90FA: B0 03    bcs $90ff
90FC: 4C 05 91 jmp $9105
90FF: C9 17    cmp #$17
9101: B0 02    bcs $9105
9103: 18       clc
9104: 60       rts
9105: 38       sec
9106: 60       rts
9107: 8A       txa
9108: 29 02    and #$02
910A: 4A       lsr a
910B: A8       tay
910C: B9 47 00 lda $0047, y
910F: 30 1E    bmi $912f
9111: BD 16 03 lda $0316, x
9114: 29 7F    and #$7f
9116: C9 0A    cmp #$0a
9118: D0 15    bne $912f
911A: 8A       txa
911B: 49 01    eor #$01
911D: A8       tay
911E: B9 B8 03 lda $03b8, y
9121: C9 03    cmp #$03
9123: F0 0A    beq $912f
9125: A9 8B    lda #$8b
9127: 9D 16 03 sta $0316, x
912A: A9 09    lda #$09
912C: 99 16 03 sta $0316, y
912F: 60       rts
9130: A6 4C    ldx $4c
9132: 20 AC A2 jsr $a2ac
9135: BD 0E 03 lda $030e, x
9138: 29 44    and #$44
913A: D0 23    bne $915f
913C: BD 27 03 lda $0327, x
913F: 10 1E    bpl $915f
9141: 20 D8 91 jsr $91d8
9144: B0 19    bcs $915f
9146: BD 27 03 lda $0327, x
9149: 29 7F    and #$7f
914B: 9D 27 03 sta $0327, x
914E: BD 1A 03 lda $031a, x
9151: 29 7F    and #$7f
9153: 9D 2F 03 sta $032f, x
9156: BD 27 03 lda $0327, x
9159: 9D 1A 03 sta $031a, x
915C: 20 F3 91 jsr $91f3
915F: BD 1A 03 lda $031a, x
9162: 29 7F    and #$7f
9164: C9 0A    cmp #$0a
9166: B0 0D    bcs $9175
9168: A9 01    lda #$01
916A: 20 DF D8 jsr $d8df
916D: 20 F3 7F jsr $7ff3
9170: A9 00    lda #$00
9172: 20 DF D8 jsr $d8df
9175: BD 1A 03 lda $031a, x
9178: 29 7F    and #$7f
917A: 0A       asl a
917B: A8       tay
917C: B9 8A 91 lda table_918a, y
917F: 85 10    sta $10
9181: B9 8B 91 lda $918b, y
9184: 85 11    sta $11
9186: 6C 10 00 jmp ($0010)        ; [indirect_jump]
9189: 60       rts

91D8: BD 1A 03 lda $031a, x
91DB: 29 7F    and #$7f
91DD: C9 0A    cmp #$0a
91DF: F0 04    beq $91e5
91E1: C9 0B    cmp #$0b
91E3: D0 09    bne $91ee
91E5: BD 27 03 lda $0327, x
91E8: 29 7F    and #$7f
91EA: C9 0C    cmp #$0c
91EC: D0 03    bne $91f1
91EE: 18       clc
91EF: 90 01    bcc $91f2
91F1: 38       sec
91F2: 60       rts
91F3: BD 1A 03 lda $031a, x
91F6: C9 17    cmp #$17
91F8: B0 15    bcs $920f
91FA: C9 0F    cmp #$0f
91FC: 90 11    bcc $920f
91FE: BD 2B 03 lda $032b, x
9201: 9D 54 02 sta $0254, x
9204: 9D C4 03 sta $03c4, x
9207: BD 0E 03 lda $030e, x
920A: 09 04    ora #$04
920C: 9D 0E 03 sta $030e, x
920F: 60       rts
9210: BD 1A 03 lda $031a, x
9213: 30 03    bmi $9218
9215: 20 95 A1 jsr $a195
9218: 20 FD A0 jsr $a0fd
921B: BD 1A 03 lda $031a, x
921E: 29 7F    and #$7f
9220: 0A       asl a
9221: A8       tay
9222: B9 EA 92 lda table_92ea, y
9225: 85 1B    sta $1b
9227: B9 EB 92 lda $92eb, y
922A: 85 1C    sta $1c
922C: A9 37    lda #$37
922E: 85 00    sta $00
9230: A9 92    lda #$92
9232: 85 01    sta $01
9234: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
9237: BD 43 03 lda $0343, x
923A: C9 80    cmp #$80
923C: 90 0A    bcc $9248
923E: BD C0 03 lda $03c0, x
9241: 09 80    ora #$80
9243: 9D C0 03 sta $03c0, x
9246: D0 08    bne $9250
9248: BD C0 03 lda $03c0, x
924B: 29 7F    and #$7f
924D: 9D C0 03 sta $03c0, x
9250: 20 8D 9D jsr $9d8d
9253: 4C 89 91 jmp $9189
9256: BD 1A 03 lda $031a, x
9259: 30 03    bmi $925e
925B: 20 95 A1 jsr $a195
925E: 20 FD A0 jsr $a0fd
9261: BD 1A 03 lda $031a, x
9264: 29 7F    and #$7f
9266: 38       sec
9267: E9 03    sbc #$03
9269: 0A       asl a
926A: A8       tay
926B: B9 EA 92 lda table_92ea, y
926E: 85 1B    sta $1b
9270: B9 EB 92 lda $92eb, y
9273: 85 1C    sta $1c
9275: A9 80    lda #$80				; callback/jump next address: 9280
9277: 85 00    sta $00
9279: A9 92    lda #$92
927B: 85 01    sta $01
927D: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
callback_9280:
9280: 20 8D 9D jsr $9d8d
9283: 4C 89 91 jmp $9189
9286: BD 1A 03 lda $031a, x
9289: 30 0B    bmi $9296
928B: 20 95 A1 jsr $a195
928E: BD 0E 03 lda $030e, x
9291: 29 EF    and #$ef
9293: 9D 0E 03 sta $030e, x
9296: BD 0E 03 lda $030e, x
9299: 29 10    and #$10
929B: F0 00    beq $929d
929D: BD 2B 03 lda $032b, x
92A0: 9D 54 02 sta $0254, x
92A3: 18       clc
92A4: 69 10    adc #$10
92A6: 4A       lsr a
92A7: 4A       lsr a
92A8: 4A       lsr a
92A9: 4A       lsr a
92AA: 4A       lsr a
92AB: A8       tay
92AC: B9 E2 92 lda $92e2, y
92AF: 9D 61 02 sta $0261, x
92B2: BD 1A 03 lda $031a, x
92B5: 29 7F    and #$7f
92B7: 38       sec
92B8: E9 06    sbc #$06
92BA: 0A       asl a
92BB: A8       tay
92BC: B9 EA 92 lda table_92ea, y
92BF: 85 1B    sta $1b
92C1: B9 EB 92 lda $92eb, y
92C4: 85 1C    sta $1c
92C6: A9 D1    lda #$d1			; callback/jump in 92d1
92C8: 85 00    sta $00
92CA: A9 92    lda #$92
92CC: 85 01    sta $01
92CE: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
callback_92d1:
92D1: 20 15 A2 jsr $a215
92D4: B0 03    bcs $92d9
92D6: 20 C2 B5 jsr $b5c2
92D9: 20 8D 9D jsr $9d8d
92DC: 20 1C 9C jsr $9c1c
92DF: 4C 89 91 jmp $9189

92F0: A0 20    ldy #$20
92F2: BD 37 03 lda $0337, x
92F5: 29 40    and #$40
92F7: F0 02    beq $92fb
92F9: A0 60    ldy #$60
92FB: BD 37 03 lda $0337, x
92FE: 30 07    bmi $9307
9300: 98       tya
9301: 49 FF    eor #$ff
9303: 18       clc
9304: 69 01    adc #$01
9306: A8       tay
9307: 98       tya
9308: 9D C4 03 sta $03c4, x
930B: 6C 00 00 jmp ($0000)        ; [jump_to_callback]        ; [indirect_jump]
930E: A0 20    ldy #$20
9310: B5 B9    lda $b9, x
9312: C9 48    cmp #$48
9314: 90 02    bcc $9318
9316: A0 60    ldy #$60
9318: E0 02    cpx #$02
931A: 90 0B    bcc $9327
931C: A0 E0    ldy #$e0
931E: B5 B9    lda $b9, x
9320: C9 48    cmp #$48
9322: 90 03    bcc $9327
9324: A9 A0    lda #$a0
9326: A8       tay
9327: 98       tya
9328: 9D C4 03 sta $03c4, x
932B: 6C 00 00 jmp ($0000)        ; [jump_to_callback]        ; [indirect_jump]
932E: BD 54 02 lda $0254, x
9331: 9D C4 03 sta $03c4, x
9334: 6C 00 00 jmp ($0000)        ; [jump_to_callback]        ; [indirect_jump]
9337: BD 1A 03 lda $031a, x
933A: 30 0B    bmi $9347
933C: 20 95 A1 jsr $a195
933F: BD 0E 03 lda $030e, x
9342: 29 EF    and #$ef
9344: 9D 0E 03 sta $030e, x
9347: BD 2B 03 lda $032b, x
934A: 9D C4 03 sta $03c4, x
934D: 9D 54 02 sta $0254, x
9350: 18       clc
9351: 69 10    adc #$10
9353: 29 E0    and #$e0
9355: 4A       lsr a
9356: 4A       lsr a
9357: 4A       lsr a
9358: 4A       lsr a
9359: A8       tay
935A: BD DC 03 lda $03dc, x
935D: F0 01    beq $9360
935F: C8       iny
9360: B9 92 93 lda $9392, y
9363: 9D 61 02 sta $0261, x
9366: 20 15 A2 jsr $a215
9369: B0 0D    bcs $9378
936B: 20 C2 B5 jsr $b5c2
936E: DE DC 03 dec $03dc, x
9371: 10 05    bpl $9378
9373: A9 00    lda #$00
9375: 9D DC 03 sta $03dc, x
9378: 20 8D 9D jsr $9d8d
937B: 20 1C 9C jsr $9c1c
937E: BD D6 02 lda $02d6, x
9381: D0 0C    bne $938f
9383: BD F0 02 lda $02f0, x
9386: 29 01    and #$01
9388: D0 05    bne $938f
938A: A9 21    lda #$21
938C: 20 B8 D7 jsr $d7b8
938F: 4C 89 91 jmp $9189

93A2: BD 1A 03 lda $031a, x
93A5: 30 48    bmi $93ef
93A7: 20 95 A1 jsr $a195
93AA: BD 2B 03 lda $032b, x
93AD: 9D 54 02 sta $0254, x
93B0: A9 40    lda #$40
93B2: 9D C0 03 sta $03c0, x
93B5: A0 00    ldy #$00
93B7: BD 1A 03 lda $031a, x
93BA: 29 7F    and #$7f
93BC: C9 0A    cmp #$0a
93BE: F0 02    beq $93c2
93C0: A0 08    ldy #$08
93C2: A9 00    lda #$00
93C4: 85 00    sta $00
93C6: B9 E5 94 lda $94e5, y
93C9: 9D 6E 02 sta $026e, x
93CC: C8       iny
93CD: 8A       txa
93CE: 18       clc
93CF: 69 0D    adc #$0d
93D1: AA       tax
93D2: E6 00    inc $00
93D4: A5 00    lda $00
93D6: C9 08    cmp #$08
93D8: 90 EC    bcc $93c6
93DA: A6 4C    ldx $4c
93DC: A9 E7    lda #$e7
93DE: 85 00    sta $00
93E0: A9 93    lda #$93
93E2: 85 01    sta $01
93E4: 4C 0E 93 jmp $930e
93E7: BD 54 02 lda $0254, x
93EA: 10 03    bpl $93ef
93EC: 20 69 A1 jsr $a169
93EF: BD 0E 03 lda $030e, x
93F2: 29 10    and #$10
93F4: F0 23    beq $9419
93F6: BD 6E 02 lda $026e, x
93F9: 48       pha
93FA: BD 7B 02 lda $027b, x
93FD: 48       pha
93FE: BD 88 02 lda $0288, x
9401: 48       pha
9402: BD 95 02 lda $0295, x
9405: 48       pha
9406: 20 FD A0 jsr $a0fd
9409: 68       pla
940A: 9D 95 02 sta $0295, x
940D: 68       pla
940E: 9D 88 02 sta $0288, x
9411: 68       pla
9412: 9D 7B 02 sta $027b, x
9415: 68       pla
9416: 9D 6E 02 sta $026e, x
9419: A6 4C    ldx $4c
941B: BD C0 03 lda $03c0, x
941E: 29 40    and #$40
9420: D0 09    bne $942b
9422: 20 15 A2 jsr $a215
9425: 20 12 B6 jsr $b612
9428: 20 8B 94 jsr $948b
942B: 20 1C 9C jsr $9c1c
942E: BD F0 02 lda $02f0, x
9431: F0 40    beq $9473
9433: BD C0 03 lda $03c0, x
9436: 29 40    and #$40
9438: F0 39    beq $9473
943A: BD C0 03 lda $03c0, x
943D: 29 BF    and #$bf
943F: 9D C0 03 sta $03c0, x
9442: B5 E3    lda $e3, x
9444: 18       clc
9445: 69 10    adc #$10
9447: 95 E3    sta $e3, x
9449: A9 25    lda #$25
944B: 20 B8 D7 jsr $d7b8
944E: BD 0E 03 lda $030e, x
9451: 09 80    ora #$80
9453: 9D 0E 03 sta $030e, x
9456: 8A       txa
9457: 18       clc
9458: 69 07    adc #$07
945A: A8       tay
945B: A9 80    lda #$80
945D: 99 1A 03 sta $031a, y
9460: A9 30    lda #$30
9462: 99 65 00 sta $0065, y
9465: BD 1A 03 lda $031a, x
9468: 29 7F    and #$7f
946A: C9 0A    cmp #$0a
946C: D0 05    bne $9473
946E: A9 02    lda #$02
9470: 20 B5 A2 jsr $a2b5
9473: 20 8D 9D jsr $9d8d
9476: 20 E4 A0 jsr $a0e4
9479: 90 0D    bcc $9488
947B: BD 1A 03 lda $031a, x
947E: 29 7F    and #$7f
9480: 9D 2F 03 sta $032f, x
9483: A9 20    lda #$20
9485: 9D 1A 03 sta $031a, x
9488: 4C 89 91 jmp $9189
948B: AD E0 03 lda $03e0
948E: F0 54    beq $94e4
9490: C9 05    cmp #$05
9492: B0 50    bcs $94e4
9494: BD 3F 03 lda $033f, x
9497: C9 04    cmp #$04
9499: 90 49    bcc $94e4
949B: A0 00    ldy #$00
949D: A5 BD    lda $bd
949F: D5 B9    cmp $b9, x
94A1: B0 02    bcs $94a5
94A3: A0 01    ldy #$01
94A5: 84 00    sty $00
94A7: A9 00    lda #$00
94A9: 85 1B    sta $1b
94AB: A9 01    lda #$01
94AD: 85 1C    sta $1c
94AF: A5 00    lda $00
94B1: F0 17    beq $94ca
94B3: A5 1B    lda $1b
94B5: 49 FF    eor #$ff
94B7: 18       clc
94B8: 69 01    adc #$01
94BA: 85 1B    sta $1b
94BC: 08       php
94BD: A5 1C    lda $1c
94BF: 49 FF    eor #$ff
94C1: 85 1C    sta $1c
94C3: 28       plp
94C4: A5 1C    lda $1c
94C6: 69 00    adc #$00
94C8: 85 1C    sta $1c
94CA: A5 1B    lda $1b
94CC: 18       clc
94CD: 75 AB    adc $ab, x
94CF: 95 AB    sta $ab, x
94D1: A5 1C    lda $1c
94D3: 08       php
94D4: 75 B9    adc $b9, x
94D6: 95 B9    sta $b9, x
94D8: B5 C7    lda $c7, x
94DA: 69 00    adc #$00
94DC: 28       plp
94DD: 10 03    bpl $94e2
94DF: 18       clc
94E0: 69 FF    adc #$ff
94E2: 95 C7    sta $c7, x
94E4: 60       rts

94F5: BD 1A 03 lda $031a, x
94F8: 30 1B    bmi $9515
94FA: 20 95 A1 jsr $a195
94FD: A9 2F    lda #$2f
94FF: 20 B8 D7 jsr $d7b8
9502: BD 0E 03 lda $030e, x
9505: 09 04    ora #$04
9507: 9D 0E 03 sta $030e, x
950A: A9 15    lda #$15
950C: 85 00    sta $00
950E: A9 95    lda #$95
9510: 85 01    sta $01
9512: 4C 0E 93 jmp $930e
9515: 20 15 A2 jsr $a215
9518: 20 12 B6 jsr $b612
951B: 20 8B 94 jsr $948b
951E: 20 8D 9D jsr $9d8d
9521: 20 1C 9C jsr $9c1c
9524: BD F0 02 lda $02f0, x
9527: C9 02    cmp #$02
9529: D0 03    bne $952e
952B: 20 85 BD jsr $bd85
952E: 20 E4 A0 jsr $a0e4
9531: 90 05    bcc $9538
9533: A9 20    lda #$20
9535: 9D 1A 03 sta $031a, x
9538: 4C 89 91 jmp $9189
953B: BD 1A 03 lda $031a, x
953E: 30 0B    bmi $954b
9540: 20 95 A1 jsr $a195
9543: BD 0E 03 lda $030e, x
9546: 09 04    ora #$04
9548: 9D 0E 03 sta $030e, x
954B: 20 8D 9D jsr $9d8d
954E: 20 1C 9C jsr $9c1c
9551: 20 85 BD jsr $bd85
9554: 20 87 A1 jsr $a187
9557: 4C 89 91 jmp $9189
955A: BD 1A 03 lda $031a, x
955D: 30 2F    bmi $958e
955F: 20 95 A1 jsr $a195
9562: BD 0E 03 lda $030e, x
9565: 09 04    ora #$04
9567: 9D 0E 03 sta $030e, x
956A: A9 40    lda #$40
956C: 9D C0 03 sta $03c0, x
956F: A0 00    ldy #$00
9571: B9 E5 94 lda $94e5, y
9574: 9D 6E 02 sta $026e, x
9577: C8       iny
9578: 8A       txa
9579: 18       clc
957A: 69 0D    adc #$0d
957C: AA       tax
957D: C0 08    cpy #$08
957F: 90 F0    bcc $9571
9581: A6 4C    ldx $4c
9583: A9 8E    lda #$8e
9585: 85 00    sta $00
9587: A9 95    lda #$95
9589: 85 01    sta $01
958B: 4C 0E 93 jmp $930e
958E: 20 8D 9D jsr $9d8d
9591: BD 0E 03 lda $030e, x
9594: 29 10    and #$10
9596: F0 23    beq $95bb
9598: BD 6E 02 lda $026e, x
959B: 48       pha
959C: BD 7B 02 lda $027b, x
959F: 48       pha
95A0: BD 88 02 lda $0288, x
95A3: 48       pha
95A4: BD 95 02 lda $0295, x
95A7: 48       pha
95A8: 20 FD A0 jsr $a0fd
95AB: 68       pla
95AC: 9D 95 02 sta $0295, x
95AF: 68       pla
95B0: 9D 88 02 sta $0288, x
95B3: 68       pla
95B4: 9D 7B 02 sta $027b, x
95B7: 68       pla
95B8: 9D 6E 02 sta $026e, x
95BB: BD C0 03 lda $03c0, x
95BE: 29 40    and #$40
95C0: D0 03    bne $95c5
95C2: 20 12 B6 jsr $b612
95C5: 20 1C 9C jsr $9c1c
95C8: BD F0 02 lda $02f0, x
95CB: C9 02    cmp #$02
95CD: D0 03    bne $95d2
95CF: 20 85 BD jsr $bd85
95D2: BD F0 02 lda $02f0, x
95D5: F0 23    beq $95fa
95D7: BD C0 03 lda $03c0, x
95DA: 29 40    and #$40
95DC: F0 1C    beq $95fa
95DE: BD C0 03 lda $03c0, x
95E1: 29 BF    and #$bf
95E3: 9D C0 03 sta $03c0, x
95E6: B5 E3    lda $e3, x
95E8: 18       clc
95E9: 69 10    adc #$10
95EB: 95 E3    sta $e3, x
95ED: BD 0E 03 lda $030e, x
95F0: 09 80    ora #$80
95F2: 9D 0E 03 sta $030e, x
95F5: A9 04    lda #$04
95F7: 20 B5 A2 jsr $a2b5
95FA: 20 E4 A0 jsr $a0e4
95FD: 90 0D    bcc $960c
95FF: BD 1A 03 lda $031a, x
9602: 29 7F    and #$7f
9604: 9D 2F 03 sta $032f, x
9607: A9 20    lda #$20
9609: 9D 1A 03 sta $031a, x
960C: 4C 89 91 jmp $9189
960F: BD 1A 03 lda $031a, x
9612: 30 09    bmi $961d
9614: 20 95 A1 jsr $a195
9617: BD 2B 03 lda $032b, x
961A: 9D C4 03 sta $03c4, x
961D: BD C0 03 lda $03c0, x
9620: 29 01    and #$01
9622: F0 0A    beq $962e
9624: A9 03    lda #$03
9626: 9D FD 02 sta $02fd, x
9629: A9 02    lda #$02
962B: 9D F0 02 sta $02f0, x
962E: 20 FD A0 jsr $a0fd
9631: 20 8D 9D jsr $9d8d
9634: 20 1C 9C jsr $9c1c
9637: 20 87 A1 jsr $a187
963A: BD F0 02 lda $02f0, x
963D: C9 01    cmp #$01
963F: D0 06    bne $9647
9641: 20 8D 9D jsr $9d8d
9644: 20 85 BD jsr $bd85
9647: 4C 89 91 jmp $9189
964A: BD 1A 03 lda $031a, x
964D: 30 09    bmi $9658
964F: 20 95 A1 jsr $a195
9652: BD 2B 03 lda $032b, x
9655: 9D 54 02 sta $0254, x
9658: BD F0 02 lda $02f0, x
965B: C9 03    cmp #$03
965D: D0 58    bne $96b7
965F: 20 15 A2 jsr $a215
9662: B0 03    bcs $9667
9664: 20 C2 B5 jsr $b5c2
9667: BD C0 03 lda $03c0, x
966A: 29 20    and #$20
966C: D0 12    bne $9680
966E: A9 09    lda #$09
9670: 20 B5 A2 jsr $a2b5
9673: A9 22    lda #$22
9675: 20 B8 D7 jsr $d7b8
9678: BD C0 03 lda $03c0, x
967B: 09 20    ora #$20
967D: 9D C0 03 sta $03c0, x
9680: BD 61 02 lda $0261, x
9683: 38       sec
9684: E9 08    sbc #$08
9686: 9D 61 02 sta $0261, x
9689: B0 0D    bcs $9698
968B: A9 00    lda #$00
968D: 9D 61 02 sta $0261, x
9690: BD 0E 03 lda $030e, x
9693: 29 EF    and #$ef
9695: 9D 0E 03 sta $030e, x
9698: BD 0E 03 lda $030e, x
969B: 29 10    and #$10
969D: D0 1B    bne $96ba
969F: BD 1A 03 lda $031a, x
96A2: 29 7F    and #$7f
96A4: 9D 2F 03 sta $032f, x
96A7: A9 24    lda #$24
96A9: 9D 1A 03 sta $031a, x
96AC: BD 0E 03 lda $030e, x
96AF: 29 BF    and #$bf
96B1: 9D 0E 03 sta $030e, x
96B4: 4C E6 96 jmp $96e6
96B7: 20 FD A0 jsr $a0fd
96BA: 20 8D 9D jsr $9d8d
96BD: 20 1C 9C jsr $9c1c
96C0: BD F0 02 lda $02f0, x
96C3: F0 06    beq $96cb
96C5: 20 8D 9D jsr $9d8d
96C8: 20 85 BD jsr $bd85
96CB: BD F0 02 lda $02f0, x
96CE: C9 03    cmp #$03
96D0: D0 14    bne $96e6
96D2: BD 0E 03 lda $030e, x
96D5: 29 10    and #$10
96D7: D0 0D    bne $96e6
96D9: A9 30    lda #$30
96DB: 9D 61 02 sta $0261, x
96DE: BD 0E 03 lda $030e, x
96E1: 09 10    ora #$10
96E3: 9D 0E 03 sta $030e, x
96E6: 4C 89 91 jmp $9189
96E9: BD 1A 03 lda $031a, x
96EC: 30 3F    bmi $972d
96EE: 20 95 A1 jsr $a195
96F1: 20 E6 97 jsr $97e6
96F4: BD 2B 03 lda $032b, x
96F7: 9D 54 02 sta $0254, x
96FA: 18       clc
96FB: 69 10    adc #$10
96FD: 29 E0    and #$e0
96FF: 4A       lsr a
9700: 4A       lsr a
9701: 4A       lsr a
9702: 4A       lsr a
9703: 4A       lsr a
9704: A8       tay
9705: BD 0E 03 lda $030e, x
9708: 29 10    and #$10
970A: D0 08    bne $9714
970C: B1 1B    lda ($1b), y
970E: 9D 61 02 sta $0261, x
9711: 4C 19 97 jmp $9719
9714: B1 1B    lda ($1b), y
9716: 9D E3 02 sta $02e3, x
9719: A0 00    ldy #$00
971B: B9 4A 98 lda $984a, y
971E: 9D A2 02 sta $02a2, x
9721: 8A       txa
9722: 18       clc
9723: 69 0D    adc #$0d
9725: AA       tax
9726: C8       iny
9727: C0 04    cpy #$04
9729: 90 F0    bcc $971b
972B: A6 4C    ldx $4c
972D: A6 4C    ldx $4c
972F: BD F0 02 lda $02f0, x
9732: C9 03    cmp #$03
9734: D0 72    bne $97a8
9736: BD 0E 03 lda $030e, x
9739: 29 10    and #$10
973B: F0 49    beq $9786
973D: BD C0 03 lda $03c0, x
9740: 29 20    and #$20
9742: D0 12    bne $9756
9744: A9 09    lda #$09
9746: 20 B5 A2 jsr $a2b5
9749: A9 22    lda #$22
974B: 20 B8 D7 jsr $d7b8
974E: BD C0 03 lda $03c0, x
9751: 09 20    ora #$20
9753: 9D C0 03 sta $03c0, x
9756: 20 15 A2 jsr $a215
9759: B0 03    bcs $975e
975B: 20 C2 B5 jsr $b5c2
975E: BD 61 02 lda $0261, x
9761: 38       sec
9762: E9 08    sbc #$08
9764: 9D 61 02 sta $0261, x
9767: B0 77    bcs $97e0
9769: A9 00    lda #$00
976B: 9D 61 02 sta $0261, x
976E: BD 0E 03 lda $030e, x
9771: 29 EF    and #$ef
9773: 9D 0E 03 sta $030e, x
9776: BD 1A 03 lda $031a, x
9779: 29 7F    and #$7f
977B: 9D 2F 03 sta $032f, x
977E: A9 24    lda #$24
9780: 9D 1A 03 sta $031a, x
9783: 4C E3 97 jmp $97e3
9786: 20 15 A2 jsr $a215
9789: B0 03    bcs $978e
978B: 20 C2 B5 jsr $b5c2
978E: 20 39 A1 jsr $a139
9791: 20 E4 A0 jsr $a0e4
9794: 90 4A    bcc $97e0
9796: BD 0E 03 lda $030e, x
9799: 29 7F    and #$7f
979B: 09 10    ora #$10
979D: 9D 0E 03 sta $030e, x
97A0: A9 40    lda #$40
97A2: 9D 61 02 sta $0261, x
97A5: 4C E0 97 jmp $97e0
97A8: BD 0E 03 lda $030e, x
97AB: 29 10    and #$10
97AD: F0 10    beq $97bf
97AF: 20 FD A0 jsr $a0fd
97B2: BD 0E 03 lda $030e, x
97B5: 29 10    and #$10
97B7: D0 06    bne $97bf
97B9: BD E3 02 lda $02e3, x
97BC: 9D 61 02 sta $0261, x
97BF: 20 1C 9C jsr $9c1c
97C2: BD F0 02 lda $02f0, x
97C5: F0 06    beq $97cd
97C7: 20 8D 9D jsr $9d8d
97CA: 20 85 BD jsr $bd85
97CD: BD F0 02 lda $02f0, x
97D0: C9 03    cmp #$03
97D2: D0 0C    bne $97e0
97D4: BD D6 02 lda $02d6, x
97D7: D0 07    bne $97e0
97D9: B5 E3    lda $e3, x
97DB: 18       clc
97DC: 69 10    adc #$10
97DE: 95 E3    sta $e3, x
97E0: 20 8D 9D jsr $9d8d
97E3: 4C 89 91 jmp $9189
97E6: A0 01    ldy #$01
97E8: E0 02    cpx #$02
97EA: B0 01    bcs $97ed
97EC: 88       dey
97ED: B9 47 00 lda $0047, y
97F0: 10 07    bpl $97f9
97F2: A9 03    lda #$03
97F4: 85 1B    sta $1b
97F6: 4C 09 98 jmp $9809
97F9: A0 03    ldy #$03
97FB: A5 38    lda $38
97FD: 29 F0    and #$f0
97FF: D0 05    bne $9806
9801: A5 38    lda $38
9803: 29 0F    and #$0f
9805: A8       tay
9806: 98       tya
9807: 85 1B    sta $1b
9809: A5 1B    lda $1b
980B: 0A       asl a
980C: A8       tay
980D: B9 18 98 lda $9818, y
9810: 85 1B    sta $1b
9812: B9 19 98 lda $9819, y
9815: 85 1C    sta $1c
9817: 60       rts

984E: BD 1A 03 lda $031a, x
9851: 30 03    bmi $9856
9853: 20 95 A1 jsr $a195
9856: 20 FD A0 jsr $a0fd
9859: 20 8D 9D jsr $9d8d
985C: 20 1C 9C jsr $9c1c
985F: 20 87 A1 jsr $a187
9862: BD F0 02 lda $02f0, x
9865: C9 02    cmp #$02
9867: F0 06    beq $986f
9869: 20 8D 9D jsr $9d8d
986C: 20 85 BD jsr $bd85
986F: 4C 89 91 jmp $9189
9872: BD 1A 03 lda $031a, x
9875: 30 45    bmi $98bc
9877: 20 95 A1 jsr $a195
987A: BD 0E 03 lda $030e, x
987D: 29 EF    and #$ef
987F: 9D 0E 03 sta $030e, x
9882: 20 E6 97 jsr $97e6
9885: BD 2B 03 lda $032b, x
9888: 9D 54 02 sta $0254, x
988B: 18       clc
988C: 69 10    adc #$10
988E: 29 E0    and #$e0
9890: 4A       lsr a
9891: 4A       lsr a
9892: 4A       lsr a
9893: 4A       lsr a
9894: 4A       lsr a
9895: A8       tay
9896: BD 0E 03 lda $030e, x
9899: 29 10    and #$10
989B: D0 08    bne $98a5
989D: B1 1B    lda ($1b), y
989F: 9D 61 02 sta $0261, x
98A2: 4C AA 98 jmp $98aa
98A5: B1 1B    lda ($1b), y
98A7: 9D E3 02 sta $02e3, x
98AA: A0 00    ldy #$00
98AC: B9 6C 99 lda $996c, y
98AF: 9D A2 02 sta $02a2, x
98B2: 8A       txa
98B3: 18       clc
98B4: 69 0D    adc #$0d
98B6: AA       tax
98B7: C8       iny
98B8: C0 04    cpy #$04
98BA: 90 F0    bcc $98ac
98BC: A6 4C    ldx $4c
98BE: 20 8D 9D jsr $9d8d
98C1: 20 85 BD jsr $bd85
98C4: BD F0 02 lda $02f0, x
98C7: C9 02    cmp #$02
98C9: 90 79    bcc $9944
98CB: BD 0E 03 lda $030e, x
98CE: 29 10    and #$10
98D0: F0 50    beq $9922
98D2: BD C0 03 lda $03c0, x
98D5: 29 20    and #$20
98D7: D0 19    bne $98f2
98D9: BD 1A 03 lda $031a, x
98DC: 38       sec
98DD: E9 13    sbc #$13
98DF: 18       clc
98E0: 69 07    adc #$07
98E2: 20 B5 A2 jsr $a2b5
98E5: A9 22    lda #$22
98E7: 20 B8 D7 jsr $d7b8
98EA: BD C0 03 lda $03c0, x
98ED: 09 20    ora #$20
98EF: 9D C0 03 sta $03c0, x
98F2: 20 15 A2 jsr $a215
98F5: B0 03    bcs $98fa
98F7: 20 C2 B5 jsr $b5c2
98FA: BD 61 02 lda $0261, x
98FD: 38       sec
98FE: E9 04    sbc #$04
9900: 9D 61 02 sta $0261, x
9903: B0 59    bcs $995e
9905: A9 00    lda #$00
9907: 9D 61 02 sta $0261, x
990A: BD 0E 03 lda $030e, x
990D: 29 EF    and #$ef
990F: 9D 0E 03 sta $030e, x
9912: BD 1A 03 lda $031a, x
9915: 29 7F    and #$7f
9917: 9D 2F 03 sta $032f, x
991A: A9 24    lda #$24
991C: 9D 1A 03 sta $031a, x
991F: 4C 61 99 jmp $9961
9922: 20 15 A2 jsr $a215
9925: B0 03    bcs $992a
9927: 20 C2 B5 jsr $b5c2
992A: 20 39 A1 jsr $a139
992D: 20 E4 A0 jsr $a0e4
9930: 90 29    bcc $995b
9932: BD 0E 03 lda $030e, x
9935: 29 7F    and #$7f
9937: 09 10    ora #$10
9939: 9D 0E 03 sta $030e, x
993C: A9 20    lda #$20
993E: 9D 61 02 sta $0261, x
9941: 4C 5E 99 jmp $995e
9944: BD 0E 03 lda $030e, x
9947: 29 10    and #$10
9949: F0 10    beq $995b
994B: 20 FD A0 jsr $a0fd
994E: BD 0E 03 lda $030e, x
9951: 29 10    and #$10
9953: D0 06    bne $995b
9955: BD E3 02 lda $02e3, x
9958: 9D 61 02 sta $0261, x
995B: 20 1C 9C jsr $9c1c
995E: 20 8D 9D jsr $9d8d
9961: 4C 89 91 jmp $9189

9970: BD 1A 03 lda $031a, x
9973: 30 03    bmi $9978
9975: 20 95 A1 jsr $a195
9978: 20 8D 9D jsr $9d8d
997B: 20 1C 9C jsr $9c1c
997E: 20 87 A1 jsr $a187
9981: 20 8D 9D jsr $9d8d
9984: 20 85 BD jsr $bd85
9987: 4C 89 91 jmp $9189
998A: BD 1A 03 lda $031a, x
998D: 30 0E    bmi $999d
998F: 20 95 A1 jsr $a195
9992: A9 9D    lda #$9d
9994: 85 00    sta $00
9996: A9 99    lda #$99
9998: 85 01    sta $01
999A: 4C 0E 93 jmp $930e
999D: 20 8D 9D jsr $9d8d
99A0: BD 3A 02 lda $023a, x
99A3: 09 80    ora #$80
99A5: 9D 3A 02 sta $023a, x
99A8: 4C 89 91 jmp $9189
99AB: BD 1A 03 lda $031a, x
99AE: 30 0E    bmi $99be
99B0: 20 95 A1 jsr $a195
99B3: A9 BE    lda #$be
99B5: 85 00    sta $00
99B7: A9 99    lda #$99
99B9: 85 01    sta $01
99BB: 4C 0E 93 jmp $930e
99BE: BD 2B 03 lda $032b, x
99C1: 9D 54 02 sta $0254, x
99C4: A9 10    lda #$10
99C6: 9D 61 02 sta $0261, x
99C9: 20 15 A2 jsr $a215
99CC: B0 03    bcs $99d1
99CE: 20 C2 B5 jsr $b5c2
99D1: 20 8D 9D jsr $9d8d
99D4: BD 3A 02 lda $023a, x
99D7: 09 80    ora #$80
99D9: 9D 3A 02 sta $023a, x
99DC: 4C 89 91 jmp $9189
99DF: BD 1A 03 lda $031a, x
99E2: 30 0E    bmi $99f2
99E4: 20 95 A1 jsr $a195
99E7: A9 F2    lda #$f2
99E9: 85 00    sta $00
99EB: A9 99    lda #$99
99ED: 85 01    sta $01
99EF: 4C 0E 93 jmp $930e
99F2: 20 8D 9D jsr $9d8d
99F5: BD F0 02 lda $02f0, x
99F8: C9 02    cmp #$02
99FA: D0 06    bne $9a02
99FC: 20 8D 9D jsr $9d8d
99FF: 20 85 BD jsr $bd85
9A02: BD 3A 02 lda $023a, x
9A05: 09 80    ora #$80
9A07: 9D 3A 02 sta $023a, x
9A0A: BD F0 02 lda $02f0, x
9A0D: C9 02    cmp #$02
9A0F: D0 0B    bne $9a1c
9A11: BD 0E 03 lda $030e, x
9A14: 29 F7    and #$f7
9A16: 9D 0E 03 sta $030e, x
9A19: 4C 1F 9A jmp $9a1f
9A1C: 20 1C 9C jsr $9c1c
9A1F: 4C 89 91 jmp $9189
9A22: BD 1A 03 lda $031a, x
9A25: 30 16    bmi $9a3d
9A27: 20 95 A1 jsr $a195
9A2A: BD 0E 03 lda $030e, x
9A2D: 09 04    ora #$04
9A2F: 9D 0E 03 sta $030e, x
9A32: A9 3D    lda #$3d
9A34: 85 00    sta $00
9A36: A9 9A    lda #$9a
9A38: 85 01    sta $01
9A3A: 4C 0E 93 jmp $930e
9A3D: 20 8D 9D jsr $9d8d
9A40: 20 1C 9C jsr $9c1c
9A43: 20 87 A1 jsr $a187
9A46: BD F0 02 lda $02f0, x
9A49: C9 02    cmp #$02
9A4B: D0 08    bne $9a55
9A4D: BD D6 02 lda $02d6, x
9A50: F0 03    beq $9a55
9A52: 20 85 BD jsr $bd85
9A55: 4C 89 91 jmp $9189
9A58: BD 1A 03 lda $031a, x
9A5B: 30 0B    bmi $9a68
9A5D: 20 95 A1 jsr $a195
9A60: BD 0E 03 lda $030e, x
9A63: 09 04    ora #$04
9A65: 9D 0E 03 sta $030e, x
9A68: BD F0 02 lda $02f0, x
9A6B: D0 2B    bne $9a98
9A6D: FE D6 02 inc $02d6, x
9A70: BD D6 02 lda $02d6, x
9A73: C9 10    cmp #$10
9A75: 90 41    bcc $9ab8
9A77: A9 00    lda #$00
9A79: 9D D6 02 sta $02d6, x
9A7C: BD F0 02 lda $02f0, x
9A7F: 49 01    eor #$01
9A81: 9D F0 02 sta $02f0, x
9A84: A0 00    ldy #$00
9A86: B9 BE 9A lda $9abe, y
9A89: 9D 6E 02 sta $026e, x
9A8C: 8A       txa
9A8D: 18       clc
9A8E: 69 0D    adc #$0d
9A90: AA       tax
9A91: C8       iny
9A92: C0 08    cpy #$08
9A94: 90 F0    bcc $9a86
9A96: A6 4C    ldx $4c
9A98: 20 12 B6 jsr $b612
9A9B: BD 0E 03 lda $030e, x
9A9E: 09 80    ora #$80
9AA0: 9D 0E 03 sta $030e, x
9AA3: 20 E4 A0 jsr $a0e4
9AA6: 90 10    bcc $9ab8
9AA8: BD F0 02 lda $02f0, x
9AAB: 49 01    eor #$01
9AAD: 9D F0 02 sta $02f0, x
9AB0: BD 0E 03 lda $030e, x
9AB3: 29 7F    and #$7f
9AB5: 9D 0E 03 sta $030e, x
9AB8: 20 8D 9D jsr $9d8d
9ABB: 4C 89 91 jmp $9189

9AC6: BD 1A 03 lda $031a, x
9AC9: 30 03    bmi $9ace
9ACB: 20 95 A1 jsr $a195
9ACE: 20 8D 9D jsr $9d8d
9AD1: 4C 89 91 jmp $9189
9AD4: BD 1A 03 lda $031a, x
9AD7: 30 06    bmi $9adf
9AD9: 20 95 A1 jsr $a195
9ADC: 20 A6 AC jsr $aca6
9ADF: 20 8D 9D jsr $9d8d
9AE2: 4C 89 91 jmp $9189
9AE5: BD 1A 03 lda $031a, x
9AE8: 30 08    bmi $9af2
9AEA: 20 95 A1 jsr $a195
9AED: A9 03    lda #$03
9AEF: 20 B5 A2 jsr $a2b5
9AF2: 20 8D 9D jsr $9d8d
9AF5: 20 1C 9C jsr $9c1c
9AF8: 20 87 A1 jsr $a187
9AFB: 4C 89 91 jmp $9189
9AFE: BD 1A 03 lda $031a, x
9B01: 30 03    bmi $9b06
9B03: 20 95 A1 jsr $a195
9B06: 20 8D 9D jsr $9d8d
9B09: 20 1C 9C jsr $9c1c
9B0C: 4C 89 91 jmp $9189
9B0F: BD 1A 03 lda $031a, x
9B12: 30 5B    bmi $9b6f
9B14: 20 95 A1 jsr $a195
9B17: BD 0E 03 lda $030e, x
9B1A: 09 40    ora #$40
9B1C: 9D 0E 03 sta $030e, x
9B1F: BD 54 02 lda $0254, x
9B22: 18       clc
9B23: 69 10    adc #$10
9B25: 29 E0    and #$e0
9B27: 4A       lsr a
9B28: 4A       lsr a
9B29: 4A       lsr a
9B2A: 4A       lsr a
9B2B: 4A       lsr a
9B2C: A8       tay
9B2D: B9 AA 9B lda $9baa, y
9B30: 9D 61 02 sta $0261, x
9B33: A0 00    ldy #$00
9B35: BD 33 03 lda $0333, x
9B38: F0 02    beq $9b3c
9B3A: A0 04    ldy #$04
9B3C: A9 03    lda #$03
9B3E: 85 00    sta $00
9B40: B9 A2 9B lda $9ba2, y
9B43: 9D A2 02 sta $02a2, x
9B46: C8       iny
9B47: 8A       txa
9B48: 18       clc
9B49: 69 0D    adc #$0d
9B4B: AA       tax
9B4C: C6 00    dec $00
9B4E: 10 F0    bpl $9b40
9B50: A6 4C    ldx $4c
9B52: BD 54 02 lda $0254, x
9B55: 10 03    bpl $9b5a
9B57: 20 69 A1 jsr $a169
9B5A: BD 2F 03 lda $032f, x
9B5D: C9 0F    cmp #$0f
9B5F: F0 05    beq $9b66
9B61: A9 01    lda #$01
9B63: 9D F0 02 sta $02f0, x
9B66: BD 54 02 lda $0254, x
9B69: 18       clc
9B6A: 69 80    adc #$80
9B6C: 9D C4 03 sta $03c4, x
9B6F: BD F0 02 lda $02f0, x
9B72: F0 20    beq $9b94
9B74: 20 15 A2 jsr $a215
9B77: B0 03    bcs $9b7c
9B79: 20 C2 B5 jsr $b5c2
9B7C: 20 39 A1 jsr $a139
9B7F: 20 E4 A0 jsr $a0e4
9B82: 90 10    bcc $9b94
9B84: BD 1A 03 lda $031a, x
9B87: 29 7F    and #$7f
9B89: 9D 2F 03 sta $032f, x
9B8C: A9 23    lda #$23
9B8E: 9D 1A 03 sta $031a, x
9B91: 4C 9F 9B jmp $9b9f
9B94: 20 8D 9D jsr $9d8d
9B97: BD F0 02 lda $02f0, x
9B9A: D0 03    bne $9b9f
9B9C: 20 1C 9C jsr $9c1c
9B9F: 4C 89 91 jmp $9189

9BB2: BD 1A 03 lda $031a, x
9BB5: 30 08    bmi $9bbf
9BB7: 20 95 A1 jsr $a195
9BBA: A9 23    lda #$23
9BBC: 20 B8 D7 jsr $d7b8
9BBF: 20 8D 9D jsr $9d8d
9BC2: 20 1C 9C jsr $9c1c
9BC5: BD D6 02 lda $02d6, x
9BC8: D0 0D    bne $9bd7
9BCA: BD 1A 03 lda $031a, x
9BCD: 29 7F    and #$7f
9BCF: 9D 2F 03 sta $032f, x
9BD2: A9 24    lda #$24
9BD4: 9D 1A 03 sta $031a, x
9BD7: 4C 89 91 jmp $9189
9BDA: BD 1A 03 lda $031a, x
9BDD: 30 03    bmi $9be2
9BDF: 20 95 A1 jsr $a195
9BE2: 20 8D 9D jsr $9d8d
9BE5: 20 1C 9C jsr $9c1c
9BE8: 20 87 A1 jsr $a187
9BEB: BD 1A 03 lda $031a, x
9BEE: 30 08    bmi $9bf8
9BF0: BD 0E 03 lda $030e, x
9BF3: 29 BF    and #$bf
9BF5: 9D 0E 03 sta $030e, x
9BF8: 4C 89 91 jmp $9189
9BFB: BD 1A 03 lda $031a, x
9BFE: 30 16    bmi $9c16
9C00: 20 95 A1 jsr $a195
9C03: BD 0E 03 lda $030e, x
9C06: 29 EF    and #$ef
9C08: 9D 0E 03 sta $030e, x
9C0B: A9 16    lda #$16
9C0D: 85 00    sta $00
9C0F: A9 9C    lda #$9c
9C11: 85 01    sta $01
9C13: 4C F0 92 jmp $92f0
9C16: 20 8D 9D jsr $9d8d
9C19: 4C 89 91 jmp $9189
9C1C: BD 1A 03 lda $031a, x
9C1F: 29 7F    and #$7f
9C21: 0A       asl a
9C22: 0A       asl a
9C23: A8       tay
9C24: BD C0 03 lda $03c0, x
9C27: 10 02    bpl $9c2b
9C29: C8       iny
9C2A: C8       iny
9C2B: B9 AB 9C lda $9cab, y
9C2E: 85 1B    sta $1b
9C30: B9 AC 9C lda $9cac, y
9C33: 85 1C    sta $1c
9C35: BC F0 02 ldy $02f0, x
9C38: B1 1B    lda ($1b), y
9C3A: 85 1B    sta $1b
9C3C: FE D6 02 inc $02d6, x
9C3F: BD D6 02 lda $02d6, x
9C42: C5 1B    cmp $1b
9C44: 90 3D    bcc $9c83
9C46: A9 00    lda #$00
9C48: 9D D6 02 sta $02d6, x
9C4B: FE F0 02 inc $02f0, x
9C4E: BD F0 02 lda $02f0, x
9C51: DD FD 02 cmp $02fd, x
9C54: 90 2D    bcc $9c83
9C56: A9 00    lda #$00
9C58: 9D F0 02 sta $02f0, x
9C5B: BD 1A 03 lda $031a, x
9C5E: 29 7F    and #$7f
9C60: C9 21    cmp #$21
9C62: F0 04    beq $9c68
9C64: C9 25    cmp #$25
9C66: D0 03    bne $9c6b
9C68: FE E3 02 inc $02e3, x
9C6B: BD 1A 03 lda $031a, x
9C6E: 29 7F    and #$7f
9C70: A8       tay
9C71: B9 84 9C lda $9c84, y
9C74: D0 0D    bne $9c83
9C76: BD 1A 03 lda $031a, x
9C79: 29 7F    and #$7f
9C7B: 9D 2F 03 sta $032f, x
9C7E: A9 01    lda #$01
9C80: 9D 1A 03 sta $031a, x
9C83: 60       rts

9D8D: BD 1A 03 lda $031a, x
9D90: 29 7F    and #$7f
9D92: 0A       asl a
9D93: 0A       asl a
9D94: A8       tay
9D95: BD C0 03 lda $03c0, x
9D98: 10 02    bpl $9d9c
9D9A: C8       iny
9D9B: C8       iny
9D9C: B9 10 9E lda $9e10, y
9D9F: 85 1B    sta $1b
9DA1: B9 11 9E lda $9e11, y
9DA4: 85 1C    sta $1c
9DA6: BD C4 03 lda $03c4, x
9DA9: 18       clc
9DAA: 69 10    adc #$10
9DAC: 4A       lsr a
9DAD: 4A       lsr a
9DAE: 4A       lsr a
9DAF: 4A       lsr a
9DB0: 4A       lsr a
9DB1: F0 19    beq $9dcc
9DB3: 38       sec
9DB4: E9 01    sbc #$01
9DB6: 85 1D    sta $1d
9DB8: BD FD 02 lda $02fd, x
9DBB: 85 1E    sta $1e
9DBD: 85 1F    sta $1f
9DBF: A5 1E    lda $1e
9DC1: 18       clc
9DC2: 65 1F    adc $1f
9DC4: 85 1E    sta $1e
9DC6: C6 1D    dec $1d
9DC8: D0 F5    bne $9dbf
9DCA: A5 1E    lda $1e
9DCC: 18       clc
9DCD: 7D F0 02 adc $02f0, x
9DD0: A8       tay
9DD1: B1 1B    lda ($1b), y
9DD3: 85 1B    sta $1b
9DD5: B5 73    lda $73, x
9DD7: 85 20    sta $20
9DD9: BD C4 03 lda $03c4, x
9DDC: 18       clc
9DDD: 69 10    adc #$10
9DDF: 29 E0    and #$e0
9DE1: F0 04    beq $9de7
9DE3: C9 80    cmp #$80
9DE5: D0 0B    bne $9df2
9DE7: B5 73    lda $73, x
9DE9: 29 80    and #$80
9DEB: 05 1B    ora $1b
9DED: 95 73    sta $73, x
9DEF: 4C 01 9E jmp $9e01
9DF2: BD C4 03 lda $03c4, x
9DF5: 10 06    bpl $9dfd
9DF7: A5 1B    lda $1b
9DF9: 09 80    ora #$80
9DFB: 85 1B    sta $1b
9DFD: A5 1B    lda $1b
9DFF: 95 73    sta $73, x
9E01: B5 73    lda $73, x
9E03: C5 20    cmp $20
9E05: F0 08    beq $9e0f
9E07: BD 3A 02 lda $023a, x
9E0A: 09 01    ora #$01
9E0C: 9D 3A 02 sta $023a, x
9E0F: 60       rts

A0E4: B5 F1    lda $f1, x
A0E6: F0 13    beq $a0fb
A0E8: BD 0E 03 lda $030e, x
A0EB: 29 7F    and #$7f
A0ED: 9D 0E 03 sta $030e, x
A0F0: A9 00    lda #$00
A0F2: 95 D5    sta $d5, x
A0F4: 95 E3    sta $e3, x
A0F6: 95 F1    sta $f1, x
A0F8: 38       sec
A0F9: B0 01    bcs $a0fc
A0FB: 18       clc
A0FC: 60       rts
A0FD: BD 0E 03 lda $030e, x
A100: 29 10    and #$10
A102: F0 34    beq $a138
A104: BD C0 03 lda $03c0, x
A107: 29 20    and #$20
A109: D0 0D    bne $a118
A10B: A9 00    lda #$00
A10D: 20 B5 A2 jsr $a2b5
A110: BD C0 03 lda $03c0, x
A113: 09 20    ora #$20
A115: 9D C0 03 sta $03c0, x
A118: 20 15 A2 jsr $a215
A11B: B0 03    bcs $a120
A11D: 20 C2 B5 jsr $b5c2
A120: BD 61 02 lda $0261, x
A123: 38       sec
A124: E9 10    sbc #$10
A126: 9D 61 02 sta $0261, x
A129: B0 0D    bcs $a138
A12B: A9 00    lda #$00
A12D: 9D 61 02 sta $0261, x
A130: BD 0E 03 lda $030e, x
A133: 29 EF    and #$ef
A135: 9D 0E 03 sta $030e, x
A138: 60       rts
A139: BD A2 02 lda $02a2, x
A13C: 38       sec
A13D: FD BC 02 sbc $02bc, x
A140: 9D A2 02 sta $02a2, x
A143: BD AF 02 lda $02af, x
A146: FD C9 02 sbc $02c9, x
A149: 9D AF 02 sta $02af, x
A14C: B5 D5    lda $d5, x
A14E: 18       clc
A14F: 7D A2 02 adc $02a2, x
A152: 95 D5    sta $d5, x
A154: BD AF 02 lda $02af, x
A157: 08       php
A158: 75 E3    adc $e3, x
A15A: 95 E3    sta $e3, x
A15C: B5 F1    lda $f1, x
A15E: 69 00    adc #$00
A160: 28       plp
A161: 10 03    bpl $a166
A163: 18       clc
A164: 69 FF    adc #$ff
A166: 95 F1    sta $f1, x
A168: 60       rts
A169: BD 6E 02 lda $026e, x
A16C: 49 FF    eor #$ff
A16E: 18       clc
A16F: 69 01    adc #$01
A171: 9D 6E 02 sta $026e, x
A174: 08       php
A175: BD 7B 02 lda $027b, x
A178: 49 FF    eor #$ff
A17A: 9D 7B 02 sta $027b, x
A17D: 28       plp
A17E: BD 7B 02 lda $027b, x
A181: 69 00    adc #$00
A183: 9D 7B 02 sta $027b, x
A186: 60       rts
A187: BD 1A 03 lda $031a, x
A18A: 30 08    bmi $a194
A18C: BD 0E 03 lda $030e, x
A18F: 29 FB    and #$fb
A191: 9D 0E 03 sta $030e, x
A194: 60       rts
A195: 8A       txa
A196: 18       clc
A197: 69 07    adc #$07
A199: A8       tay
A19A: B9 65 00 lda $0065, y
A19D: C9 30    cmp #$30
A19F: D0 05    bne $a1a6
A1A1: A9 00    lda #$00
A1A3: 99 1A 03 sta $031a, y
A1A6: A9 00    lda #$00
A1A8: 9D C0 03 sta $03c0, x
A1AB: 9D D6 02 sta $02d6, x
A1AE: 9D E3 02 sta $02e3, x
A1B1: 9D F0 02 sta $02f0, x
A1B4: 9D FD 02 sta $02fd, x
A1B7: BD 3A 02 lda $023a, x
A1BA: 09 01    ora #$01
A1BC: 9D 3A 02 sta $023a, x
A1BF: BC 1A 03 ldy $031a, x
A1C2: B9 EE A1 lda $a1ee, y
A1C5: 9D FD 02 sta $02fd, x
A1C8: 98       tya
A1C9: 09 80    ora #$80
A1CB: 9D 1A 03 sta $031a, x
A1CE: BD 0A 03 lda $030a, x
A1D1: 29 FD    and #$fd
A1D3: 9D 0A 03 sta $030a, x
A1D6: BD 0E 03 lda $030e, x
A1D9: 29 EF    and #$ef
A1DB: 9D 0E 03 sta $030e, x
A1DE: BD 2F 03 lda $032f, x
A1E1: C9 09    cmp #$09
A1E3: D0 08    bne $a1ed
A1E5: BD 0E 03 lda $030e, x
A1E8: 09 10    ora #$10
A1EA: 9D 0E 03 sta $030e, x
A1ED: 60       rts

A215: B5 8F    lda $8f, x
A217: 48       pha
A218: B5 9D    lda $9d, x
A21A: 48       pha
A21B: B5 B9    lda $b9, x
A21D: 48       pha
A21E: B5 C7    lda $c7, x
A220: 48       pha
A221: BD 54 02 lda $0254, x
A224: 18       clc
A225: 69 10    adc #$10
A227: 29 E0    and #$e0
A229: 4A       lsr a
A22A: 4A       lsr a
A22B: 4A       lsr a
A22C: 4A       lsr a
A22D: A8       tay
A22E: B9 9C A2 lda $a29c, y
A231: 08       php
A232: 18       clc
A233: 75 8F    adc $8f, x
A235: 95 8F    sta $8f, x
A237: B5 9D    lda $9d, x
A239: 69 00    adc #$00
A23B: 28       plp
A23C: 10 03    bpl $a241
A23E: 18       clc
A23F: 69 FF    adc #$ff
A241: 95 9D    sta $9d, x
A243: B9 9D A2 lda $a29d, y
A246: 08       php
A247: 18       clc
A248: 75 B9    adc $b9, x
A24A: 95 B9    sta $b9, x
A24C: B5 C7    lda $c7, x
A24E: 69 00    adc #$00
A250: 28       plp
A251: 10 03    bpl $a256
A253: 18       clc
A254: 69 FF    adc #$ff
A256: 95 C7    sta $c7, x
A258: A5 4C    lda $4c
A25A: 20 1F B7 jsr $b71f
A25D: 85 1B    sta $1b
A25F: 68       pla
A260: 95 C7    sta $c7, x
A262: 68       pla
A263: 95 B9    sta $b9, x
A265: 68       pla
A266: 95 9D    sta $9d, x
A268: 68       pla
A269: 95 8F    sta $8f, x
A26B: E0 02    cpx #$02
A26D: B0 08    bcs $a277
A26F: A5 1B    lda $1b
A271: C9 0F    cmp #$0f
A273: B0 0C    bcs $a281
A275: 90 23    bcc $a29a
A277: A5 1B    lda $1b
A279: C9 1F    cmp #$1f
A27B: B0 04    bcs $a281
A27D: C9 10    cmp #$10
A27F: B0 19    bcs $a29a
A281: A9 00    lda #$00
A283: 9D 6E 02 sta $026e, x
A286: 9D 7B 02 sta $027b, x
A289: 9D 88 02 sta $0288, x
A28C: 9D 95 02 sta $0295, x
A28F: BD 0A 03 lda $030a, x
A292: 09 01    ora #$01
A294: 9D 0A 03 sta $030a, x
A297: 38       sec
A298: B0 01    bcs $a29b
A29A: 18       clc
A29B: 60       rts

A2AC: A5 4C    lda $4c
A2AE: 20 1F B7 jsr $b71f
A2B1: 9D 73 03 sta $0373, x
A2B4: 60       rts
A2B5: 85 1B    sta $1b
A2B7: 8A       txa
A2B8: 48       pha
A2B9: A5 4C    lda $4c
A2BB: 18       clc
A2BC: 69 07    adc #$07
A2BE: AA       tax
A2BF: BD 1A 03 lda $031a, x
A2C2: 10 0E    bpl $a2d2
A2C4: B5 65    lda $65, x
A2C6: C9 1C    cmp #$1c
A2C8: F0 13    beq $a2dd
A2CA: C9 27    cmp #$27
A2CC: F0 0F    beq $a2dd
A2CE: C9 30    cmp #$30
A2D0: F0 0B    beq $a2dd
A2D2: A5 1B    lda $1b
A2D4: 09 80    ora #$80
A2D6: 9D 1A 03 sta $031a, x
A2D9: A9 1A    lda #$1a
A2DB: 95 65    sta $65, x
A2DD: 68       pla
A2DE: AA       tax
A2DF: 60       rts
A2E0: A9 07    lda #$07
A2E2: 85 4C    sta $4c
A2E4: A6 4C    ldx $4c
A2E6: BD 1A 03 lda $031a, x
A2E9: 10 1A    bpl $a305
A2EB: B5 65    lda $65, x
A2ED: C9 1A    cmp #$1a
A2EF: D0 14    bne $a305
A2F1: BD 1A 03 lda $031a, x
A2F4: 29 3F    and #$3f
A2F6: 0A       asl a
A2F7: A8       tay
A2F8: B9 0E A3 lda table_a30e, y
A2FB: 85 00    sta $00
A2FD: B9 0F A3 lda $a30f, y
A300: 85 01    sta $01
A302: 6C 00 00 jmp ($0000)        ; [indirect_jump]
A305: E6 4C    inc $4c
A307: A5 4C    lda $4c
A309: C9 0C    cmp #$0c
A30B: 90 D7    bcc $a2e4
A30D: 60       rts

A328: A5 4C    lda $4c
A32A: 38       sec
A32B: E9 07    sbc #$07
A32D: A8       tay
A32E: BD 1A 03 lda $031a, x
A331: 29 3F    and #$3f
A333: 0A       asl a
A334: AA       tax
A335: BD D3 A3 lda table_a3d3, x
A338: 85 1B    sta $1b
A33A: BD D4 A3 lda $a3d4, x
A33D: 85 1C    sta $1c
A33F: A6 4C    ldx $4c
A341: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
A344: BD 1A 03 lda $031a, x
A347: 29 40    and #$40
A349: D0 06    bne $a351
A34B: 20 E6 A5 jsr $a5e6
A34E: 20 24 A4 jsr $a424
A351: BD 1A 03 lda $031a, x
A354: 29 3F    and #$3f
A356: A8       tay
A357: B9 A4 A4 lda $a4a4, y
A35A: D0 03    bne $a35f
A35C: 20 24 A4 jsr $a424
A35F: B5 73    lda $73, x
A361: 85 1B    sta $1b
A363: A0 08    ldy #$08
A365: BD 1A 03 lda $031a, x
A368: 29 3F    and #$3f
A36A: C9 01    cmp #$01
A36C: D0 02    bne $a370
A36E: A0 04    ldy #$04
A370: 98       tya
A371: 18       clc
A372: 7D F0 02 adc $02f0, x
A375: 95 73    sta $73, x
A377: A5 4C    lda $4c
A379: 38       sec
A37A: E9 07    sbc #$07
A37C: A8       tay
A37D: B9 73 00 lda $0073, y
A380: 10 06    bpl $a388
A382: B5 73    lda $73, x
A384: 09 80    ora #$80
A386: 95 73    sta $73, x
A388: B5 73    lda $73, x
A38A: C5 1B    cmp $1b
A38C: F0 08    beq $a396
A38E: BD 3A 02 lda $023a, x
A391: 09 01    ora #$01
A393: 9D 3A 02 sta $023a, x
A396: 20 39 A6 jsr $a639
A399: BD 1A 03 lda $031a, x
A39C: 29 3F    and #$3f
A39E: A8       tay
A39F: B9 AB A4 lda $a4ab, y
A3A2: 85 1B    sta $1b
A3A4: FE D6 02 inc $02d6, x
A3A7: BD D6 02 lda $02d6, x
A3AA: C5 1B    cmp $1b
A3AC: 90 22    bcc $a3d0
A3AE: A9 00    lda #$00
A3B0: 9D D6 02 sta $02d6, x
A3B3: FE F0 02 inc $02f0, x
A3B6: BD F0 02 lda $02f0, x
A3B9: C9 04    cmp #$04
A3BB: 90 13    bcc $a3d0
A3BD: A9 00    lda #$00
A3BF: 9D F0 02 sta $02f0, x
A3C2: BD 1A 03 lda $031a, x
A3C5: 29 3F    and #$3f
A3C7: A8       tay
A3C8: B9 A4 A4 lda $a4a4, y
A3CB: F0 03    beq $a3d0
A3CD: 20 29 A6 jsr $a629
A3D0: 4C 05 A3 jmp $a305

A3E1: B9 0E 03 lda $030e, y
A3E4: 29 10    and #$10
A3E6: D0 03    bne $a3eb
A3E8: 20 29 A6 jsr $a629
A3EB: 4C 44 A3 jmp $a344
A3EE: B9 1A 03 lda $031a, y
A3F1: 29 7F    and #$7f
A3F3: C9 09    cmp #$09
A3F5: F0 03    beq $a3fa
A3F7: 20 29 A6 jsr $a629
A3FA: 4C 44 A3 jmp $a344
A3FD: 4C 44 A3 jmp $a344
A400: 4C 44 A3 jmp $a344
A403: 4C 44 A3 jmp $a344
A406: B9 1A 03 lda $031a, y
A409: 29 7F    and #$7f
A40B: C9 1D    cmp #$1d
A40D: F0 03    beq $a412
A40F: 20 29 A6 jsr $a629
A412: 4C 44 A3 jmp $a344
A415: B9 1A 03 lda $031a, y
A418: 29 7F    and #$7f
A41A: C9 25    cmp #$25
A41C: F0 03    beq $a421
A41E: 20 29 A6 jsr $a629
A421: 4C 44 A3 jmp $a344
A424: 20 03 A6 jsr $a603
A427: BD 1A 03 lda $031a, x
A42A: 29 3F    and #$3f
A42C: 85 1B    sta $1b
A42E: 0A       asl a
A42F: 18       clc
A430: 65 1B    adc $1b
A432: A8       tay
A433: B9 8F A4 lda $a48f, y
A436: 85 1B    sta $1b
A438: 98       tya
A439: 48       pha
A43A: A5 4C    lda $4c
A43C: 38       sec
A43D: E9 07    sbc #$07
A43F: A8       tay
A440: B9 73 00 lda $0073, y
A443: 10 09    bpl $a44e
A445: A5 1B    lda $1b
A447: 49 FF    eor #$ff
A449: 18       clc
A44A: 69 01    adc #$01
A44C: 85 1B    sta $1b
A44E: 68       pla
A44F: A8       tay
A450: A5 1B    lda $1b
A452: 08       php
A453: 18       clc
A454: 75 8F    adc $8f, x
A456: 95 8F    sta $8f, x
A458: B5 9D    lda $9d, x
A45A: 69 00    adc #$00
A45C: 28       plp
A45D: 10 03    bpl $a462
A45F: 18       clc
A460: 69 FF    adc #$ff
A462: 95 9D    sta $9d, x
A464: B9 90 A4 lda $a490, y
A467: 08       php
A468: 18       clc
A469: 75 B9    adc $b9, x
A46B: 95 B9    sta $b9, x
A46D: B5 C7    lda $c7, x
A46F: 69 00    adc #$00
A471: 28       plp
A472: 10 03    bpl $a477
A474: 18       clc
A475: 69 FF    adc #$ff
A477: 95 C7    sta $c7, x
A479: B9 91 A4 lda $a491, y
A47C: 08       php
A47D: 18       clc
A47E: 75 E3    adc $e3, x
A480: 95 E3    sta $e3, x
A482: B5 F1    lda $f1, x
A484: 69 00    adc #$00
A486: 28       plp
A487: 10 03    bpl $a48c
A489: 18       clc
A48A: 69 FF    adc #$ff
A48C: 95 F1    sta $f1, x
A48E: 60       rts

A4B2: BD 1A 03 lda $031a, x
A4B5: 29 40    and #$40
A4B7: D0 03    bne $a4bc
A4B9: 20 E6 A5 jsr $a5e6
A4BC: 20 03 A6 jsr $a603
A4BF: B5 8F    lda $8f, x
A4C1: 18       clc
A4C2: 69 04    adc #$04
A4C4: 95 8F    sta $8f, x
A4C6: B5 9D    lda $9d, x
A4C8: 69 00    adc #$00
A4CA: 95 9D    sta $9d, x
A4CC: B5 B9    lda $b9, x
A4CE: 18       clc
A4CF: 69 01    adc #$01
A4D1: 95 B9    sta $b9, x
A4D3: B5 E3    lda $e3, x
A4D5: 18       clc
A4D6: 69 00    adc #$00
A4D8: 95 E3    sta $e3, x
A4DA: B5 73    lda $73, x
A4DC: 85 1B    sta $1b
A4DE: A9 13    lda #$13
A4E0: 18       clc
A4E1: 7D F0 02 adc $02f0, x
A4E4: 95 73    sta $73, x
A4E6: C5 1B    cmp $1b
A4E8: F0 08    beq $a4f2
A4EA: BD 3A 02 lda $023a, x
A4ED: 09 01    ora #$01
A4EF: 9D 3A 02 sta $023a, x
A4F2: 20 39 A6 jsr $a639
A4F5: FE D6 02 inc $02d6, x
A4F8: BD D6 02 lda $02d6, x
A4FB: C9 02    cmp #$02
A4FD: 90 12    bcc $a511
A4FF: A9 00    lda #$00
A501: 9D D6 02 sta $02d6, x
A504: FE F0 02 inc $02f0, x
A507: BD F0 02 lda $02f0, x
A50A: C9 03    cmp #$03
A50C: 90 03    bcc $a511
A50E: 20 29 A6 jsr $a629
A511: 4C 05 A3 jmp $a305
A514: A5 4C    lda $4c
A516: 38       sec
A517: E9 07    sbc #$07
A519: A8       tay
A51A: B9 1A 03 lda $031a, y
A51D: 29 7F    and #$7f
A51F: C9 10    cmp #$10
A521: F0 0A    beq $a52d
A523: C9 11    cmp #$11
A525: F0 06    beq $a52d
A527: 20 29 A6 jsr $a629
A52A: 4C 8E A5 jmp $a58e
A52D: BD 1A 03 lda $031a, x
A530: 29 40    and #$40
A532: D0 03    bne $a537
A534: 20 E6 A5 jsr $a5e6
A537: 20 03 A6 jsr $a603
A53A: B5 B9    lda $b9, x
A53C: 18       clc
A53D: 69 01    adc #$01
A53F: 95 B9    sta $b9, x
A541: B5 E3    lda $e3, x
A543: 18       clc
A544: 69 08    adc #$08
A546: 95 E3    sta $e3, x
A548: B5 73    lda $73, x
A54A: 85 1B    sta $1b
A54C: A9 0C    lda #$0c
A54E: 18       clc
A54F: 7D F0 02 adc $02f0, x
A552: 95 73    sta $73, x
A554: B9 C4 03 lda $03c4, y
A557: 10 06    bpl $a55f
A559: B5 73    lda $73, x
A55B: 09 80    ora #$80
A55D: 95 73    sta $73, x
A55F: B5 73    lda $73, x
A561: C5 1B    cmp $1b
A563: F0 08    beq $a56d
A565: BD 3A 02 lda $023a, x
A568: 09 01    ora #$01
A56A: 9D 3A 02 sta $023a, x
A56D: 20 39 A6 jsr $a639
A570: FE D6 02 inc $02d6, x
A573: BD D6 02 lda $02d6, x
A576: C9 02    cmp #$02
A578: 90 14    bcc $a58e
A57A: A9 00    lda #$00
A57C: 9D D6 02 sta $02d6, x
A57F: FE F0 02 inc $02f0, x
A582: BD F0 02 lda $02f0, x
A585: C9 03    cmp #$03
A587: 90 05    bcc $a58e
A589: A9 00    lda #$00
A58B: 9D F0 02 sta $02f0, x
A58E: 4C 05 A3 jmp $a305
A591: BD 1A 03 lda $031a, x
A594: 29 40    and #$40
A596: D0 06    bne $a59e
A598: 20 E6 A5 jsr $a5e6
A59B: 20 03 A6 jsr $a603
A59E: B5 73    lda $73, x
A5A0: 85 1B    sta $1b
A5A2: A0 00    ldy #$00
A5A4: BD 1A 03 lda $031a, x
A5A7: 29 3F    and #$3f
A5A9: C9 0B    cmp #$0b
A5AB: D0 02    bne $a5af
A5AD: A0 08    ldy #$08
A5AF: 98       tya
A5B0: 18       clc
A5B1: 7D F0 02 adc $02f0, x
A5B4: 95 73    sta $73, x
A5B6: C5 1B    cmp $1b
A5B8: F0 08    beq $a5c2
A5BA: BD 3A 02 lda $023a, x
A5BD: 09 01    ora #$01
A5BF: 9D 3A 02 sta $023a, x
A5C2: 20 39 A6 jsr $a639
A5C5: FE D6 02 inc $02d6, x
A5C8: BD D6 02 lda $02d6, x
A5CB: C9 02    cmp #$02
A5CD: 90 14    bcc $a5e3
A5CF: A9 00    lda #$00
A5D1: 9D D6 02 sta $02d6, x
A5D4: FE F0 02 inc $02f0, x
A5D7: BD F0 02 lda $02f0, x
A5DA: C9 04    cmp #$04
A5DC: 90 05    bcc $a5e3
A5DE: A9 00    lda #$00
A5E0: 9D 1A 03 sta $031a, x
A5E3: 4C 05 A3 jmp $a305
A5E6: A9 00    lda #$00
A5E8: 9D D6 02 sta $02d6, x
A5EB: 9D F0 02 sta $02f0, x
A5EE: BD 1A 03 lda $031a, x
A5F1: 09 40    ora #$40
A5F3: 9D 1A 03 sta $031a, x
A5F6: A9 1A    lda #$1a
A5F8: 95 65    sta $65, x
A5FA: BD 3A 02 lda $023a, x
A5FD: 09 01    ora #$01
A5FF: 9D 3A 02 sta $023a, x
A602: 60       rts
A603: A5 4C    lda $4c
A605: AA       tax
A606: 38       sec
A607: E9 07    sbc #$07
A609: A8       tay
A60A: A9 08    lda #$08
A60C: 85 00    sta $00
A60E: B9 81 00 lda $0081, y
A611: 95 81    sta $81, x
A613: 98       tya
A614: 18       clc
A615: 69 0E    adc #$0e
A617: A8       tay
A618: 8A       txa
A619: 18       clc
A61A: 69 0E    adc #$0e
A61C: AA       tax
A61D: C6 00    dec $00
A61F: 10 ED    bpl $a60e
A621: A5 4C    lda $4c
A623: AA       tax
A624: 38       sec
A625: E9 07    sbc #$07
A627: A8       tay
A628: 60       rts
A629: A9 00    lda #$00
A62B: 9D 1A 03 sta $031a, x
A62E: 95 65    sta $65, x
A630: B9 C0 03 lda $03c0, y
A633: 29 DF    and #$df
A635: 99 C0 03 sta $03c0, y
A638: 60       rts
A639: 8A       txa
A63A: 48       pha
A63B: 98       tya
A63C: 48       pha
A63D: 20 B5 E1 jsr $e1b5
A640: 68       pla
A641: A8       tay
A642: 68       pla
A643: AA       tax
A644: 60       rts
A645: A2 06    ldx #$06
A647: 86 4C    stx $4c
A649: BD 1A 03 lda $031a, x
A64C: 29 7F    and #$7f
A64E: 0A       asl a
A64F: A8       tay
A650: B9 5E A6 lda table_a65e, y
A653: 85 1B    sta $1b
A655: B9 5F A6 lda $a65f, y
A658: 85 1C    sta $1c
A65A: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
A65D: 60       rts

A668: BD 1A 03 lda $031a, x
A66B: 30 1D    bmi $a68a
A66D: 20 1F A7 jsr $a71f
A670: A9 18    lda #$18
A672: 95 65    sta $65, x
A674: A9 00    lda #$00
A676: 95 8F    sta $8f, x
A678: A9 01    lda #$01
A67A: 95 9D    sta $9d, x
A67C: A9 58    lda #$58
A67E: 95 B9    sta $b9, x
A680: A9 00    lda #$00
A682: 95 C7    sta $c7, x
A684: A9 00    lda #$00
A686: 95 E3    sta $e3, x
A688: 95 F1    sta $f1, x
A68A: B5 73    lda $73, x
A68C: 85 1B    sta $1b
A68E: A9 80    lda #$80
A690: 95 73    sta $73, x
A692: C5 1B    cmp $1b
A694: F0 08    beq $a69e
A696: BD 3A 02 lda $023a, x
A699: 09 01    ora #$01
A69B: 9D 3A 02 sta $023a, x
A69E: 8A       txa
A69F: 48       pha
A6A0: 20 B5 E1 jsr $e1b5
A6A3: 68       pla
A6A4: AA       tax
A6A5: 4C 5D A6 jmp $a65d
A6A8: BD 1A 03 lda $031a, x
A6AB: 30 03    bmi $a6b0
A6AD: 20 1F A7 jsr $a71f
A6B0: B5 73    lda $73, x
A6B2: 85 2A    sta $2a
A6B4: BD 1A 03 lda $031a, x
A6B7: 29 7F    and #$7f
A6B9: 38       sec
A6BA: E9 01    sbc #$01
A6BC: 0A       asl a
A6BD: A8       tay
A6BE: B9 03 A7 lda $a703, y
A6C1: 85 1B    sta $1b
A6C3: B9 04 A7 lda $a704, y
A6C6: 85 1C    sta $1c
A6C8: BC F0 02 ldy $02f0, x
A6CB: B1 1B    lda ($1b), y
A6CD: C9 FF    cmp #$ff
A6CF: D0 08    bne $a6d9
A6D1: A9 00    lda #$00
A6D3: 9D 1A 03 sta $031a, x
A6D6: 4C 00 A7 jmp $a700
A6D9: 95 73    sta $73, x
A6DB: C5 2A    cmp $2a
A6DD: F0 08    beq $a6e7
A6DF: BD 3A 02 lda $023a, x
A6E2: 09 01    ora #$01
A6E4: 9D 3A 02 sta $023a, x
A6E7: 8A       txa
A6E8: 48       pha
A6E9: 20 B5 E1 jsr $e1b5
A6EC: 68       pla
A6ED: AA       tax
A6EE: FE D6 02 inc $02d6, x
A6F1: BD D6 02 lda $02d6, x
A6F4: C9 02    cmp #$02
A6F6: 90 08    bcc $a700
A6F8: A9 00    lda #$00
A6FA: 9D D6 02 sta $02d6, x
A6FD: FE F0 02 inc $02f0, x
A700: 4C 5D A6 jmp $a65d

A71F: BD 1A 03 lda $031a, x
A722: 09 80    ora #$80
A724: 9D 1A 03 sta $031a, x
A727: A9 00    lda #$00
A729: 9D D6 02 sta $02d6, x
A72C: 9D F0 02 sta $02f0, x
A72F: 60       rts
A730: A2 05    ldx #$05
A732: 86 4C    stx $4c
A734: BD 1A 03 lda $031a, x
A737: 29 7F    and #$7f
A739: 0A       asl a
A73A: A8       tay
A73B: B9 49 A7 lda table_a749, y
A73E: 85 00    sta $00
A740: B9 4A A7 lda $a74a, y
A743: 85 01    sta $01
A745: 6C 00 00 jmp ($0000)        ; [indirect_jump]
A748: 60       rts

A750: A8       tay
A751: BD 1A 03 lda $031a, x
A754: 30 08    bmi $a75e
A756: 20 71 A8 jsr $a871
A759: A9 00    lda #$00
A75B: 9D 54 02 sta $0254, x
A75E: A0 84    ldy #$84
A760: A5 A1    lda $a1
A762: D0 06    bne $a76a
A764: A5 93    lda $93
A766: C9 C0    cmp #$c0
A768: 90 0E    bcc $a778
A76A: A0 85    ldy #$85
A76C: A5 A1    lda $a1
A76E: F0 06    beq $a776
A770: A5 93    lda $93
A772: C9 40    cmp #$40
A774: B0 02    bcs $a778
A776: A0 80    ldy #$80
A778: B5 73    lda $73, x
A77A: 85 1B    sta $1b
A77C: 98       tya
A77D: 95 73    sta $73, x
A77F: C5 1B    cmp $1b
A781: F0 08    beq $a78b
A783: BD 3A 02 lda $023a, x
A786: 09 01    ora #$01
A788: 9D 3A 02 sta $023a, x
A78B: 20 39 A6 jsr $a639
A78E: 4C 48 A7 jmp $a748
A791: BD 1A 03 lda $031a, x
A794: 30 08    bmi $a79e
A796: 20 71 A8 jsr $a871
A799: A9 01    lda #$01
A79B: 9D 54 02 sta $0254, x
A79E: B5 73    lda $73, x
A7A0: 85 1B    sta $1b
A7A2: A9 81    lda #$81
A7A4: 95 73    sta $73, x
A7A6: C5 1B    cmp $1b
A7A8: F0 08    beq $a7b2
A7AA: BD 3A 02 lda $023a, x
A7AD: 09 01    ora #$01
A7AF: 9D 3A 02 sta $023a, x
A7B2: 20 B5 E1 jsr $e1b5
A7B5: 4C 48 A7 jmp $a748
A7B8: BD 1A 03 lda $031a, x
A7BB: 30 03    bmi $a7c0
A7BD: 20 71 A8 jsr $a871
A7C0: B5 73    lda $73, x
A7C2: 85 1B    sta $1b
A7C4: A0 80    ldy #$80
A7C6: BD F0 02 lda $02f0, x
A7C9: C9 01    cmp #$01
A7CB: D0 02    bne $a7cf
A7CD: A0 83    ldy #$83
A7CF: 98       tya
A7D0: 95 73    sta $73, x
A7D2: BD F0 02 lda $02f0, x
A7D5: D0 0B    bne $a7e2
A7D7: BD 54 02 lda $0254, x
A7DA: C9 01    cmp #$01
A7DC: D0 04    bne $a7e2
A7DE: A9 81    lda #$81
A7E0: 95 73    sta $73, x
A7E2: B5 73    lda $73, x
A7E4: C5 1B    cmp $1b
A7E6: F0 08    beq $a7f0
A7E8: BD 3A 02 lda $023a, x
A7EB: 09 01    ora #$01
A7ED: 9D 3A 02 sta $023a, x
A7F0: FE D6 02 inc $02d6, x
A7F3: BC F0 02 ldy $02f0, x
A7F6: BD D6 02 lda $02d6, x
A7F9: D9 13 A8 cmp $a813, y
A7FC: 90 0F    bcc $a80d
A7FE: A9 00    lda #$00
A800: 9D D6 02 sta $02d6, x
A803: BD F0 02 lda $02f0, x
A806: C9 02    cmp #$02
A808: F0 03    beq $a80d
A80A: FE F0 02 inc $02f0, x
A80D: 20 B5 E1 jsr $e1b5
A810: 4C 48 A7 jmp $a748

A816: BD 1A 03 lda $031a, x
A819: 30 03    bmi $a81e
A81B: 20 71 A8 jsr $a871
A81E: B5 73    lda $73, x
A820: 85 1B    sta $1b
A822: A0 80    ldy #$80
A824: BD F0 02 lda $02f0, x
A827: C9 01    cmp #$01
A829: D0 02    bne $a82d
A82B: A0 82    ldy #$82
A82D: 98       tya
A82E: 95 73    sta $73, x
A830: BD F0 02 lda $02f0, x
A833: D0 0B    bne $a840
A835: BD 54 02 lda $0254, x
A838: C9 01    cmp #$01
A83A: D0 04    bne $a840
A83C: A9 81    lda #$81
A83E: 95 73    sta $73, x
A840: B5 73    lda $73, x
A842: C5 1B    cmp $1b
A844: F0 08    beq $a84e
A846: BD 3A 02 lda $023a, x
A849: 09 01    ora #$01
A84B: 9D 3A 02 sta $023a, x
A84E: FE D6 02 inc $02d6, x
A851: BC F0 02 ldy $02f0, x
A854: BD D6 02 lda $02d6, x
A857: D9 13 A8 cmp $a813, y
A85A: 90 0F    bcc $a86b
A85C: A9 00    lda #$00
A85E: 9D D6 02 sta $02d6, x
A861: BD F0 02 lda $02f0, x
A864: C9 02    cmp #$02
A866: F0 03    beq $a86b
A868: FE F0 02 inc $02f0, x
A86B: 20 B5 E1 jsr $e1b5
A86E: 4C 48 A7 jmp $a748
A871: BD 1A 03 lda $031a, x
A874: 09 80    ora #$80
A876: 9D 1A 03 sta $031a, x
A879: A9 00    lda #$00
A87B: 9D D6 02 sta $02d6, x
A87E: 9D F0 02 sta $02f0, x
A881: 9D C0 03 sta $03c0, x
A884: A9 17    lda #$17
A886: 95 65    sta $65, x
A888: A0 00    ldy #$00
A88A: B9 9C A8 lda $a89c, y
A88D: 95 81    sta $81, x
A88F: 8A       txa
A890: 18       clc
A891: 69 0E    adc #$0e
A893: AA       tax
A894: C8       iny
A895: C0 09    cpy #$09
A897: 90 F1    bcc $a88a
A899: A6 4C    ldx $4c
A89B: 60       rts

A8A5: A9 27    lda #$27
A8A7: 85 65    sta $65
A8A9: 85 66    sta $66
A8AB: 85 67    sta $67
A8AD: 85 68    sta $68
A8AF: A2 00    ldx #$00
A8B1: A9 50    lda #$50
A8B3: 95 B9    sta $b9, x
A8B5: A9 00    lda #$00
A8B7: 95 C7    sta $c7, x
A8B9: 95 E3    sta $e3, x
A8BB: 95 F1    sta $f1, x
A8BD: 95 9D    sta $9d, x
A8BF: E8       inx
A8C0: E0 04    cpx #$04
A8C2: 90 ED    bcc $a8b1
A8C4: A5 57    lda $57
A8C6: C9 10    cmp #$10
A8C8: 90 03    bcc $a8cd
A8CA: 38       sec
A8CB: E9 06    sbc #$06
A8CD: 0A       asl a
A8CE: 0A       asl a
A8CF: A8       tay
A8D0: B9 62 A9 lda $a962, y
A8D3: 85 73    sta $73
A8D5: B9 63 A9 lda $a963, y
A8D8: 85 8F    sta $8f
A8DA: B9 64 A9 lda $a964, y
A8DD: 85 74    sta $74
A8DF: B9 65 A9 lda $a965, y
A8E2: 85 90    sta $90
A8E4: A2 00    ldx #$00
A8E6: 86 4C    stx $4c
A8E8: 20 F3 DF jsr $dff3
A8EB: A5 57    lda $57
A8ED: C9 10    cmp #$10
A8EF: 90 07    bcc $a8f8
A8F1: A2 01    ldx #$01
A8F3: 86 4C    stx $4c
A8F5: 20 F3 DF jsr $dff3
A8F8: A5 58    lda $58
A8FA: C9 10    cmp #$10
A8FC: 90 03    bcc $a901
A8FE: 38       sec
A8FF: E9 06    sbc #$06
A901: 0A       asl a
A902: 0A       asl a
A903: A8       tay
A904: B9 62 A9 lda $a962, y
A907: 85 75    sta $75
A909: B9 63 A9 lda $a963, y
A90C: 49 FF    eor #$ff
A90E: 18       clc
A90F: 69 01    adc #$01
A911: 85 92    sta $92
A913: A9 01    lda #$01
A915: 85 A0    sta $a0
A917: B9 64 A9 lda $a964, y
A91A: 85 76    sta $76
A91C: B9 65 A9 lda $a965, y
A91F: 49 FF    eor #$ff
A921: 18       clc
A922: 69 01    adc #$01
A924: 85 91    sta $91
A926: A9 01    lda #$01
A928: 85 9F    sta $9f
A92A: A2 02    ldx #$02
A92C: 86 4C    stx $4c
A92E: 20 F3 DF jsr $dff3
A931: A5 58    lda $58
A933: C9 10    cmp #$10
A935: 90 07    bcc $a93e
A937: A2 03    ldx #$03
A939: 86 4C    stx $4c
A93B: 20 F3 DF jsr $dff3
A93E: A2 00    ldx #$00
A940: A9 05    lda #$05
A942: 95 73    sta $73, x
A944: A9 00    lda #$00
A946: 95 8F    sta $8f, x
A948: A9 01    lda #$01
A94A: 95 9D    sta $9d, x
A94C: A9 78    lda #$78
A94E: 95 B9    sta $b9, x
A950: A9 00    lda #$00
A952: 95 C7    sta $c7, x
A954: A9 00    lda #$00
A956: 95 E3    sta $e3, x
A958: 95 F1    sta $f1, x
A95A: A9 00    lda #$00
A95C: 85 4C    sta $4c
A95E: 20 F3 DF jsr $dff3
A961: 60       rts

A9A2: 85 1B    sta $1b
A9A4: 8A       txa
A9A5: 48       pha
A9A6: 98       tya
A9A7: 48       pha
A9A8: A5 4C    lda $4c
A9AA: 18       clc
A9AB: 69 07    adc #$07
A9AD: AA       tax
A9AE: BD 1A 03 lda $031a, x
A9B1: 10 09    bpl $a9bc
A9B3: B5 65    lda $65, x
A9B5: C9 30    cmp #$30
A9B7: D0 03    bne $a9bc
A9B9: 4C 88 AA jmp $aa88
A9BC: A5 1B    lda $1b
A9BE: 09 80    ora #$80
A9C0: 9D 1A 03 sta $031a, x
A9C3: A9 1C    lda #$1c
A9C5: 95 65    sta $65, x
A9C7: A5 4C    lda $4c
A9C9: C9 04    cmp #$04
A9CB: D0 29    bne $a9f6
A9CD: 8A       txa
A9CE: 48       pha
A9CF: A0 00    ldy #$00
A9D1: 84 00    sty $00
A9D3: B9 85 00 lda $0085, y
A9D6: 95 81    sta $81, x
A9D8: 98       tya
A9D9: 18       clc
A9DA: 69 0E    adc #$0e
A9DC: A8       tay
A9DD: 8A       txa
A9DE: 18       clc
A9DF: 69 0E    adc #$0e
A9E1: AA       tax
A9E2: E6 00    inc $00
A9E4: A5 00    lda $00
A9E6: C9 09    cmp #$09
A9E8: 90 E9    bcc $a9d3
A9EA: 68       pla
A9EB: AA       tax
A9EC: B5 B9    lda $b9, x
A9EE: 38       sec
A9EF: E9 01    sbc #$01
A9F1: 95 B9    sta $b9, x
A9F3: 4C 88 AA jmp $aa88
A9F6: 8A       txa
A9F7: 48       pha
A9F8: A6 4C    ldx $4c
A9FA: B5 73    lda $73, x
A9FC: 29 7F    and #$7f
A9FE: 38       sec
A9FF: E9 18    sbc #$18
AA01: 85 1B    sta $1b
AA03: 0A       asl a
AA04: 18       clc
AA05: 65 1B    adc $1b
AA07: A8       tay
AA08: B9 8D AA lda $aa8d, y
AA0B: 85 1B    sta $1b
AA0D: B5 73    lda $73, x
AA0F: 30 09    bmi $aa1a
AA11: A5 1B    lda $1b
AA13: 49 FF    eor #$ff
AA15: 18       clc
AA16: 69 01    adc #$01
AA18: 85 1B    sta $1b
AA1A: A5 1B    lda $1b
AA1C: 08       php
AA1D: 18       clc
AA1E: 75 8F    adc $8f, x
AA20: 85 00    sta $00
AA22: B5 9D    lda $9d, x
AA24: 69 00    adc #$00
AA26: 28       plp
AA27: 10 03    bpl $aa2c
AA29: 18       clc
AA2A: 69 FF    adc #$ff
AA2C: 85 01    sta $01
AA2E: B9 8E AA lda $aa8e, y
AA31: 08       php
AA32: 18       clc
AA33: 75 B9    adc $b9, x
AA35: 85 02    sta $02
AA37: B5 C7    lda $c7, x
AA39: 69 00    adc #$00
AA3B: 28       plp
AA3C: 10 03    bpl $aa41
AA3E: 18       clc
AA3F: 69 FF    adc #$ff
AA41: 85 03    sta $03
AA43: A5 BD    lda $bd
AA45: D5 B9    cmp $b9, x
AA47: B0 14    bcs $aa5d
AA49: B5 B9    lda $b9, x
AA4B: 38       sec
AA4C: E5 BD    sbc $bd
AA4E: 85 1B    sta $1b
AA50: A5 02    lda $02
AA52: 38       sec
AA53: E5 1B    sbc $1b
AA55: 85 02    sta $02
AA57: A5 03    lda $03
AA59: E9 00    sbc #$00
AA5B: 85 03    sta $03
AA5D: B9 8F AA lda $aa8f, y
AA60: 18       clc
AA61: 65 1B    adc $1b
AA63: 18       clc
AA64: 75 E3    adc $e3, x
AA66: 85 04    sta $04
AA68: B5 F1    lda $f1, x
AA6A: 69 00    adc #$00
AA6C: 85 05    sta $05
AA6E: 68       pla
AA6F: AA       tax
AA70: A5 00    lda $00
AA72: 95 8F    sta $8f, x
AA74: A5 01    lda $01
AA76: 95 9D    sta $9d, x
AA78: A5 02    lda $02
AA7A: 95 B9    sta $b9, x
AA7C: A5 03    lda $03
AA7E: 95 C7    sta $c7, x
AA80: A5 04    lda $04
AA82: 95 E3    sta $e3, x
AA84: A5 05    lda $05
AA86: 95 F1    sta $f1, x
AA88: 68       pla
AA89: A8       tay
AA8A: 68       pla
AA8B: AA       tax
AA8C: 60       rts

AB1D: A2 07    ldx #$07
AB1F: 86 4C    stx $4c
AB21: A6 4C    ldx $4c
AB23: BD 1A 03 lda $031a, x
AB26: 10 09    bpl $ab31
AB28: B5 65    lda $65, x
AB2A: C9 1C    cmp #$1c
AB2C: D0 03    bne $ab31
AB2E: 20 3A AB jsr $ab3a
AB31: E6 4C    inc $4c
AB33: A5 4C    lda $4c
AB35: C9 0C    cmp #$0c
AB37: 90 E8    bcc $ab21
AB39: 60       rts
AB3A: BD 1A 03 lda $031a, x
AB3D: 29 40    and #$40
AB3F: D0 10    bne $ab51
AB41: BD 1A 03 lda $031a, x
AB44: 09 40    ora #$40
AB46: 9D 1A 03 sta $031a, x
AB49: A9 00    lda #$00
AB4B: 9D D6 02 sta $02d6, x
AB4E: 9D F0 02 sta $02f0, x
AB51: B5 73    lda $73, x
AB53: 85 1B    sta $1b
AB55: BD 1A 03 lda $031a, x
AB58: 29 3F    and #$3f
AB5A: 0A       asl a
AB5B: A8       tay
AB5C: B9 9F AB lda $ab9f, y
AB5F: 85 1B    sta $1b
AB61: B9 A0 AB lda $aba0, y
AB64: 85 1C    sta $1c
AB66: BC F0 02 ldy $02f0, x
AB69: B1 1B    lda ($1b), y
AB6B: C9 FF    cmp #$ff
AB6D: F0 26    beq $ab95
AB6F: 95 73    sta $73, x
AB71: C5 1B    cmp $1b
AB73: F0 08    beq $ab7d
AB75: BD 3A 02 lda $023a, x
AB78: 09 01    ora #$01
AB7A: 9D 3A 02 sta $023a, x
AB7D: 20 39 A6 jsr $a639
AB80: FE D6 02 inc $02d6, x
AB83: BD D6 02 lda $02d6, x
AB86: C9 01    cmp #$01
AB88: 90 14    bcc $ab9e
AB8A: A9 00    lda #$00
AB8C: 9D D6 02 sta $02d6, x
AB8F: FE F0 02 inc $02f0, x
AB92: 4C 9E AB jmp $ab9e
AB95: A9 00    lda #$00
AB97: 9D 1A 03 sta $031a, x
AB9A: A9 00    lda #$00
AB9C: 95 65    sta $65, x
AB9E: 60       rts

ABF8: 8A       txa
ABF9: 48       pha
ABFA: 98       tya
ABFB: 48       pha
ABFC: 8A       txa
ABFD: 85 1B    sta $1b
ABFF: 18       clc
AC00: 69 07    adc #$07
AC02: AA       tax
AC03: A9 80    lda #$80
AC05: 05 1B    ora $1b
AC07: 9D 1A 03 sta $031a, x
AC0A: A9 27    lda #$27
AC0C: 95 65    sta $65, x
AC0E: 68       pla
AC0F: A8       tay
AC10: 68       pla
AC11: AA       tax
AC12: 60       rts
AC13: A2 07    ldx #$07
AC15: 86 4C    stx $4c
AC17: A6 4C    ldx $4c
AC19: BD 1A 03 lda $031a, x
AC1C: 10 47    bpl $ac65
AC1E: B5 65    lda $65, x
AC20: C9 27    cmp #$27
AC22: D0 41    bne $ac65
AC24: BD 1A 03 lda $031a, x
AC27: 29 40    and #$40
AC29: D0 0D    bne $ac38
AC2B: BD 1A 03 lda $031a, x
AC2E: 09 40    ora #$40
AC30: 9D 1A 03 sta $031a, x
AC33: A9 00    lda #$00
AC35: 9D D6 02 sta $02d6, x
AC38: 20 6E AC jsr $ac6e
AC3B: A9 94    lda #$94
AC3D: 95 73    sta $73, x
AC3F: BD 3A 02 lda $023a, x
AC42: 09 01    ora #$01
AC44: 9D 3A 02 sta $023a, x
AC47: 20 39 A6 jsr $a639
AC4A: AD E0 03 lda $03e0
AC4D: C9 08    cmp #$08
AC4F: F0 0D    beq $ac5e
AC51: AD 1A 03 lda $031a
AC54: 29 7F    and #$7f
AC56: C9 1D    cmp #$1d
AC58: F0 04    beq $ac5e
AC5A: C9 1E    cmp #$1e
AC5C: D0 07    bne $ac65
AC5E: A9 00    lda #$00
AC60: 9D 1A 03 sta $031a, x
AC63: 95 65    sta $65, x
AC65: E6 4C    inc $4c
AC67: A5 4C    lda $4c
AC69: C9 0B    cmp #$0b
AC6B: 90 AA    bcc $ac17
AC6D: 60       rts
AC6E: BD 1A 03 lda $031a, x
AC71: 29 3F    and #$3f
AC73: A8       tay
AC74: A9 00    lda #$00
AC76: 85 00    sta $00
AC78: B9 81 00 lda $0081, y
AC7B: 95 81    sta $81, x
AC7D: 98       tya
AC7E: 18       clc
AC7F: 69 0E    adc #$0e
AC81: A8       tay
AC82: 8A       txa
AC83: 18       clc
AC84: 69 0E    adc #$0e
AC86: AA       tax
AC87: E6 00    inc $00
AC89: A5 00    lda $00
AC8B: C9 09    cmp #$09
AC8D: 90 E9    bcc $ac78
AC8F: A6 4C    ldx $4c
AC91: B5 E3    lda $e3, x
AC93: 18       clc
AC94: 69 40    adc #$40
AC96: 95 E3    sta $e3, x
AC98: B5 8F    lda $8f, x
AC9A: 38       sec
AC9B: E9 18    sbc #$18
AC9D: 95 8F    sta $8f, x
AC9F: B5 9D    lda $9d, x
ACA1: E9 00    sbc #$00
ACA3: 95 9D    sta $9d, x
ACA5: 60       rts
ACA6: 60       rts
ACA7: 60       rts
ACA8: A2 0D    ldx #$0d
ACAA: 86 4C    stx $4c
ACAC: A5 38    lda $38
ACAE: 29 0F    and #$0f
ACB0: F0 56    beq $ad08
ACB2: C9 04    cmp #$04
ACB4: F0 52    beq $ad08
ACB6: 0A       asl a
ACB7: A8       tay
ACB8: B9 09 AD lda $ad09, y
ACBB: 85 00    sta $00
ACBD: B9 0A AD lda $ad0a, y
ACC0: 85 01    sta $01
ACC2: A0 00    ldy #$00
ACC4: B1 00    lda ($00), y
ACC6: 95 65    sta $65, x
ACC8: C8       iny
ACC9: B1 00    lda ($00), y
ACCB: 95 73    sta $73, x
ACCD: C8       iny
ACCE: A9 00    lda #$00
ACD0: 85 1B    sta $1b
ACD2: B1 00    lda ($00), y
ACD4: 95 81    sta $81, x
ACD6: C8       iny
ACD7: 8A       txa
ACD8: 18       clc
ACD9: 69 0E    adc #$0e
ACDB: AA       tax
ACDC: E6 1B    inc $1b
ACDE: A5 1B    lda $1b
ACE0: C9 09    cmp #$09
ACE2: 90 EE    bcc $acd2
ACE4: A6 4C    ldx $4c
ACE6: A9 01    lda #$01
ACE8: 9D 3A 02 sta $023a, x
ACEB: 8A       txa
ACEC: 48       pha
ACED: 98       tya
ACEE: 48       pha
ACEF: A5 00    lda $00
ACF1: 48       pha
ACF2: A5 01    lda $01
ACF4: 48       pha
ACF5: 20 F3 DF jsr $dff3
ACF8: 68       pla
ACF9: 85 01    sta $01
ACFB: 68       pla
ACFC: 85 00    sta $00
ACFE: 68       pla
ACFF: A8       tay
AD00: 68       pla
AD01: AA       tax
AD02: B1 00    lda ($00), y
AD04: C9 FF    cmp #$ff
AD06: D0 BC    bne $acc4
AD08: 60       rts

AD82: A2 07    ldx #$07
AD84: 86 4C    stx $4c
AD86: A6 4C    ldx $4c
AD88: BD 1A 03 lda $031a, x
AD8B: 10 09    bpl $ad96
AD8D: B5 65    lda $65, x
AD8F: C9 30    cmp #$30
AD91: D0 03    bne $ad96
AD93: 20 9F AD jsr $ad9f
AD96: E6 4C    inc $4c
AD98: A5 4C    lda $4c
AD9A: C9 0B    cmp #$0b
AD9C: 90 E8    bcc $ad86
AD9E: 60       rts
AD9F: A5 4F    lda $4f
ADA1: 30 03    bmi $ada6
ADA3: 4C 60 AE jmp $ae60
ADA6: BD 1A 03 lda $031a, x
ADA9: 29 40    and #$40
ADAB: D0 10    bne $adbd
ADAD: A9 00    lda #$00
ADAF: 9D D6 02 sta $02d6, x
ADB2: 9D F0 02 sta $02f0, x
ADB5: BD 1A 03 lda $031a, x
ADB8: 09 40    ora #$40
ADBA: 9D 1A 03 sta $031a, x
ADBD: A9 00    lda #$00
ADBF: 85 1B    sta $1b
ADC1: 8A       txa
ADC2: 38       sec
ADC3: E9 07    sbc #$07
ADC5: A8       tay
ADC6: B9 D4 03 lda $03d4, y
ADC9: D0 03    bne $adce
ADCB: 4C 60 AE jmp $ae60
ADCE: B9 73 00 lda $0073, y
ADD1: 29 7F    and #$7f
ADD3: C9 42    cmp #$42
ADD5: D0 F4    bne $adcb
ADD7: 98       tya
ADD8: 48       pha
ADD9: B9 81 00 lda $0081, y
ADDC: 95 81    sta $81, x
ADDE: 98       tya
ADDF: 18       clc
ADE0: 69 0E    adc #$0e
ADE2: A8       tay
ADE3: 8A       txa
ADE4: 18       clc
ADE5: 69 0E    adc #$0e
ADE7: AA       tax
ADE8: E6 1B    inc $1b
ADEA: A5 1B    lda $1b
ADEC: C9 09    cmp #$09
ADEE: 90 E9    bcc $add9
ADF0: 68       pla
ADF1: A8       tay
ADF2: A6 4C    ldx $4c
ADF4: B5 E3    lda $e3, x
ADF6: 18       clc
ADF7: 69 40    adc #$40
ADF9: 95 E3    sta $e3, x
ADFB: B5 B9    lda $b9, x
ADFD: 38       sec
ADFE: E9 01    sbc #$01
AE00: 95 B9    sta $b9, x
AE02: A9 08    lda #$08
AE04: 85 1B    sta $1b
AE06: B9 73 00 lda $0073, y
AE09: 10 04    bpl $ae0f
AE0B: A9 F8    lda #$f8
AE0D: 85 1B    sta $1b
AE0F: A5 1B    lda $1b
AE11: 08       php
AE12: 18       clc
AE13: 75 8F    adc $8f, x
AE15: 95 8F    sta $8f, x
AE17: B5 9D    lda $9d, x
AE19: 69 00    adc #$00
AE1B: 28       plp
AE1C: 10 03    bpl $ae21
AE1E: 18       clc
AE1F: 69 FF    adc #$ff
AE21: 95 9D    sta $9d, x
AE23: B9 D4 03 lda $03d4, y
AE26: 38       sec
AE27: E9 01    sbc #$01
AE29: A8       tay
AE2A: 85 1B    sta $1b
AE2C: 0A       asl a
AE2D: 18       clc
AE2E: 65 1B    adc $1b
AE30: 18       clc
AE31: 7D F0 02 adc $02f0, x
AE34: A8       tay
AE35: B9 61 AE lda $ae61, y
AE38: 95 73    sta $73, x
AE3A: A9 01    lda #$01
AE3C: 9D 3A 02 sta $023a, x
AE3F: 20 39 A6 jsr $a639
AE42: FE D6 02 inc $02d6, x
AE45: BD D6 02 lda $02d6, x
AE48: C9 01    cmp #$01
AE4A: 90 14    bcc $ae60
AE4C: A9 00    lda #$00
AE4E: 9D D6 02 sta $02d6, x
AE51: FE F0 02 inc $02f0, x
AE54: BD F0 02 lda $02f0, x
AE57: C9 03    cmp #$03
AE59: 90 05    bcc $ae60
AE5B: A9 00    lda #$00
AE5D: 9D F0 02 sta $02f0, x
AE60: 60       rts

AE6A: A5 46    lda $46
AE6C: 29 04    and #$04
AE6E: F0 6F    beq $aedf
AE70: A2 00    ldx #$00
AE72: A0 00    ldy #$00
AE74: BD 0A 03 lda $030a, x
AE77: 29 08    and #$08
AE79: D0 01    bne $ae7c
AE7B: E8       inx
AE7C: 96 4D    stx $4d, y
AE7E: 96 51    stx $51, y
AE80: B9 47 00 lda $0047, y
AE83: 10 08    bpl $ae8d
AE85: BD 0A 03 lda $030a, x
AE88: 09 80    ora #$80
AE8A: 9D 0A 03 sta $030a, x
AE8D: BD 0A 03 lda $030a, x
AE90: 09 40    ora #$40
AE92: 9D 0A 03 sta $030a, x
AE95: A5 46    lda $46
AE97: 29 10    and #$10
AE99: 4A       lsr a
AE9A: 4A       lsr a
AE9B: 4A       lsr a
AE9C: 4A       lsr a
AE9D: 85 00    sta $00
AE9F: C4 00    cpy $00
AEA1: D0 0A    bne $aead
AEA3: 86 4F    stx $4f
AEA5: BD 0E 03 lda $030e, x
AEA8: 09 08    ora #$08
AEAA: 9D 0E 03 sta $030e, x
AEAD: A2 02    ldx #$02
AEAF: C8       iny
AEB0: C0 02    cpy #$02
AEB2: 90 C0    bcc $ae74
AEB4: A9 10    lda #$10
AEB6: 8D E0 03 sta $03e0
AEB9: A9 00    lda #$00
AEBB: 8D 0F 04 sta $040f
AEBE: 8D 14 04 sta $0414
AEC1: 8D E5 07 sta $07e5
AEC4: A5 4F    lda $4f
AEC6: 8D 11 04 sta $0411
AEC9: A5 46    lda $46
AECB: 29 FB    and #$fb
AECD: 85 46    sta $46
AECF: A9 00    lda #$00
AED1: 8D 12 04 sta $0412
AED4: 8D 13 04 sta $0413
AED7: A9 FF    lda #$ff
AED9: 8D 10 04 sta $0410
AEDC: 8D E2 03 sta $03e2
AEDF: 20 0B B0 jsr $b00b
AEE2: 20 7D B0 jsr $b07d
AEE5: A5 46    lda $46
AEE7: 29 01    and #$01
AEE9: D0 06    bne $aef1
AEEB: 20 F6 5B jsr $5bf6
AEEE: 20 66 66 jsr $6666
AEF1: A9 00    lda #$00
AEF3: 85 4C    sta $4c
AEF5: A6 4C    ldx $4c
AEF7: A5 46    lda $46
AEF9: 29 01    and #$01
AEFB: D0 3F    bne $af3c
AEFD: A5 46    lda $46
AEFF: 29 08    and #$08
AF01: F0 28    beq $af2b
AF03: A0 9D    ldy #$9d
AF05: A5 46    lda $46
AF07: 4A       lsr a
AF08: 4A       lsr a
AF09: 4A       lsr a
AF0A: 45 4C    eor $4c
AF0C: 29 02    and #$02
AF0E: F0 02    beq $af12
AF10: A0 9E    ldy #$9e
AF12: 98       tya
AF13: 9D 27 03 sta $0327, x
AF16: BD 1A 03 lda $031a, x
AF19: 29 7F    and #$7f
AF1B: C9 1D    cmp #$1d
AF1D: F0 1A    beq $af39
AF1F: C9 1E    cmp #$1e
AF21: F0 16    beq $af39
AF23: A9 00    lda #$00
AF25: 9D 0E 03 sta $030e, x
AF28: 4C 39 AF jmp $af39
AF2B: BD 0A 03 lda $030a, x
AF2E: 30 06    bmi $af36
AF30: 20 2D 70 jsr $702d
AF33: 4C 39 AF jmp $af39
AF36: 20 D8 B0 jsr $b0d8
AF39: 20 30 91 jsr $9130
AF3C: A6 4C    ldx $4c
AF3E: BD 0A 03 lda $030a, x
AF41: 10 15    bpl $af58
AF43: 29 40    and #$40
AF45: D0 09    bne $af50
AF47: 8A       txa
AF48: 49 01    eor #$01
AF4A: A8       tay
AF4B: B9 0A 03 lda $030a, y
AF4E: 30 08    bmi $af58
AF50: BD 3A 02 lda $023a, x
AF53: 09 40    ora #$40
AF55: 9D 3A 02 sta $023a, x
AF58: 20 B5 E1 jsr $e1b5
AF5B: E6 4C    inc $4c
AF5D: A5 4C    lda $4c
AF5F: C9 04    cmp #$04
AF61: 90 92    bcc $aef5
AF63: 60       rts
AF64: A9 01    lda #$01
AF66: 85 4F    sta $4f
AF68: A9 08    lda #$08
AF6A: 8D 0B 03 sta $030b
AF6D: 8D 0D 03 sta $030d
AF70: A2 01    ldx #$01
AF72: B5 47    lda $47, x
AF74: 30 0C    bmi $af82
AF76: A9 09    lda #$09
AF78: 95 47    sta $47, x
AF7A: A5 38    lda $38
AF7C: C9 10    cmp #$10
AF7E: B0 02    bcs $af82
AF80: 95 47    sta $47, x
AF82: 20 F6 5B jsr $5bf6
AF85: A9 03    lda #$03
AF87: 85 4C    sta $4c
AF89: A6 4C    ldx $4c
AF8B: 20 2D 70 jsr $702d
AF8E: A5 4C    lda $4c
AF90: AA       tax
AF91: 29 01    and #$01
AF93: 85 00    sta $00
AF95: A5 4C    lda $4c
AF97: 95 65    sta $65, x
AF99: 4A       lsr a
AF9A: A8       tay
AF9B: AD F9 07 lda $07f9
AF9E: D0 49    bne $afe9
AFA0: B9 47 00 lda $0047, y
AFA3: 30 44    bmi $afe9
AFA5: A5 38    lda $38
AFA7: A4 3A    ldy $3a
AFA9: 18       clc
AFAA: 79 07 B0 adc $b007, y
AFAD: 85 01    sta $01
AFAF: 29 0F    and #$0f
AFB1: C9 09    cmp #$09
AFB3: 90 0D    bcc $afc2
AFB5: A5 01    lda $01
AFB7: 29 F0    and #$f0
AFB9: C9 F0    cmp #$f0
AFBB: B0 03    bcs $afc0
AFBD: 18       clc
AFBE: 69 10    adc #$10
AFC0: 85 01    sta $01
AFC2: A5 01    lda $01
AFC4: C9 10    cmp #$10
AFC6: B0 09    bcs $afd1
AFC8: 0A       asl a
AFC9: 05 00    ora $00
AFCB: 9D 12 03 sta $0312, x
AFCE: 4C DD AF jmp $afdd
AFD1: 29 03    and #$03
AFD3: 0A       asl a
AFD4: 05 00    ora $00
AFD6: A8       tay
AFD7: B9 FF AF lda $afff, y
AFDA: 9D 12 03 sta $0312, x
AFDD: A5 38    lda $38
AFDF: 29 0F    and #$0f
AFE1: 0A       asl a
AFE2: 18       clc
AFE3: 69 04    adc #$04
AFE5: 05 00    ora $00
AFE7: 95 65    sta $65, x
AFE9: A9 43    lda #$43
AFEB: 95 73    sta $73, x
AFED: E0 02    cpx #$02
AFEF: 90 04    bcc $aff5
AFF1: 09 80    ora #$80
AFF3: 95 73    sta $73, x
AFF5: A9 01    lda #$01
AFF7: 9D 3A 02 sta $023a, x
AFFA: C6 4C    dec $4c
AFFC: 10 8B    bpl $af89
AFFE: 60       rts

B00B: A2 03    ldx #$03
B00D: A9 40    lda #$40
B00F: 85 00    sta $00
B011: B5 8F    lda $8f, x
B013: 38       sec
B014: E5 93    sbc $93
B016: 85 10    sta $10
B018: B5 9D    lda $9d, x
B01A: E5 A1    sbc $a1
B01C: 85 11    sta $11
B01E: 10 09    bpl $b029
B020: A5 00    lda $00
B022: 09 80    ora #$80
B024: 85 00    sta $00
B026: 20 98 CF jsr $cf98
B029: A5 10    lda $10
B02B: A4 11    ldy $11
B02D: F0 02    beq $b031
B02F: A9 FF    lda #$ff
B031: 9D 3B 03 sta $033b, x
B034: B5 B9    lda $b9, x
B036: 38       sec
B037: E5 BD    sbc $bd
B039: 85 10    sta $10
B03B: B5 C7    lda $c7, x
B03D: E5 CB    sbc $cb
B03F: 85 11    sta $11
B041: 10 09    bpl $b04c
B043: A5 00    lda $00
B045: 29 BF    and #$bf
B047: 85 00    sta $00
B049: 20 98 CF jsr $cf98
B04C: A5 10    lda $10
B04E: A4 11    ldy $11
B050: F0 02    beq $b054
B052: A9 FF    lda #$ff
B054: 9D 3F 03 sta $033f, x
B057: B5 E3    lda $e3, x
B059: 38       sec
B05A: E5 E7    sbc $e7
B05C: 85 10    sta $10
B05E: B5 F1    lda $f1, x
B060: E5 F5    sbc $f5
B062: 85 11    sta $11
B064: 10 03    bpl $b069
B066: 20 98 CF jsr $cf98
B069: A5 10    lda $10
B06B: A4 11    ldy $11
B06D: F0 02    beq $b071
B06F: A9 FF    lda #$ff
B071: 9D 43 03 sta $0343, x
B074: A5 00    lda $00
B076: 9D 37 03 sta $0337, x
B079: CA       dex
B07A: 10 91    bpl $b00d
B07C: 60       rts
B07D: A0 00    ldy #$00
B07F: A9 00    lda #$00
B081: 85 00    sta $00
B083: B9 8F 00 lda $008f, y
B086: 38       sec
B087: F9 90 00 sbc $0090, y
B08A: B9 9D 00 lda $009d, y
B08D: F9 9E 00 sbc $009e, y
B090: B0 02    bcs $b094
B092: E6 00    inc $00
B094: A5 00    lda $00
B096: 99 6F 03 sta $036f, y
B099: 20 CD B0 jsr $b0cd
B09C: C8       iny
B09D: 49 01    eor #$01
B09F: 99 6F 03 sta $036f, y
B0A2: 20 CD B0 jsr $b0cd
B0A5: C8       iny
B0A6: A9 00    lda #$00
B0A8: 85 00    sta $00
B0AA: B9 8F 00 lda $008f, y
B0AD: 38       sec
B0AE: F9 90 00 sbc $0090, y
B0B1: B9 9D 00 lda $009d, y
B0B4: F9 9E 00 sbc $009e, y
B0B7: 90 02    bcc $b0bb
B0B9: E6 00    inc $00
B0BB: A5 00    lda $00
B0BD: 99 6F 03 sta $036f, y
B0C0: 20 CD B0 jsr $b0cd
B0C3: C8       iny
B0C4: 49 01    eor #$01
B0C6: 99 6F 03 sta $036f, y
B0C9: 20 CD B0 jsr $b0cd
B0CC: 60       rts
B0CD: C9 00    cmp #$00
B0CF: D0 06    bne $b0d7
B0D1: 98       tya
B0D2: 4A       lsr a
B0D3: AA       tax
B0D4: 98       tya
B0D5: 95 5F    sta $5f, x
B0D7: 60       rts
B0D8: A5 4C    lda $4c
B0DA: 4A       lsr a
B0DB: AA       tax
B0DC: 20 B7 F7 jsr $f7b7
B0DF: B9 32 02 lda $0232, y
B0E2: 29 70    and #$70
B0E4: 85 00    sta $00
B0E6: B9 2E 02 lda $022e, y
B0E9: 29 0F    and #$0f
B0EB: 85 01    sta $01
B0ED: E0 01    cpx #$01
B0EF: 90 02    bcc $b0f3
B0F1: 09 10    ora #$10
B0F3: AA       tax
B0F4: BD 5C B1 lda $b15c, x
B0F7: A6 4C    ldx $4c
B0F9: 9D CC 03 sta $03cc, x
B0FC: E4 4F    cpx $4f
B0FE: F0 29    beq $b129
B100: A5 4F    lda $4f
B102: 10 1C    bpl $b120
B104: BD 1A 03 lda $031a, x
B107: 29 7F    and #$7f
B109: C9 0C    cmp #$0c
B10B: B0 1B    bcs $b128
B10D: 20 7C B1 jsr $b17c
B110: B0 16    bcs $b128
B112: 20 ED B2 jsr $b2ed
B115: B0 11    bcs $b128
B117: BD 1A 03 lda $031a, x
B11A: 29 7F    and #$7f
B11C: C9 0A    cmp #$0a
B11E: B0 08    bcs $b128
B120: 20 94 B3 jsr $b394
B123: B0 03    bcs $b128
B125: 20 EC B3 jsr $b3ec
B128: 60       rts
B129: BD 1A 03 lda $031a, x
B12C: 29 7F    and #$7f
B12E: C9 0C    cmp #$0c
B130: F0 F6    beq $b128
B132: C9 1A    cmp #$1a
B134: B0 F2    bcs $b128
B136: C9 0A    cmp #$0a
B138: F0 0D    beq $b147
B13A: C9 19    cmp #$19
B13C: D0 10    bne $b14e
B13E: 20 2A B4 jsr $b42a
B141: B0 E5    bcs $b128
B143: 20 ED B2 jsr $b2ed
B146: 60       rts
B147: 20 ED B2 jsr $b2ed
B14A: 20 7C B1 jsr $b17c
B14D: 60       rts
B14E: BD 0E 03 lda $030e, x
B151: 29 08    and #$08
B153: F0 D3    beq $b128
B155: 20 0F B4 jsr $b40f
B158: B0 CE    bcs $b128
B15A: 90 C4    bcc $b120	; unconditional jump

B17C: A5 00    lda $00
B17E: 29 10    and #$10
B180: F0 7A    beq $b1fc
B182: BD 1A 03 lda $031a, x
B185: 29 7F    and #$7f
B187: C9 0A    cmp #$0a
B189: F0 04    beq $b18f
B18B: C9 0B    cmp #$0b
B18D: D0 09    bne $b198
B18F: A9 00    lda #$00
B191: 9D C8 03 sta $03c8, x
B194: A9 0C    lda #$0c
B196: D0 50    bne $b1e8
B198: AD E0 03 lda $03e0
B19B: C9 08    cmp #$08
B19D: F0 04    beq $b1a3
B19F: C9 05    cmp #$05
B1A1: D0 0F    bne $b1b2
B1A3: A5 56    lda $56
B1A5: 29 10    and #$10
B1A7: 4A       lsr a
B1A8: 4A       lsr a
B1A9: 4A       lsr a
B1AA: 45 4C    eor $4c
B1AC: 29 02    and #$02
B1AE: F0 10    beq $b1c0
B1B0: D0 4A    bne $b1fc
B1B2: AD E9 03 lda $03e9
B1B5: 29 10    and #$10
B1B7: 4A       lsr a
B1B8: 4A       lsr a
B1B9: 4A       lsr a
B1BA: 45 4C    eor $4c
B1BC: 29 02    and #$02
B1BE: D0 3C    bne $b1fc
B1C0: A6 4C    ldx $4c
B1C2: BD 16 03 lda $0316, x
B1C5: 29 7F    and #$7f
B1C7: C9 0B    cmp #$0b
B1C9: D0 1A    bne $b1e5
B1CB: A5 4C    lda $4c
B1CD: 49 01    eor #$01
B1CF: A8       tay
B1D0: B9 0A 03 lda $030a, y
B1D3: 10 27    bpl $b1fc
B1D5: A5 F5    lda $f5
B1D7: 30 0C    bmi $b1e5
B1D9: D0 06    bne $b1e1
B1DB: A5 E7    lda $e7
B1DD: C9 38    cmp #$38
B1DF: 90 04    bcc $b1e5
B1E1: A9 0D    lda #$0d
B1E3: D0 03    bne $b1e8
B1E5: 20 FE B1 jsr $b1fe
B1E8: A6 4C    ldx $4c
B1EA: 09 80    ora #$80
B1EC: 85 02    sta $02
B1EE: 5D 1A 03 eor $031a, x
B1F1: 29 7F    and #$7f
B1F3: F0 05    beq $b1fa
B1F5: A5 02    lda $02
B1F7: 9D 27 03 sta $0327, x
B1FA: 38       sec
B1FB: 60       rts
B1FC: 18       clc
B1FD: 60       rts
B1FE: 20 B9 C7 jsr $c7b9
B201: A6 4C    ldx $4c
B203: BD 37 03 lda $0337, x
B206: 29 80    and #$80
B208: DD E9 B2 cmp $b2e9, x
B20B: D0 16    bne $b223
B20D: 20 09 CA jsr $ca09
B210: AD E0 03 lda $03e0
B213: C9 05    cmp #$05
B215: 90 04    bcc $b21b
B217: C9 0A    cmp #$0a
B219: 90 08    bcc $b223
B21B: BD 90 03 lda $0390, x
B21E: 1D 98 03 ora $0398, x
B221: D0 14    bne $b237
B223: BD 53 03 lda $0353, x
B226: C9 18    cmp #$18
B228: B0 0A    bcs $b234
B22A: BD 4F 03 lda $034f, x
B22D: C9 18    cmp #$18
B22F: B0 03    bcs $b234
B231: 4C D2 B2 jmp $b2d2
B234: 4C 81 B2 jmp $b281
B237: A9 00    lda #$00
B239: 85 01    sta $01
B23B: BD 90 03 lda $0390, x
B23E: 38       sec
B23F: F5 B9    sbc $b9, x
B241: B0 06    bcs $b249
B243: 49 FF    eor #$ff
B245: 69 01    adc #$01
B247: E6 01    inc $01
B249: 85 00    sta $00
B24B: C9 18    cmp #$18
B24D: B0 D4    bcs $b223
B24F: BD 98 03 lda $0398, x
B252: C9 58    cmp #$58
B254: B0 DE    bcs $b234
B256: C9 30    cmp #$30
B258: 90 0A    bcc $b264
B25A: A5 00    lda $00
B25C: C9 10    cmp #$10
B25E: B0 D4    bcs $b234
B260: A9 12    lda #$12
B262: D0 10    bne $b274
B264: A9 0F    lda #$0f
B266: A4 00    ldy $00
B268: C0 08    cpy #$08
B26A: 90 08    bcc $b274
B26C: A9 15    lda #$15
B26E: A4 01    ldy $01
B270: F0 02    beq $b274
B272: A9 16    lda #$16
B274: 48       pha
B275: BD 37 03 lda $0337, x
B278: 29 80    and #$80
B27A: 49 C0    eor #$c0
B27C: 9D 2B 03 sta $032b, x
B27F: 68       pla
B280: 60       rts
B281: AD E9 03 lda $03e9
B284: 29 0F    and #$0f
B286: C9 0F    cmp #$0f
B288: D0 09    bne $b293
B28A: BD 73 03 lda $0373, x
B28D: 29 0F    and #$0f
B28F: C9 09    cmp #$09
B291: B0 3F    bcs $b2d2
B293: AD EA 03 lda $03ea
B296: 85 9C    sta $9c
B298: AD EB 03 lda $03eb
B29B: 85 AA    sta $aa
B29D: AD EC 03 lda $03ec
B2A0: 85 C6    sta $c6
B2A2: AD ED 03 lda $03ed
B2A5: 85 D4    sta $d4
B2A7: A9 0D    lda #$0d
B2A9: 20 4A B4 jsr $b44a
B2AC: A6 4C    ldx $4c
B2AE: 9D 2B 03 sta $032b, x
B2B1: A0 13    ldy #$13
B2B3: C9 D0    cmp #$d0
B2B5: B0 19    bcs $b2d0
B2B7: C9 30    cmp #$30
B2B9: 90 15    bcc $b2d0
B2BB: A0 14    ldy #$14
B2BD: C9 50    cmp #$50
B2BF: 90 04    bcc $b2c5
B2C1: C9 B0    cmp #$b0
B2C3: 90 0B    bcc $b2d0
B2C5: A0 10    ldy #$10
B2C7: BD 4F 03 lda $034f, x
B2CA: C9 40    cmp #$40
B2CC: 90 02    bcc $b2d0
B2CE: A0 11    ldy #$11
B2D0: 98       tya
B2D1: 60       rts
B2D2: A0 0F    ldy #$0f
B2D4: BD 53 03 lda $0353, x
B2D7: C9 10    cmp #$10
B2D9: 90 F5    bcc $b2d0
B2DB: A0 15    ldy #$15
B2DD: AD EC 03 lda $03ec
B2E0: D5 B9    cmp $b9, x
B2E2: B0 EC    bcs $b2d0
B2E4: A0 16    ldy #$16
B2E6: 4C D0 B2 jmp $b2d0

B2ED: A6 4C    ldx $4c
B2EF: A5 00    lda $00
B2F1: 29 20    and #$20
B2F3: F0 69    beq $b35e
B2F5: A5 56    lda $56
B2F7: 29 20    and #$20
B2F9: D0 5E    bne $b359
B2FB: BD 0E 03 lda $030e, x
B2FE: 30 60    bmi $b360
B300: 29 28    and #$28
B302: D0 5A    bne $b35e
B304: A5 4F    lda $4f
B306: 10 43    bpl $b34b
B308: A5 56    lda $56
B30A: 29 10    and #$10
B30C: 4A       lsr a
B30D: 4A       lsr a
B30E: 4A       lsr a
B30F: 45 4C    eor $4c
B311: 29 02    and #$02
B313: D0 08    bne $b31d
B315: A5 56    lda $56
B317: 29 0F    and #$0f
B319: F0 43    beq $b35e
B31B: D0 21    bne $b33e
B31D: AD E0 03 lda $03e0
B320: F0 1C    beq $b33e
B322: C9 05    cmp #$05
B324: 90 18    bcc $b33e
B326: 8A       txa
B327: 4A       lsr a
B328: A8       tay
B329: B9 5F 00 lda $005f, y
B32C: C5 4C    cmp $4c
B32E: F0 09    beq $b339
B330: 8A       txa
B331: 49 01    eor #$01
B333: A8       tay
B334: B9 0A 03 lda $030a, y
B337: 10 25    bpl $b35e
B339: A9 0E    lda #$0e
B33B: 4C E8 B1 jmp $b1e8
B33E: BD 1A 03 lda $031a, x
B341: 29 7F    and #$7f
B343: C9 09    cmp #$09
B345: D0 04    bne $b34b
B347: A0 0B    ldy #$0b
B349: D0 02    bne $b34d
B34B: A0 0A    ldy #$0a
B34D: A9 00    lda #$00
B34F: 9D D4 03 sta $03d4, x
B352: 9D D0 03 sta $03d0, x
B355: 98       tya
B356: 4C E8 B1 jmp $b1e8
B359: A9 04    lda #$04
B35B: 9D DC 03 sta $03dc, x
B35E: 18       clc
B35F: 60       rts
B360: BD 1A 03 lda $031a, x
B363: 29 7F    and #$7f
B365: C9 0A    cmp #$0a
B367: F0 04    beq $b36d
B369: C9 0B    cmp #$0b
B36B: D0 F1    bne $b35e
B36D: A9 00    lda #$00
B36F: 9D D4 03 sta $03d4, x
B372: A0 01    ldy #$01
B374: A5 4F    lda $4f
B376: C5 4C    cmp $4c
B378: D0 02    bne $b37c
B37A: A0 03    ldy #$03
B37C: 84 00    sty $00
B37E: FE D0 03 inc $03d0, x
B381: BD D0 03 lda $03d0, x
B384: 38       sec
B385: E5 00    sbc $00
B387: 90 09    bcc $b392
B389: C9 04    cmp #$04
B38B: 90 02    bcc $b38f
B38D: A9 03    lda #$03
B38F: 9D D4 03 sta $03d4, x
B392: 18       clc
B393: 60       rts
B394: A6 4C    ldx $4c
B396: BD 0E 03 lda $030e, x
B399: 29 08    and #$08
B39B: F0 1E    beq $b3bb
B39D: A4 01    ldy $01
B39F: B9 CE B3 lda $b3ce, y
B3A2: F0 28    beq $b3cc
B3A4: 9D 2B 03 sta $032b, x
B3A7: E0 02    cpx #$02
B3A9: 90 0B    bcc $b3b6
B3AB: BD 2B 03 lda $032b, x
B3AE: 49 FF    eor #$ff
B3B0: 18       clc
B3B1: 69 01    adc #$01
B3B3: 9D 2B 03 sta $032b, x
B3B6: A9 18    lda #$18
B3B8: 4C E8 B1 jmp $b1e8
B3BB: A4 01    ldy $01
B3BD: B9 DC B3 lda $b3dc, y
B3C0: 9D 2B 03 sta $032b, x
B3C3: C0 00    cpy #$00
B3C5: F0 05    beq $b3cc
B3C7: A9 09    lda #$09
B3C9: 4C E8 B1 jmp $b1e8
B3CC: 18       clc
B3CD: 60       rts

B3EC: A6 4C    ldx $4c
B3EE: BD 0E 03 lda $030e, x
B3F1: 29 08    and #$08
B3F3: F0 04    beq $b3f9
B3F5: A9 17    lda #$17
B3F7: D0 13    bne $b40c
B3F9: A5 4F    lda $4f
B3FB: 30 04    bmi $b401
B3FD: A9 03    lda #$03
B3FF: D0 0B    bne $b40c
B401: A5 56    lda $56
B403: 4A       lsr a
B404: 4A       lsr a
B405: 4A       lsr a
B406: 45 4C    eor $4c
B408: 29 02    and #$02
B40A: A9 00    lda #$00
B40C: 4C E8 B1 jmp $b1e8
B40F: A5 00    lda $00
B411: 29 10    and #$10
B413: F0 0A    beq $b41f
B415: A9 00    lda #$00
B417: 9D D8 03 sta $03d8, x
B41A: A9 19    lda #$19
B41C: 4C E8 B1 jmp $b1e8
B41F: FE D8 03 inc $03d8, x
B422: BD D8 03 lda $03d8, x
B425: C9 90    cmp #$90
B427: B0 EC    bcs $b415
B429: 60       rts
B42A: BD 1A 03 lda $031a, x
B42D: 29 7F    and #$7f
B42F: C9 19    cmp #$19
B431: D0 12    bne $b445
B433: BD 0E 03 lda $030e, x
B436: 29 08    and #$08
B438: D0 0B    bne $b445
B43A: A5 00    lda $00
B43C: 29 10    and #$10
B43E: F0 05    beq $b445
B440: A9 1B    lda #$1b
B442: 4C E8 B1 jmp $b1e8
B445: 18       clc
B446: 60       rts
B447: 38       sec
B448: B0 01    bcs $b44b
B44A: 18       clc
B44B: 85 1B    sta $1b
B44D: 8A       txa
B44E: 48       pha
B44F: 98       tya
B450: 48       pha
B451: 08       php
B452: A6 1B    ldx $1b
B454: B5 8F    lda $8f, x
B456: 85 10    sta $10
B458: B5 9D    lda $9d, x
B45A: 85 11    sta $11
B45C: B5 B9    lda $b9, x
B45E: 85 12    sta $12
B460: B5 C7    lda $c7, x
B462: 85 13    sta $13
B464: 4C 70 B4 jmp $b470
B467: 38       sec
B468: B0 01    bcs $b46b
B46A: 18       clc
B46B: 8A       txa
B46C: 48       pha
B46D: 98       tya
B46E: 48       pha
B46F: 08       php
B470: A6 4C    ldx $4c
B472: B5 8F    lda $8f, x
B474: 85 14    sta $14
B476: B5 9D    lda $9d, x
B478: 85 15    sta $15
B47A: B5 B9    lda $b9, x
B47C: 85 16    sta $16
B47E: B5 C7    lda $c7, x
B480: 85 17    sta $17
B482: 4C 8E B4 jmp $b48e
B485: 38       sec
B486: B0 01    bcs $b489
B488: 18       clc
B489: 8A       txa
B48A: 48       pha
B48B: 98       tya
B48C: 48       pha
B48D: 08       php
B48E: A9 00    lda #$00
B490: 85 03    sta $03
B492: 38       sec
B493: A5 10    lda $10
B495: E5 14    sbc $14
B497: 85 04    sta $04
B499: A5 11    lda $11
B49B: E5 15    sbc $15
B49D: 85 05    sta $05
B49F: 10 16    bpl $b4b7
B4A1: 49 FF    eor #$ff
B4A3: 85 05    sta $05
B4A5: A5 04    lda $04
B4A7: 49 FF    eor #$ff
B4A9: 69 01    adc #$01
B4AB: 85 04    sta $04
B4AD: A5 05    lda $05
B4AF: 69 00    adc #$00
B4B1: 85 05    sta $05
B4B3: A9 01    lda #$01
B4B5: 85 03    sta $03
B4B7: A9 00    lda #$00
B4B9: 85 00    sta $00
B4BB: 38       sec
B4BC: A5 12    lda $12
B4BE: E5 16    sbc $16
B4C0: 85 01    sta $01
B4C2: A5 13    lda $13
B4C4: E5 17    sbc $17
B4C6: 85 02    sta $02
B4C8: 10 16    bpl $b4e0
B4CA: 49 FF    eor #$ff
B4CC: 85 02    sta $02
B4CE: A5 01    lda $01
B4D0: 49 FF    eor #$ff
B4D2: 69 01    adc #$01
B4D4: 85 01    sta $01
B4D6: A5 02    lda $02
B4D8: 69 00    adc #$00
B4DA: 85 02    sta $02
B4DC: A9 01    lda #$01
B4DE: 85 00    sta $00
B4E0: A5 00    lda $00
B4E2: 0A       asl a
B4E3: 05 03    ora $03
B4E5: 85 07    sta $07
B4E7: 28       plp
B4E8: 90 45    bcc $b52f
B4EA: A5 01    lda $01
B4EC: E5 04    sbc $04
B4EE: 85 1B    sta $1b
B4F0: A5 02    lda $02
B4F2: E5 05    sbc $05
B4F4: 85 1C    sta $1c
B4F6: A6 07    ldx $07
B4F8: BD 3B B5 lda $b53b, x
B4FB: 85 1D    sta $1d
B4FD: B0 1B    bcs $b51a
B4FF: A9 04    lda #$04
B501: 05 07    ora $07
B503: 85 07    sta $07
B505: A5 02    lda $02
B507: D0 06    bne $b50f
B509: A9 08    lda #$08
B50B: C5 01    cmp $01
B50D: B0 11    bcs $b520
B50F: A5 1D    lda $1d
B511: 49 FF    eor #$ff
B513: 18       clc
B514: 69 01    adc #$01
B516: 85 1D    sta $1d
B518: D0 0A    bne $b524
B51A: A9 03    lda #$03
B51C: C5 1B    cmp $1b
B51E: B0 04    bcs $b524
B520: A9 00    lda #$00
B522: 85 1D    sta $1d
B524: A6 07    ldx $07
B526: BD BA B5 lda $b5ba, x
B529: 18       clc
B52A: 65 1D    adc $1d
B52C: 4C 32 B5 jmp $b532
B52F: 20 3F B5 jsr $b53f
B532: 85 1D    sta $1d
B534: 68       pla
B535: A8       tay
B536: 68       pla
B537: AA       tax
B538: A5 1D    lda $1d
B53A: 60       rts

B53F: A5 10    lda $10
B541: 48       pha
B542: A5 11    lda $11
B544: 48       pha
B545: A5 12    lda $12
B547: 48       pha
B548: A5 13    lda $13
B54A: 48       pha
B54B: A5 01    lda $01
B54D: 38       sec
B54E: E5 04    sbc $04
B550: A5 02    lda $02
B552: E5 05    sbc $05
B554: 90 0D    bcc $b563
B556: A5 01    lda $01
B558: 85 12    sta $12
B55A: A5 02    lda $02
B55C: A6 04    ldx $04
B55E: A4 05    ldy $05
B560: 4C 73 B5 jmp $b573
B563: A9 04    lda #$04
B565: 05 07    ora $07
B567: 85 07    sta $07
B569: A5 04    lda $04
B56B: 85 12    sta $12
B56D: A5 05    lda $05
B56F: A6 01    ldx $01
B571: A4 02    ldy $02
B573: 85 13    sta $13
B575: 86 10    stx $10
B577: 84 11    sty $11
B579: A0 04    ldy #$04
B57B: 06 10    asl $10
B57D: 26 11    rol $11
B57F: 88       dey
B580: 10 F9    bpl $b57b
B582: A5 14    lda $14
B584: 48       pha
B585: A5 15    lda $15
B587: 48       pha
B588: 20 2E D0 jsr $d02e
B58B: 68       pla
B58C: 85 15    sta $15
B58E: 68       pla
B58F: 85 14    sta $14
B591: A6 07    ldx $07
B593: A5 10    lda $10
B595: BC B2 B5 ldy $b5b2, x
B598: F0 05    beq $b59f
B59A: 49 FF    eor #$ff
B59C: 18       clc
B59D: 69 01    adc #$01
B59F: 18       clc
B5A0: 7D BA B5 adc $b5ba, x
B5A3: AA       tax
B5A4: 68       pla
B5A5: 85 13    sta $13
B5A7: 68       pla
B5A8: 85 12    sta $12
B5AA: 68       pla
B5AB: 85 11    sta $11
B5AD: 68       pla
B5AE: 85 10    sta $10
B5B0: 8A       txa
B5B1: 60       rts

B5C2: A6 4C    ldx $4c
B5C4: BD 54 02 lda $0254, x
B5C7: 85 00    sta $00
B5C9: BD 61 02 lda $0261, x
B5CC: 85 01    sta $01
B5CE: 20 7C B6 jsr $b67c
B5D1: A5 10    lda $10
B5D3: 9D 6E 02 sta $026e, x
B5D6: 18       clc
B5D7: 75 81    adc $81, x
B5D9: 95 81    sta $81, x
B5DB: A5 11    lda $11
B5DD: 9D 7B 02 sta $027b, x
B5E0: 08       php
B5E1: 75 8F    adc $8f, x
B5E3: 95 8F    sta $8f, x
B5E5: B5 9D    lda $9d, x
B5E7: 69 00    adc #$00
B5E9: 28       plp
B5EA: 10 03    bpl $b5ef
B5EC: 18       clc
B5ED: 69 FF    adc #$ff
B5EF: 95 9D    sta $9d, x
B5F1: A5 12    lda $12
B5F3: 9D 88 02 sta $0288, x
B5F6: 18       clc
B5F7: 75 AB    adc $ab, x
B5F9: 95 AB    sta $ab, x
B5FB: A5 13    lda $13
B5FD: 9D 95 02 sta $0295, x
B600: 08       php
B601: 75 B9    adc $b9, x
B603: 95 B9    sta $b9, x
B605: B5 C7    lda $c7, x
B607: 69 00    adc #$00
B609: 28       plp
B60A: 10 03    bpl $b60f
B60C: 18       clc
B60D: 69 FF    adc #$ff
B60F: 95 C7    sta $c7, x
B611: 60       rts
B612: A6 4C    ldx $4c
B614: B5 AB    lda $ab, x
B616: 18       clc
B617: 7D 88 02 adc $0288, x
B61A: 95 AB    sta $ab, x
B61C: BD 95 02 lda $0295, x
B61F: 08       php
B620: 75 B9    adc $b9, x
B622: 95 B9    sta $b9, x
B624: B5 C7    lda $c7, x
B626: 69 00    adc #$00
B628: 28       plp
B629: 10 03    bpl $b62e
B62B: 18       clc
B62C: 69 FF    adc #$ff
B62E: 95 C7    sta $c7, x
B630: B5 D5    lda $d5, x
B632: 18       clc
B633: 7D A2 02 adc $02a2, x
B636: 95 D5    sta $d5, x
B638: BD AF 02 lda $02af, x
B63B: 08       php
B63C: 75 E3    adc $e3, x
B63E: 95 E3    sta $e3, x
B640: B5 F1    lda $f1, x
B642: 69 00    adc #$00
B644: 28       plp
B645: 10 03    bpl $b64a
B647: 18       clc
B648: 69 FF    adc #$ff
B64A: 95 F1    sta $f1, x
B64C: BD 6E 02 lda $026e, x
B64F: 18       clc
B650: 75 81    adc $81, x
B652: 95 81    sta $81, x
B654: BD 7B 02 lda $027b, x
B657: 08       php
B658: 75 8F    adc $8f, x
B65A: 95 8F    sta $8f, x
B65C: B5 9D    lda $9d, x
B65E: 69 00    adc #$00
B660: 28       plp
B661: 10 03    bpl $b666
B663: 18       clc
B664: 69 FF    adc #$ff
B666: 95 9D    sta $9d, x
B668: BD A2 02 lda $02a2, x
B66B: 38       sec
B66C: FD BC 02 sbc $02bc, x
B66F: 9D A2 02 sta $02a2, x
B672: BD AF 02 lda $02af, x
B675: FD C9 02 sbc $02c9, x
B678: 9D AF 02 sta $02af, x
B67B: 60       rts
B67C: 48       pha
B67D: 8A       txa
B67E: 48       pha
B67F: 98       tya
B680: 48       pha
B681: 20 8D B6 jsr $b68d
B684: 20 BE B6 jsr $b6be
B687: 68       pla
B688: A8       tay
B689: 68       pla
B68A: AA       tax
B68B: 68       pla
B68C: 60       rts
B68D: A5 00    lda $00
B68F: 29 60    and #$60
B691: 4A       lsr a
B692: 4A       lsr a
B693: 4A       lsr a
B694: 4A       lsr a
B695: A8       tay
B696: BE B6 B6 ldx $b6b6, y
B699: B9 B7 B6 lda $b6b7, y
B69C: 08       php
B69D: A5 00    lda $00
B69F: 29 1F    and #$1f
B6A1: 95 02    sta $02, x
B6A3: 28       plp
B6A4: 10 07    bpl $b6ad
B6A6: A9 20    lda #$20
B6A8: 38       sec
B6A9: F5 02    sbc $02, x
B6AB: 95 02    sta $02, x
B6AD: 8A       txa
B6AE: 49 01    eor #$01
B6B0: AA       tax
B6B1: A9 20    lda #$20
B6B3: 95 02    sta $02, x
B6B5: 60       rts

B6BE: A2 00    ldx #$00
B6C0: A0 00    ldy #$00
B6C2: A9 00    lda #$00
B6C4: 85 11    sta $11
B6C6: 85 13    sta $13
B6C8: B5 02    lda $02, x
B6CA: 85 10    sta $10
B6CC: A5 01    lda $01
B6CE: 85 12    sta $12
B6D0: 20 29 D1 jsr $d129
B6D3: A5 14    lda $14
B6D5: 99 04 00 sta $0004, y
B6D8: A5 15    lda $15
B6DA: 99 05 00 sta $0005, y
B6DD: C8       iny
B6DE: C8       iny
B6DF: E8       inx
B6E0: E0 02    cpx #$02
B6E2: 90 DE    bcc $b6c2
B6E4: A2 03    ldx #$03
B6E6: B5 04    lda $04, x
B6E8: 95 10    sta $10, x
B6EA: CA       dex
B6EB: 10 F9    bpl $b6e6
B6ED: A5 00    lda $00
B6EF: 29 C0    and #$c0
B6F1: 4A       lsr a
B6F2: 4A       lsr a
B6F3: 4A       lsr a
B6F4: 4A       lsr a
B6F5: 4A       lsr a
B6F6: A8       tay
B6F7: A2 00    ldx #$00
B6F9: B9 17 B7 lda $b717, y
B6FC: 10 11    bpl $b70f
B6FE: B5 10    lda $10, x
B700: 49 FF    eor #$ff
B702: 18       clc
B703: 69 01    adc #$01
B705: 95 10    sta $10, x
B707: B5 11    lda $11, x
B709: 49 FF    eor #$ff
B70B: 69 00    adc #$00
B70D: 95 11    sta $11, x
B70F: C8       iny
B710: E8       inx
B711: E8       inx
B712: E0 04    cpx #$04
B714: 90 E3    bcc $b6f9
B716: 60       rts

B71F: 85 1B    sta $1b
B721: 8A       txa
B722: 48       pha
B723: 98       tya
B724: 48       pha
B725: A6 1B    ldx $1b
B727: A9 00    lda #$00
B729: 85 1B    sta $1b
B72B: 85 1D    sta $1d
B72D: 85 24    sta $24
B72F: B5 8F    lda $8f, x
B731: 85 29    sta $29
B733: B5 9D    lda $9d, x
B735: 30 5B    bmi $b792
B737: F0 22    beq $b75b
B739: C9 02    cmp #$02
B73B: B0 51    bcs $b78e
B73D: E6 24    inc $24
B73F: B5 8F    lda $8f, x
B741: C9 C0    cmp #$c0
B743: B0 09    bcs $b74e
B745: C9 90    cmp #$90
B747: 90 05    bcc $b74e
B749: 38       sec
B74A: E9 08    sbc #$08
B74C: 85 29    sta $29
B74E: 18       clc
B74F: A5 29    lda $29
B751: 49 FF    eor #$ff
B753: 69 01    adc #$01
B755: 85 29    sta $29
B757: D0 02    bne $b75b
B759: E6 1D    inc $1d
B75B: B5 C7    lda $c7, x
B75D: 10 05    bpl $b764
B75F: A0 07    ldy #$07
B761: 4C 78 B7 jmp $b778
B764: B5 B9    lda $b9, x
B766: 85 1B    sta $1b
B768: A9 00    lda #$00
B76A: A0 00    ldy #$00
B76C: 18       clc
B76D: 79 A5 B8 adc $b8a5, y
B770: C5 1B    cmp $1b
B772: B0 04    bcs $b778
B774: C8       iny
B775: 4C 6D B7 jmp $b76d
B778: A5 1D    lda $1d
B77A: D0 19    bne $b795
B77C: 84 2A    sty $2a
B77E: 98       tya
B77F: 0A       asl a
B780: A8       tay
B781: B9 A7 B7 lda table_b7a7, y
B784: 85 1B    sta $1b
B786: B9 A8 B7 lda $b7a8, y
B789: 85 1C    sta $1c
B78B: 6C 1B 00 jmp ($001b)        ; [indirect_jump]
B78E: A9 01    lda #$01
B790: 85 1B    sta $1b
B792: 4C 94 B8 jmp $b894
B795: C0 03    cpy #$03
B797: D0 08    bne $b7a1
B799: B5 B9    lda $b9, x
B79B: C9 40    cmp #$40
B79D: 90 02    bcc $b7a1
B79F: A0 08    ldy #$08
B7A1: B9 05 B9 lda $b905, y
B7A4: 4C 9C B8 jmp $b89c

B7B7: 46 2A    lsr $2a
B7B9: A5 29    lda $29
B7BB: C9 F8    cmp #$f8
B7BD: B0 20    bcs $b7df
B7BF: A5 2A    lda $2a
B7C1: 0A       asl a
B7C2: 65 2A    adc $2a
B7C4: A8       tay
B7C5: A9 00    lda #$00
B7C7: 18       clc
B7C8: 79 AD B8 adc $b8ad, y
B7CB: C5 29    cmp $29
B7CD: B0 04    bcs $b7d3
B7CF: C8       iny
B7D0: 4C C8 B7 jmp $b7c8
B7D3: B5 9D    lda $9d, x
B7D5: 0A       asl a
B7D6: 0A       asl a
B7D7: 0A       asl a
B7D8: 0A       asl a
B7D9: 19 B9 B8 ora $b8b9, y
B7DC: 4C 9C B8 jmp $b89c
B7DF: A4 2A    ldy $2a
B7E1: B9 C5 B8 lda $b8c5, y
B7E4: 4C 9C B8 jmp $b89c
B7E7: 38       sec
B7E8: A5 2A    lda $2a
B7EA: E9 02    sbc #$02
B7EC: 85 2A    sta $2a
B7EE: A5 29    lda $29
B7F0: C9 F0    cmp #$f0
B7F2: B0 62    bcs $b856
B7F4: 06 2A    asl $2a
B7F6: A5 2A    lda $2a
B7F8: 0A       asl a
B7F9: 65 2A    adc $2a
B7FB: A8       tay
B7FC: A9 00    lda #$00
B7FE: 85 27    sta $27
B800: 18       clc
B801: 79 C9 B8 adc $b8c9, y
B804: C5 29    cmp $29
B806: B0 06    bcs $b80e
B808: C8       iny
B809: E6 27    inc $27
B80B: 4C 01 B8 jmp $b801
B80E: A5 27    lda $27
B810: F0 10    beq $b822
B812: C9 02    cmp #$02
B814: F0 0C    beq $b822
B816: B5 9D    lda $9d, x
B818: 0A       asl a
B819: 0A       asl a
B81A: 0A       asl a
B81B: 0A       asl a
B81C: 19 DB B8 ora $b8db, y
B81F: 4C 9C B8 jmp $b89c
B822: 4A       lsr a
B823: 65 2A    adc $2a
B825: 0A       asl a
B826: A8       tay
B827: A5 29    lda $29
B829: D9 ED B8 cmp $b8ed, y
B82C: 90 1C    bcc $b84a
B82E: 38       sec
B82F: F9 ED B8 sbc $b8ed, y
B832: 85 26    sta $26
B834: A5 27    lda $27
B836: F0 05    beq $b83d
B838: A5 26    lda $26
B83A: 0A       asl a
B83B: 85 26    sta $26
B83D: A5 26    lda $26
B83F: 0A       asl a
B840: 0A       asl a
B841: 79 EE B8 adc $b8ee, y
B844: D5 B9    cmp $b9, x
B846: 90 02    bcc $b84a
B848: E6 27    inc $27
B84A: 18       clc
B84B: A5 2A    lda $2a
B84D: 0A       asl a
B84E: 65 2A    adc $2a
B850: 65 27    adc $27
B852: A8       tay
B853: 4C 16 B8 jmp $b816
B856: 38       sec
B857: B5 8F    lda $8f, x
B859: E9 F0    sbc #$f0
B85B: 85 29    sta $29
B85D: A5 2A    lda $2a
B85F: 0A       asl a
B860: A8       tay
B861: A5 29    lda $29
B863: C9 18    cmp #$18
B865: B0 16    bcs $b87d
B867: D9 F9 B8 cmp $b8f9, y
B86A: 90 12    bcc $b87e
B86C: F9 F9 B8 sbc $b8f9, y
B86F: 0A       asl a
B870: 0A       asl a
B871: 85 24    sta $24
B873: 38       sec
B874: B9 FA B8 lda $b8fa, y
B877: E5 24    sbc $24
B879: D5 B9    cmp $b9, x
B87B: B0 01    bcs $b87e
B87D: C8       iny
B87E: B9 FF B8 lda $b8ff, y
B881: 4C 9C B8 jmp $b89c
B884: B5 9D    lda $9d, x
B886: 85 1B    sta $1b
B888: A5 29    lda $29
B88A: C9 F8    cmp #$f8
B88C: 90 06    bcc $b894
B88E: A5 1B    lda $1b
B890: 49 01    eor #$01
B892: 85 1B    sta $1b
B894: A5 1B    lda $1b
B896: 0A       asl a
B897: 0A       asl a
B898: 0A       asl a
B899: 0A       asl a
B89A: 09 0F    ora #$0f
B89C: 85 1B    sta $1b
B89E: 68       pla
B89F: A8       tay
B8A0: 68       pla
B8A1: AA       tax
B8A2: A5 1B    lda $1b
B8A4: 60       rts

B90E: 85 1B    sta $1b
B910: 98       tya
B911: 48       pha
B912: A5 1B    lda $1b
B914: C9 00    cmp #$00
B916: F0 3D    beq $b955
B918: 8A       txa
B919: 4A       lsr a
B91A: 49 01    eor #$01
B91C: A8       tay
B91D: B9 4D 00 lda $004d, y
B920: A8       tay
B921: B9 73 03 lda $0373, y
B924: 49 10    eor #$10
B926: DD 73 03 cmp $0373, x
B929: D0 2A    bne $b955
B92B: A9 7C    lda #$7c
B92D: 85 10    sta $10
B92F: A9 B9    lda #$b9
B931: 85 11    sta $11
B933: BD 12 03 lda $0312, x
B936: 0A       asl a
B937: 65 10    adc $10
B939: 85 10    sta $10
B93B: A5 11    lda $11
B93D: 69 00    adc #$00
B93F: 85 11    sta $11
B941: 20 09 66 jsr $6609
B944: A5 1B    lda $1b
B946: F0 0D    beq $b955
B948: A9 01    lda #$01
B94A: 9D C8 03 sta $03c8, x
B94D: A9 00    lda #$00
B94F: 9D D4 03 sta $03d4, x
B952: 4C 79 B9 jmp $b979
B955: A9 00    lda #$00
B957: 9D C8 03 sta $03c8, x
B95A: A9 A6    lda #$a6
B95C: 85 10    sta $10
B95E: A9 B9    lda #$b9
B960: 85 11    sta $11
B962: BD 12 03 lda $0312, x
B965: 0A       asl a
B966: 0A       asl a
B967: 65 10    adc $10
B969: 85 10    sta $10
B96B: A5 11    lda $11
B96D: 69 00    adc #$00
B96F: 85 11    sta $11
B971: 20 09 66 jsr $6609
B974: A5 1B    lda $1b
B976: 9D D4 03 sta $03d4, x
B979: 68       pla
B97A: A8       tay
B97B: 60       rts


B9FA: A5 46    lda $46
B9FC: 29 08    and #$08
B9FE: D0 79    bne $ba79
BA00: A9 04    lda #$04
BA02: 85 4C    sta $4c
BA04: A9 16    lda #$16
BA06: 85 69    sta $69
BA08: 20 7A BA jsr $ba7a
BA0B: A6 4F    ldx $4f
BA0D: 30 07    bmi $ba16
BA0F: BD 0E 03 lda $030e, x
BA12: 29 08    and #$08
BA14: D0 23    bne $ba39
BA16: 20 BA BC jsr $bcba
BA19: BD 3E 02 lda $023e, x
BA1C: 09 01    ora #$01
BA1E: 9D 3E 02 sta $023e, x
BA21: A5 E7    lda $e7
BA23: 48       pha
BA24: 18       clc
BA25: 69 08    adc #$08
BA27: 85 E7    sta $e7
BA29: A5 F5    lda $f5
BA2B: 48       pha
BA2C: 69 00    adc #$00
BA2E: 85 F5    sta $f5
BA30: 20 B5 E1 jsr $e1b5
BA33: 68       pla
BA34: 85 F5    sta $f5
BA36: 68       pla
BA37: 85 E7    sta $e7
BA39: A5 4C    lda $4c
BA3B: 20 1F B7 jsr $b71f
BA3E: 8D 77 03 sta $0377
BA41: AD 13 04 lda $0413
BA44: D0 17    bne $ba5d
BA46: AD 77 03 lda $0377
BA49: 29 0F    and #$0f
BA4B: C9 0F    cmp #$0f
BA4D: D0 0E    bne $ba5d
BA4F: AD E9 03 lda $03e9
BA52: 29 0F    and #$0f
BA54: C9 0F    cmp #$0f
BA56: D0 05    bne $ba5d
BA58: A9 10    lda #$10
BA5A: 8D 13 04 sta $0413
BA5D: AD 13 04 lda $0413
BA60: F0 08    beq $ba6a
BA62: CE 13 04 dec $0413
BA65: D0 03    bne $ba6a
BA67: 20 1B BC jsr $bc1b
BA6A: AD 14 04 lda $0414
BA6D: F0 0A    beq $ba79
BA6F: CE 14 04 dec $0414
BA72: D0 05    bne $ba79
BA74: A9 36    lda #$36
BA76: 20 B8 D7 jsr $d7b8
BA79: 60       rts
BA7A: AD E0 03 lda $03e0
BA7D: 0A       asl a
BA7E: A8       tay
BA7F: B9 8C BA lda table_ba8c, y
BA82: 85 10    sta $10
BA84: B9 8D BA lda $ba8d, y
BA87: 85 11    sta $11
BA89: 6C 10 00 jmp ($0010)        ; [indirect_jump]

BAA8: AE BA 11 ldx $11ba
BAAB: BC 97 BC ldy $bc97, x
BAAE: AD E0 03 lda $03e0
BAB1: C9 08    cmp #$08
BAB3: D0 13    bne $bac8
BAB5: AD FF 03 lda $03ff
BAB8: D0 0E    bne $bac8
BABA: A9 00    lda #$00
BABC: 8D 72 02 sta $0272
BABF: 8D 7F 02 sta $027f
BAC2: 8D 8C 02 sta $028c
BAC5: 8D 99 02 sta $0299
BAC8: 20 12 B6 jsr $b612
BACB: A5 F5    lda $f5
BACD: 30 07    bmi $bad6
BACF: 05 E7    ora $e7
BAD1: F0 03    beq $bad6
BAD3: 4C A9 BB jmp $bba9
BAD6: EE 0F 04 inc $040f
BAD9: A5 E7    lda $e7
BADB: 49 FF    eor #$ff
BADD: 18       clc
BADE: 69 01    adc #$01
BAE0: 18       clc
BAE1: 65 BD    adc $bd
BAE3: 85 BD    sta $bd
BAE5: A5 CB    lda $cb
BAE7: 69 00    adc #$00
BAE9: 85 CB    sta $cb
BAEB: A9 00    lda #$00
BAED: 85 D9    sta $d9
BAEF: 85 E7    sta $e7
BAF1: 85 F5    sta $f5
BAF3: A9 00    lda #$00
BAF5: 8D A6 02 sta $02a6
BAF8: A9 01    lda #$01
BAFA: 8D B3 02 sta $02b3
BAFD: 20 9F CD jsr $cd9f
BB00: 20 AD CD jsr $cdad
BB03: A9 40    lda #$40
BB05: 8D C0 02 sta $02c0
BB08: A9 00    lda #$00
BB0A: 8D CD 02 sta $02cd
BB0D: AD 0F 04 lda $040f
BB10: C9 01    cmp #$01
BB12: F0 03    beq $bb17
BB14: 4C 96 BB jmp $bb96
BB17: A5 56    lda $56
BB19: 29 30    and #$30
BB1B: 09 09    ora #$09
BB1D: 85 56    sta $56
BB1F: AD E0 03 lda $03e0
BB22: 8D E1 03 sta $03e1
BB25: AD 08 04 lda $0408
BB28: C9 03    cmp #$03
BB2A: 90 05    bcc $bb31
BB2C: A9 36    lda #$36
BB2E: 20 B8 D7 jsr $d7b8
BB31: A9 0B    lda #$0b
BB33: A2 2C    ldx #$2c
BB35: AC E0 03 ldy $03e0
BB38: C0 0A    cpy #$0a
BB3A: D0 0B    bne $bb47
BB3C: A9 0C    lda #$0c
BB3E: E8       inx
BB3F: AC 08 04 ldy $0408
BB42: C0 03    cpy #$03
BB44: 90 01    bcc $bb47
BB46: E8       inx
BB47: 20 B5 A2 jsr $a2b5
BB4A: 8A       txa
BB4B: 20 B8 D7 jsr $d7b8
BB4E: A9 0D    lda #$0d
BB50: 8D E0 03 sta $03e0
BB53: A5 4C    lda $4c
BB55: 20 1F B7 jsr $b71f
BB58: 8D E9 03 sta $03e9
BB5B: 29 0F    and #$0f
BB5D: C9 09    cmp #$09
BB5F: 90 11    bcc $bb72
BB61: A5 53    lda $53
BB63: D0 0D    bne $bb72
BB65: A9 01    lda #$01
BB67: 8D 1F 03 sta $031f
BB6A: A9 33    lda #$33
BB6C: 20 B8 D7 jsr $d7b8
BB6F: 4C A9 BB jmp $bba9
BB72: C9 03    cmp #$03
BB74: B0 1D    bcs $bb93
BB76: A5 93    lda $93
BB78: 38       sec
BB79: E9 08    sbc #$08
BB7B: 85 9C    sta $9c
BB7D: A5 A1    lda $a1
BB7F: E9 00    sbc #$00
BB81: 85 AA    sta $aa
BB83: A5 BD    lda $bd
BB85: 85 C6    sta $c6
BB87: A5 CB    lda $cb
BB89: 85 D4    sta $d4
BB8B: A9 0D    lda #$0d
BB8D: 20 1F B7 jsr $b71f
BB90: 8D E9 03 sta $03e9
BB93: 4C A9 BB jmp $bba9
BB96: C9 02    cmp #$02
BB98: 90 0F    bcc $bba9
BB9A: A9 0F    lda #$0f
BB9C: 8D E0 03 sta $03e0
BB9F: A9 00    lda #$00
BBA1: 8D 0F 04 sta $040f
BBA4: A9 20    lda #$20
BBA6: 8D 12 04 sta $0412
BBA9: A0 00    ldy #$00
BBAB: AD 08 04 lda $0408
BBAE: 49 FF    eor #$ff
BBB0: 29 03    and #$03
BBB2: 4A       lsr a
BBB3: 85 00    sta $00
BBB5: EE DA 02 inc $02da
BBB8: AD DA 02 lda $02da
BBBB: C5 00    cmp $00
BBBD: 90 08    bcc $bbc7
BBBF: A9 00    lda #$00
BBC1: 8D DA 02 sta $02da
BBC4: EE F4 02 inc $02f4
BBC7: AD F4 02 lda $02f4
BBCA: D9 ED BB cmp $bbed, y
BBCD: 90 05    bcc $bbd4
BBCF: A9 00    lda #$00
BBD1: 8D F4 02 sta $02f4
BBD4: B9 F1 BB lda $bbf1, y
BBD7: 18       clc
BBD8: 6D F4 02 adc $02f4
BBDB: 2C 7F 02 bit $027f
BBDE: 30 02    bmi $bbe2
BBE0: 49 80    eor #$80
BBE2: 85 77    sta $77
BBE4: AD 3E 02 lda $023e
BBE7: 09 01    ora #$01
BBE9: 8D 3E 02 sta $023e
BBEC: 60       rts

BBF5: 20 12 B6 jsr $b612
BBF8: A5 F5    lda $f5
BBFA: 30 04    bmi $bc00
BBFC: 05 E7    ora $e7
BBFE: D0 03    bne $bc03
BC00: 4C D6 BA jmp $bad6

BC03: A0 00    ldy #$00
BC05: AD 08 04 lda $0408
BC08: C9 03    cmp #$03
BC0A: 90 02    bcc $bc0e
BC0C: A0 02    ldy #$02
BC0E: 4C AB BB jmp $bbab
BC11: AD 12 04 lda $0412
BC14: F0 05    beq $bc1b
BC16: CE 12 04 dec $0412
BC19: D0 6B    bne $bc86
BC1B: AD E2 03 lda $03e2
BC1E: 10 15    bpl $bc35
BC20: AD E9 03 lda $03e9
BC23: 29 0F    and #$0f
BC25: C9 09    cmp #$09
BC27: 90 09    bcc $bc32
BC29: AD 11 04 lda $0411
BC2C: 0A       asl a
BC2D: 0A       asl a
BC2E: 0A       asl a
BC2F: 4C 35 BC jmp $bc35
BC32: AD E9 03 lda $03e9
BC35: 29 10    and #$10
BC37: 49 10    eor #$10
BC39: 85 00    sta $00
BC3B: 4A       lsr a
BC3C: 4A       lsr a
BC3D: 4A       lsr a
BC3E: 4A       lsr a
BC3F: AA       tax
BC40: 20 8B BC jsr $bc8b
BC43: B5 57    lda $57, x
BC45: F8       sed
BC46: 18       clc
BC47: 69 01    adc #$01
BC49: 95 57    sta $57, x
BC4B: D8       cld
BC4C: A0 38    ldy #$38
BC4E: B5 47    lda $47, x
BC50: 10 02    bpl $bc54
BC52: A0 37    ldy #$37
BC54: 98       tya
BC55: 20 B8 D7 jsr $d7b8
BC58: A9 02    lda #$02
BC5A: 8D E5 07 sta $07e5
BC5D: A5 46    lda $46
BC5F: 29 EF    and #$ef
BC61: 05 00    ora $00
BC63: 09 02    ora #$02
BC65: 85 46    sta $46
BC67: AD 1F 03 lda $031f
BC6A: 48       pha
BC6B: A9 03    lda #$03
BC6D: 8D 1F 03 sta $031f
BC70: A5 46    lda $46
BC72: 29 10    and #$10
BC74: F0 03    beq $bc79
BC76: CE 1F 03 dec $031f
BC79: 68       pla
BC7A: D0 05    bne $bc81
BC7C: A9 32    lda #$32
BC7E: 20 B8 D7 jsr $d7b8
BC81: A9 00    lda #$00
BC83: 8D F5 07 sta $07f5
BC86: A9 00    lda #$00
BC88: 4C E2 BB jmp $bbe2
BC8B: B5 47    lda $47, x
BC8D: 10 06    bpl $bc95
BC8F: A5 37    lda $37
BC91: C9 02    cmp #$02
BC93: B0 00    bcs $bc95
BC95: D8       cld
BC96: 60       rts
BC97: A6 4F    ldx $4f
BC99: B5 8F    lda $8f, x
BC9B: 85 93    sta $93
BC9D: B5 9D    lda $9d, x
BC9F: 85 A1    sta $a1
BCA1: B5 B9    lda $b9, x
BCA3: 38       sec
BCA4: E9 01    sbc #$01
BCA6: 85 BD    sta $bd
BCA8: B5 C7    lda $c7, x
BCAA: E9 00    sbc #$00
BCAC: 85 CB    sta $cb
BCAE: B5 E3    lda $e3, x
BCB0: 18       clc
BCB1: 69 18    adc #$18
BCB3: 85 E7    sta $e7
BCB5: A9 00    lda #$00
BCB7: 85 F5    sta $f5
BCB9: 60       rts
BCBA: A5 93    lda $93
BCBC: 38       sec
BCBD: E9 08    sbc #$08
BCBF: 85 9C    sta $9c
BCC1: A5 A1    lda $a1
BCC3: E9 00    sbc #$00
BCC5: 85 AA    sta $aa
BCC7: A5 BD    lda $bd
BCC9: 85 C6    sta $c6
BCCB: A5 CB    lda $cb
BCCD: 85 D4    sta $d4
BCCF: A9 0D    lda #$0d
BCD1: 20 1F B7 jsr $b71f
BCD4: 8D 16 04 sta $0416
BCD7: AD 10 04 lda $0410
BCDA: 10 03    bpl $bcdf
BCDC: 4C 7E BD jmp $bd7e
BCDF: AD 16 04 lda $0416
BCE2: 4D 10 04 eor $0410
BCE5: 29 10    and #$10
BCE7: D0 03    bne $bcec
BCE9: 4C 60 BD jmp $bd60
BCEC: A5 BD    lda $bd
BCEE: C9 18    cmp #$18
BCF0: 90 F7    bcc $bce9
BCF2: C9 78    cmp #$78
BCF4: B0 F3    bcs $bce9
BCF6: AD E8 03 lda $03e8
BCF9: D0 EE    bne $bce9
BCFB: AD E7 03 lda $03e7
BCFE: C9 40    cmp #$40
BD00: B0 E7    bcs $bce9
BD02: 20 C9 CD jsr $cdc9
BD05: 20 9F CD jsr $cd9f
BD08: A9 00    lda #$00
BD0A: 8D 99 02 sta $0299
BD0D: 8D 8C 02 sta $028c
BD10: A9 40    lda #$40
BD12: 8D C0 02 sta $02c0
BD15: A9 00    lda #$00
BD17: 8D A6 02 sta $02a6
BD1A: 8D B3 02 sta $02b3
BD1D: AD E3 03 lda $03e3
BD20: 85 93    sta $93
BD22: AD E4 03 lda $03e4
BD25: 85 A1    sta $a1
BD27: AD E5 03 lda $03e5
BD2A: 85 BD    sta $bd
BD2C: AD E6 03 lda $03e6
BD2F: 85 CB    sta $cb
BD31: AD 10 04 lda $0410
BD34: 8D 16 04 sta $0416
BD37: AD E0 03 lda $03e0
BD3A: 8D E1 03 sta $03e1
BD3D: A9 0D    lda #$0d
BD3F: 8D E0 03 sta $03e0
BD42: A5 56    lda $56
BD44: 29 10    and #$10
BD46: 09 08    ora #$08
BD48: 85 56    sta $56
BD4A: A0 04    ldy #$04
BD4C: 29 10    and #$10
BD4E: F0 02    beq $bd52
BD50: A0 02    ldy #$02
BD52: 8C 20 03 sty $0320
BD55: A9 FF    lda #$ff
BD57: 8D 11 04 sta $0411
BD5A: 20 88 C5 jsr $c588
BD5D: 20 B9 C7 jsr $c7b9
BD60: A5 E7    lda $e7
BD62: 8D E7 03 sta $03e7
BD65: A5 F5    lda $f5
BD67: 8D E8 03 sta $03e8
BD6A: A5 93    lda $93
BD6C: 8D E3 03 sta $03e3
BD6F: A5 A1    lda $a1
BD71: 8D E4 03 sta $03e4
BD74: A5 BD    lda $bd
BD76: 8D E5 03 sta $03e5
BD79: A5 CB    lda $cb
BD7B: 8D E6 03 sta $03e6
BD7E: AD 16 04 lda $0416
BD81: 8D 10 04 sta $0410
BD84: 60       rts
BD85: 48       pha
BD86: 8A       txa
BD87: 48       pha
BD88: 98       tya
BD89: 48       pha
BD8A: A6 4C    ldx $4c
BD8C: BD 0A 03 lda $030a, x
BD8F: 29 02    and #$02
BD91: F0 03    beq $bd96
BD93: 4C 5B BE jmp $be5b
BD96: AD E0 03 lda $03e0
BD99: C9 0F    cmp #$0f
BD9B: F0 F6    beq $bd93
BD9D: C9 0D    cmp #$0d
BD9F: F0 F2    beq $bd93
BDA1: A5 4C    lda $4c
BDA3: 29 02    and #$02
BDA5: 0A       asl a
BDA6: 0A       asl a
BDA7: 0A       asl a
BDA8: 45 56    eor $56
BDAA: 29 10    and #$10
BDAC: D0 11    bne $bdbf
BDAE: AD E0 03 lda $03e0
BDB1: F0 0C    beq $bdbf
BDB3: C9 10    cmp #$10
BDB5: F0 08    beq $bdbf
BDB7: C9 0E    cmp #$0e
BDB9: F0 04    beq $bdbf
BDBB: A5 53    lda $53
BDBD: F0 D4    beq $bd93
BDBF: AD 0F 04 lda $040f
BDC2: D0 CF    bne $bd93
BDC4: BD 1A 03 lda $031a, x
BDC7: 29 7F    and #$7f
BDC9: C9 0C    cmp #$0c
BDCB: 90 C6    bcc $bd93
BDCD: C9 1D    cmp #$1d
BDCF: B0 C2    bcs $bd93
BDD1: C9 19    cmp #$19
BDD3: F0 11    beq $bde6
BDD5: A9 01    lda #$01
BDD7: 20 DF D8 jsr $d8df
BDDA: 20 F0 7F jsr $7ff0
BDDD: 08       php
BDDE: A9 00    lda #$00
BDE0: 20 DF D8 jsr $d8df
BDE3: 28       plp
BDE4: 90 75    bcc $be5b
BDE6: AD E0 03 lda $03e0
BDE9: 8D E1 03 sta $03e1
BDEC: AD 58 02 lda $0258
BDEF: 8D 15 04 sta $0415
BDF2: AD 08 04 lda $0408
BDF5: 8D 09 04 sta $0409
BDF8: A9 00    lda #$00
BDFA: 8D 08 04 sta $0408
BDFD: A6 4C    ldx $4c
BDFF: BD 1A 03 lda $031a, x
BE02: 29 7F    and #$7f
BE04: 38       sec
BE05: E9 0C    sbc #$0c
BE07: 0A       asl a
BE08: A8       tay
BE09: B9 61 BE lda table_be61, y
BE0C: 85 10    sta $10
BE0E: B9 62 BE lda $be62, y
BE11: 85 11    sta $11
BE13: 6C 10 00 jmp ($0010)        ; [indirect_jump]
BE16: A5 4F    lda $4f
BE18: 10 41    bpl $be5b
BE1A: A5 53    lda $53
BE1C: C9 04    cmp #$04
BE1E: B0 2C    bcs $be4c
BE20: A5 4C    lda $4c
BE22: CD 11 04 cmp $0411
BE25: 8D 11 04 sta $0411
BE28: D0 16    bne $be40
BE2A: AD E1 03 lda $03e1
BE2D: F0 11    beq $be40
BE2F: C9 0E    cmp #$0e
BE31: F0 0D    beq $be40
BE33: A5 4C    lda $4c
BE35: 29 02    and #$02
BE37: 0A       asl a
BE38: 0A       asl a
BE39: 0A       asl a
BE3A: 8D E2 03 sta $03e2
BE3D: 4C 4C BE jmp $be4c
BE40: AD E2 03 lda $03e2
BE43: 10 16    bpl $be5b
BE45: A9 00    lda #$00
BE47: 8D 13 04 sta $0413
BE4A: F0 0F    beq $be5b
BE4C: A9 20    lda #$20
BE4E: 8D 13 04 sta $0413
BE51: A9 01    lda #$01
BE53: 8D 1F 03 sta $031f
BE56: A9 32    lda #$32
BE58: 20 B8 D7 jsr $d7b8
BE5B: 68       pla
BE5C: A8       tay
BE5D: 68       pla
BE5E: AA       tax
BE5F: 68       pla
BE60: 60       rts

BE83: A2 50    ldx #$50
BE85: A9 02    lda #$02
BE87: 4C 19 BF jmp $bf19
BE8A: A9 00    lda #$00
BE8C: 85 53    sta $53
BE8E: AD 09 04 lda $0409
BE91: C9 03    cmp #$03
BE93: B0 46    bcs $bedb
BE95: A9 00    lda #$00
BE97: 8D E0 03 sta $03e0
BE9A: A9 06    lda #$06
BE9C: 85 56    sta $56
BE9E: A9 40    lda #$40
BEA0: 8D C0 02 sta $02c0
BEA3: A6 4C    ldx $4c
BEA5: A5 E7    lda $e7
BEA7: 38       sec
BEA8: F5 E3    sbc $e3, x
BEAA: C9 40    cmp #$40
BEAC: B0 47    bcs $bef5
BEAE: 20 C9 CD jsr $cdc9
BEB1: 20 9F CD jsr $cd9f
BEB4: AD B3 02 lda $02b3
BEB7: 10 09    bpl $bec2
BEB9: C9 F8    cmp #$f8
BEBB: B0 05    bcs $bec2
BEBD: A9 F8    lda #$f8
BEBF: 8D B3 02 sta $02b3
BEC2: 20 88 C5 jsr $c588
BEC5: AD E9 03 lda $03e9
BEC8: 29 0F    and #$0f
BECA: C9 09    cmp #$09
BECC: 90 0A    bcc $bed8
BECE: A5 56    lda $56
BED0: 29 F0    and #$f0
BED2: 09 07    ora #$07
BED4: 09 20    ora #$20
BED6: 85 56    sta $56
BED8: 4C 53 BF jmp $bf53
BEDB: A9 0A    lda #$0a
BEDD: 8D E0 03 sta $03e0
BEE0: A9 22    lda #$22
BEE2: A6 4C    ldx $4c
BEE4: 9D 27 03 sta $0327, x
BEE7: A9 02    lda #$02
BEE9: 9D 33 03 sta $0333, x
BEEC: AD 15 04 lda $0415
BEEF: 9D 54 02 sta $0254, x
BEF2: 4C 6A BF jmp $bf6a
BEF5: 20 9F CD jsr $cd9f
BEF8: A9 02    lda #$02
BEFA: 8D B3 02 sta $02b3
BEFD: A9 00    lda #$00
BEFF: 8D A6 02 sta $02a6
BF02: 8D 8C 02 sta $028c
BF05: 8D 99 02 sta $0299
BF08: A5 56    lda $56
BF0A: 29 F0    and #$f0
BF0C: 09 07    ora #$07
BF0E: 09 20    ora #$20
BF10: 85 56    sta $56
BF12: 4C C2 BE jmp $bec2
BF15: A2 30    ldx #$30
BF17: A9 03    lda #$03
BF19: 8D E0 03 sta $03e0
BF1C: 8A       txa
BF1D: 48       pha
BF1E: A9 00    lda #$00
BF20: 85 56    sta $56
BF22: A9 00    lda #$00
BF24: 85 53    sta $53
BF26: A6 4C    ldx $4c
BF28: BD 0E 03 lda $030e, x
BF2B: 29 F7    and #$f7
BF2D: 9D 0E 03 sta $030e, x
BF30: A5 4F    lda $4f
BF32: 29 02    and #$02
BF34: 85 50    sta $50
BF36: A9 FF    lda #$ff
BF38: 85 4F    sta $4f
BF3A: AC E0 03 ldy $03e0
BF3D: B9 36 C0 lda $c036, y
BF40: 68       pla
BF41: 85 00    sta $00
BF43: 4A       lsr a
BF44: 18       clc
BF45: 65 00    adc $00
BF47: 8D 65 02 sta $0265
BF4A: 4C F3 C0 jmp $c0f3
BF4D: 20 7C CA jsr $ca7c
BF50: 20 88 C5 jsr $c588
BF53: 20 B9 C7 jsr $c7b9
BF56: A9 00    lda #$00
BF58: 8D 0F 04 sta $040f
BF5B: A6 4C    ldx $4c
BF5D: A5 56    lda $56
BF5F: 1D 32 C0 ora $c032, x
BF62: 85 56    sta $56
BF64: 20 E7 C8 jsr $c8e7
BF67: 20 F5 C9 jsr $c9f5
BF6A: A6 4C    ldx $4c
BF6C: BD 0A 03 lda $030a, x
BF6F: 09 02    ora #$02
BF71: 9D 0A 03 sta $030a, x
BF74: BD 1A 03 lda $031a, x
BF77: 29 7F    and #$7f
BF79: 38       sec
BF7A: E9 0C    sbc #$0c
BF7C: 0A       asl a
BF7D: A8       tay
BF7E: D0 1B    bne $bf9b
BF80: AD E0 03 lda $03e0
BF83: C9 03    cmp #$03
BF85: D0 14    bne $bf9b
BF87: AD E1 03 lda $03e1
BF8A: C9 0E    cmp #$0e
BF8C: F0 0D    beq $bf9b
BF8E: A9 0C    lda #$0c
BF90: 8D E0 03 sta $03e0
BF93: A5 56    lda $56
BF95: 29 F0    and #$f0
BF97: 09 05    ora #$05
BF99: 85 56    sta $56
BF9B: B9 3A C0 lda $c03a, y
BF9E: BE 3B C0 ldx $c03b, y
BFA1: 30 20    bmi $bfc3
BFA3: C9 01    cmp #$01
BFA5: D0 15    bne $bfbc
BFA7: AC 09 04 ldy $0409
BFAA: C0 03    cpy #$03
BFAC: 90 0E    bcc $bfbc
BFAE: A9 30    lda #$30
BFB0: 20 B8 D7 jsr $d7b8
BFB3: A9 10    lda #$10
BFB5: 8D 14 04 sta $0414
BFB8: A9 00    lda #$00
BFBA: A2 28    ldx #$28
BFBC: 20 A2 A9 jsr $a9a2
BFBF: 8A       txa
BFC0: 20 B8 D7 jsr $d7b8
BFC3: A5 4C    lda $4c
BFC5: 4A       lsr a
BFC6: A8       tay
BFC7: A5 4C    lda $4c
BFC9: 49 01    eor #$01
BFCB: 99 51 00 sta $0051, y
BFCE: A6 4C    ldx $4c
BFD0: BD 0A 03 lda $030a, x
BFD3: 29 BF    and #$bf
BFD5: 9D 0A 03 sta $030a, x
BFD8: A5 4C    lda $4c
BFDA: 49 01    eor #$01
BFDC: AA       tax
BFDD: BD 0A 03 lda $030a, x
BFE0: 09 40    ora #$40
BFE2: 9D 0A 03 sta $030a, x
BFE5: A5 53    lda $53
BFE7: D0 0D    bne $bff6
BFE9: A2 03    ldx #$03
BFEB: BD 0A 03 lda $030a, x
BFEE: 09 40    ora #$40
BFF0: 9D 0A 03 sta $030a, x
BFF3: CA       dex
BFF4: 10 F5    bpl $bfeb
BFF6: AD 0A 03 lda $030a
BFF9: 29 FB    and #$fb
BFFB: 8D 0A 03 sta $030a
BFFE: AD 0C 03 lda $030c
C001: 29 FB    and #$fb
C003: 8D 0C 03 sta $030c
C006: A6 4C    ldx $4c
C008: BD 16 03 lda $0316, x
C00B: 29 7F    and #$7f
C00D: C9 0B    cmp #$0b
C00F: D0 12    bne $c023
C011: B9 47 00 lda $0047, y
C014: 10 0D    bpl $c023
C016: A5 4C    lda $4c
C018: 29 02    and #$02
C01A: A8       tay
C01B: B9 0A 03 lda $030a, y
C01E: 09 04    ora #$04
C020: 99 0A 03 sta $030a, y
C023: A6 4C    ldx $4c
C025: BD 27 03 lda $0327, x
C028: C9 22    cmp #$22
C02A: D0 03    bne $c02f
C02C: 9D 1A 03 sta $031a, x
C02F: 4C 16 BE jmp $be16

C05C: E6 53    inc $53
C05E: A9 40    lda #$40
C060: 8D 65 02 sta $0265
C063: A9 05    lda #$05
C065: 8D E0 03 sta $03e0
C068: A9 03    lda #$03
C06A: 85 56    sta $56
C06C: A5 4C    lda $4c
C06E: AA       tax
C06F: 4A       lsr a
C070: A8       tay
C071: B9 47 00 lda $0047, y
C074: 10 14    bpl $c08a
C076: 8A       txa
C077: 49 01    eor #$01
C079: AA       tax
C07A: BD 0E 03 lda $030e, x
C07D: 29 40    and #$40
C07F: D0 15    bne $c096
C081: 8A       txa
C082: A5 53    lda $53
C084: C9 03    cmp #$03
C086: 90 0B    bcc $c093
C088: B0 0C    bcs $c096
C08A: BD 16 03 lda $0316, x
C08D: 29 7F    and #$7f
C08F: C9 0E    cmp #$0e
C091: F0 03    beq $c096
C093: 4C A8 C0 jmp $c0a8
C096: A9 00    lda #$00
C098: 85 53    sta $53
C09A: A9 40    lda #$40
C09C: 8D 65 02 sta $0265
C09F: A9 04    lda #$04
C0A1: 8D E0 03 sta $03e0
C0A4: A9 01    lda #$01
C0A6: 85 56    sta $56
C0A8: A6 4C    ldx $4c
C0AA: BD 1A 03 lda $031a, x
C0AD: 29 7F    and #$7f
C0AF: C9 0F    cmp #$0f
C0B1: D0 05    bne $c0b8
C0B3: A9 81    lda #$81
C0B5: 9D C0 03 sta $03c0, x
C0B8: A5 53    lda $53
C0BA: C9 01    cmp #$01
C0BC: D0 35    bne $c0f3
C0BE: AD E1 03 lda $03e1
C0C1: C9 0A    cmp #$0a
C0C3: D0 2E    bne $c0f3
C0C5: A6 4C    ldx $4c
C0C7: BD 1A 03 lda $031a, x
C0CA: 29 7F    and #$7f
C0CC: 38       sec
C0CD: E9 0F    sbc #$0f
C0CF: 90 22    bcc $c0f3
C0D1: C9 08    cmp #$08
C0D3: B0 1E    bcs $c0f3
C0D5: 20 58 C1 jsr $c158
C0D8: F0 0D    beq $c0e7
C0DA: AD 09 04 lda $0409
C0DD: C9 03    cmp #$03
C0DF: 90 12    bcc $c0f3
C0E1: 20 8C CD jsr $cd8c
C0E4: 4C F3 C0 jmp $c0f3
C0E7: A5 56    lda $56
C0E9: 09 20    ora #$20
C0EB: 85 56    sta $56
C0ED: 20 38 CD jsr $cd38
C0F0: 4C 53 BF jmp $bf53
C0F3: A5 4C    lda $4c
C0F5: AA       tax
C0F6: BC CC 03 ldy $03cc, x
C0F9: 20 7F 6B jsr $6b7f
C0FC: A9 00    lda #$00
C0FE: 85 FE    sta $fe
C100: 85 E2    sta $e2
C102: 85 8E    sta $8e
C104: 85 B8    sta $b8
C106: 85 85    sta $85
C108: 85 AF    sta $af
C10A: 85 D9    sta $d9
C10C: A5 1C    lda $1c
C10E: 85 9C    sta $9c
C110: 8D FB 03 sta $03fb
C113: A5 1B    lda $1b
C115: 85 AA    sta $aa
C117: 8D FC 03 sta $03fc
C11A: A5 1E    lda $1e
C11C: 85 C6    sta $c6
C11E: 8D FD 03 sta $03fd
C121: A5 1D    lda $1d
C123: 85 D4    sta $d4
C125: A5 20    lda $20
C127: 8D FE 03 sta $03fe
C12A: 85 F0    sta $f0
C12C: AD E0 03 lda $03e0
C12F: C9 0A    cmp #$0a
C131: D0 12    bne $c145
C133: A9 0D    lda #$0d
C135: 20 1F B7 jsr $b71f
C138: 29 0F    and #$0f
C13A: A8       tay
C13B: AD 65 02 lda $0265
C13E: 18       clc
C13F: 79 48 C1 adc $c148, y
C142: 8D 65 02 sta $0265
C145: 4C 4D BF jmp $bf4d

C158: 0A       asl a
C159: 0A       asl a
C15A: 0D 09 04 ora $0409
C15D: 0A       asl a
C15E: 85 01    sta $01
C160: A9 00    lda #$00
C162: 85 00    sta $00
C164: A5 4C    lda $4c
C166: 4A       lsr a
C167: A8       tay
C168: B9 47 00 lda $0047, y
C16B: 30 0E    bmi $c17b
C16D: A5 38    lda $38
C16F: C9 09    cmp #$09
C171: 90 02    bcc $c175
C173: A9 09    lda #$09
C175: 18       clc
C176: 69 01    adc #$01
C178: 0A       asl a
C179: 85 00    sta $00
C17B: A4 00    ldy $00
C17D: B9 90 C1 lda $c190, y
C180: 18       clc
C181: 65 01    adc $01
C183: 85 10    sta $10
C185: B9 91 C1 lda $c191, y
C188: 69 00    adc #$00
C18A: 85 11    sta $11
C18C: 20 09 66 jsr $6609
C18F: 60       rts

C463: 99 05 95 sta $9505, y
C466: E6 53    inc $53
C468: A9 10    lda #$10
C46A: 8D 65 02 sta $0265
C46D: A9 08    lda #$08
C46F: 8D E0 03 sta $03e0
C472: A9 02    lda #$02
C474: 85 56    sta $56
C476: A5 4C    lda $4c
C478: AA       tax
C479: 4A       lsr a
C47A: A8       tay
C47B: B9 47 00 lda $0047, y
C47E: 30 0E    bmi $c48e
C480: A9 06    lda #$06
C482: 8D E0 03 sta $03e0
C485: BD 16 03 lda $0316, x
C488: 29 7F    and #$7f
C48A: C9 0A    cmp #$0a
C48C: F0 03    beq $c491
C48E: 4C F3 C0 jmp $c0f3
C491: AD 0E 04 lda $040e
C494: D0 03    bne $c499
C496: 4C F3 C0 jmp $c0f3
C499: EE E0 03 inc $03e0
C49C: AD 0A 04 lda $040a
C49F: 8D FB 03 sta $03fb
C4A2: 85 9C    sta $9c
C4A4: AD 0B 04 lda $040b
C4A7: 8D FC 03 sta $03fc
C4AA: 85 AA    sta $aa
C4AC: AD 0C 04 lda $040c
C4AF: 8D FD 03 sta $03fd
C4B2: 85 C6    sta $c6
C4B4: AD 0D 04 lda $040d
C4B7: 8D FE 03 sta $03fe
C4BA: 85 F0    sta $f0
C4BC: A9 00    lda #$00
C4BE: 85 D4    sta $d4
C4C0: 85 FE    sta $fe
C4C2: AD 0E 04 lda $040e
C4C5: 8D FF 03 sta $03ff
C4C8: 85 00    sta $00
C4CA: 20 F5 CC jsr $ccf5
C4CD: 20 CF CA jsr $cacf
C4D0: A9 0F    lda #$0f
C4D2: 8D E9 03 sta $03e9
C4D5: A9 00    lda #$00
C4D7: 8D 0E 04 sta $040e
C4DA: 4C 56 BF jmp $bf56
C4DD: A9 00    lda #$00
C4DF: 85 53    sta $53
C4E1: A9 00    lda #$00
C4E3: 8D 65 02 sta $0265
C4E6: A9 0E    lda #$0e
C4E8: 8D E0 03 sta $03e0
C4EB: A6 4C    ldx $4c
C4ED: BD 0E 03 lda $030e, x
C4F0: 29 F7    and #$f7
C4F2: 9D 0E 03 sta $030e, x
C4F5: A9 00    lda #$00
C4F7: 85 F0    sta $f0
C4F9: 85 FE    sta $fe
C4FB: B5 8F    lda $8f, x
C4FD: 85 9C    sta $9c
C4FF: B5 9D    lda $9d, x
C501: 85 AA    sta $aa
C503: B5 B9    lda $b9, x
C505: 85 C6    sta $c6
C507: B5 C7    lda $c7, x
C509: 85 D4    sta $d4
C50B: 4C 4D BF jmp $bf4d
C50E: A6 4C    ldx $4c
C510: A5 4F    lda $4f
C512: 10 2C    bpl $c540
C514: BD D4 03 lda $03d4, x
C517: 8D 08 04 sta $0408
C51A: 8A       txa
C51B: 4A       lsr a
C51C: A8       tay
C51D: B9 47 00 lda $0047, y
C520: 10 0C    bpl $c52e
C522: 20 B7 F7 jsr $f7b7
C525: B9 2E 02 lda $022e, y
C528: 29 20    and #$20
C52A: F0 17    beq $c543
C52C: D0 05    bne $c533
C52E: BD C8 03 lda $03c8, x
C531: F0 10    beq $c543
C533: A9 0C    lda #$0c
C535: 8D E0 03 sta $03e0
C538: A9 00    lda #$00
C53A: 8D 08 04 sta $0408
C53D: 4C 48 C5 jmp $c548
C540: 4C 15 BF jmp $bf15
C543: A9 0A    lda #$0a
C545: 8D E0 03 sta $03e0
C548: A9 00    lda #$00
C54A: 85 53    sta $53
C54C: A9 05    lda #$05
C54E: 85 56    sta $56
C550: A5 4C    lda $4c
C552: AA       tax
C553: 4A       lsr a
C554: A8       tay
C555: AD E0 03 lda $03e0
C558: C9 0C    cmp #$0c
C55A: F0 11    beq $c56d
C55C: B5 B9    lda $b9, x
C55E: 85 BD    sta $bd
C560: B5 E3    lda $e3, x
C562: 18       clc
C563: 69 38    adc #$38
C565: 85 E7    sta $e7
C567: B5 F1    lda $f1, x
C569: 69 00    adc #$00
C56B: 85 F5    sta $f5
C56D: A5 4C    lda $4c
C56F: 4A       lsr a
C570: A8       tay
C571: B9 47 00 lda $0047, y
C574: 10 04    bpl $c57a
C576: A9 48    lda #$48
C578: D0 08    bne $c582
C57A: AD 08 04 lda $0408
C57D: 0A       asl a
C57E: 0A       asl a
C57F: 0A       asl a
C580: 69 3C    adc #$3c
C582: 8D 65 02 sta $0265
C585: 4C F3 C0 jmp $c0f3
C588: A5 E7    lda $e7
C58A: 85 10    sta $10
C58C: A5 F5    lda $f5
C58E: 85 11    sta $11
C590: A5 D9    lda $d9
C592: 85 00    sta $00
C594: AD A6 02 lda $02a6
C597: 85 12    sta $12
C599: AD B3 02 lda $02b3
C59C: 85 13    sta $13
C59E: AD C0 02 lda $02c0
C5A1: 85 14    sta $14
C5A3: AD CD 02 lda $02cd
C5A6: 85 15    sta $15
C5A8: A9 00    lda #$00
C5AA: 85 01    sta $01
C5AC: 85 02    sta $02
C5AE: 85 03    sta $03
C5B0: 85 04    sta $04
C5B2: 85 1B    sta $1b
C5B4: A5 12    lda $12
C5B6: 18       clc
C5B7: 65 00    adc $00
C5B9: 85 00    sta $00
C5BB: A5 13    lda $13
C5BD: 08       php
C5BE: 65 10    adc $10
C5C0: 85 10    sta $10
C5C2: A5 11    lda $11
C5C4: 69 00    adc #$00
C5C6: 28       plp
C5C7: 10 03    bpl $c5cc
C5C9: 18       clc
C5CA: 69 FF    adc #$ff
C5CC: 85 11    sta $11
C5CE: A5 12    lda $12
C5D0: 38       sec
C5D1: E5 14    sbc $14
C5D3: 85 12    sta $12
C5D5: A5 13    lda $13
C5D7: E5 15    sbc $15
C5D9: 85 13    sta $13
C5DB: E6 01    inc $01
C5DD: A5 13    lda $13
C5DF: 10 D3    bpl $c5b4
C5E1: A5 11    lda $11
C5E3: 30 44    bmi $c629
C5E5: D0 CD    bne $c5b4
C5E7: 05 10    ora $10
C5E9: F0 3E    beq $c629
C5EB: A5 02    lda $02
C5ED: D0 0A    bne $c5f9
C5EF: A5 10    lda $10
C5F1: C9 50    cmp #$50
C5F3: B0 04    bcs $c5f9
C5F5: A5 01    lda $01
C5F7: 85 02    sta $02
C5F9: A5 03    lda $03
C5FB: D0 0A    bne $c607
C5FD: A5 10    lda $10
C5FF: C9 30    cmp #$30
C601: B0 04    bcs $c607
C603: A5 01    lda $01
C605: 85 03    sta $03
C607: A5 04    lda $04
C609: D0 0D    bne $c618
C60B: A5 10    lda $10
C60D: CD FE 03 cmp $03fe
C610: F0 02    beq $c614
C612: B0 04    bcs $c618
C614: A5 01    lda $01
C616: 85 04    sta $04
C618: A5 1B    lda $1b
C61A: D0 0A    bne $c626
C61C: A5 10    lda $10
C61E: C9 40    cmp #$40
C620: B0 04    bcs $c626
C622: A5 01    lda $01
C624: 85 1B    sta $1b
C626: 4C B4 C5 jmp $c5b4
C629: A5 01    lda $01
C62B: 8D EE 03 sta $03ee
C62E: A5 02    lda $02
C630: 8D F9 03 sta $03f9
C633: A5 03    lda $03
C635: 8D F4 03 sta $03f4
C638: A5 04    lda $04
C63A: 8D FF 03 sta $03ff
C63D: AD 72 02 lda $0272
C640: 85 10    sta $10
C642: AD 7F 02 lda $027f
C645: 85 11    sta $11
C647: 10 03    bpl $c64c
C649: 20 98 CF jsr $cf98
C64C: A5 10    lda $10
C64E: 85 00    sta $00
C650: A5 11    lda $11
C652: 85 01    sta $01
C654: A9 00    lda #$00
C656: 24 01    bit $01
C658: 10 02    bpl $c65c
C65A: A9 FF    lda #$ff
C65C: 85 02    sta $02
C65E: AD EE 03 lda $03ee
C661: 85 03    sta $03
C663: 20 60 D1 jsr $d160
C666: 20 67 C7 jsr $c767
C669: A5 05    lda $05
C66B: 8D EA 03 sta $03ea
C66E: A5 06    lda $06
C670: 8D EB 03 sta $03eb
C673: AD F9 03 lda $03f9
C676: 85 03    sta $03
C678: 20 60 D1 jsr $d160
C67B: 20 67 C7 jsr $c767
C67E: A5 05    lda $05
C680: 8D F5 03 sta $03f5
C683: A5 06    lda $06
C685: 8D F6 03 sta $03f6
C688: AD F4 03 lda $03f4
C68B: 85 03    sta $03
C68D: 20 60 D1 jsr $d160
C690: 20 67 C7 jsr $c767
C693: A5 05    lda $05
C695: 8D EF 03 sta $03ef
C698: A5 06    lda $06
C69A: 8D F0 03 sta $03f0
C69D: A5 1B    lda $1b
C69F: 85 03    sta $03
C6A1: 20 60 D1 jsr $d160
C6A4: 20 67 C7 jsr $c767
C6A7: A5 05    lda $05
C6A9: 38       sec
C6AA: E9 08    sbc #$08
C6AC: 85 9C    sta $9c
C6AE: A5 06    lda $06
C6B0: E9 00    sbc #$00
C6B2: 85 AA    sta $aa
C6B4: AD 8C 02 lda $028c
C6B7: 85 10    sta $10
C6B9: AD 99 02 lda $0299
C6BC: 85 11    sta $11
C6BE: 10 03    bpl $c6c3
C6C0: 20 98 CF jsr $cf98
C6C3: A5 10    lda $10
C6C5: 85 00    sta $00
C6C7: A5 11    lda $11
C6C9: 85 01    sta $01
C6CB: A9 00    lda #$00
C6CD: 24 01    bit $01
C6CF: 10 02    bpl $c6d3
C6D1: A9 FF    lda #$ff
C6D3: 85 02    sta $02
C6D5: AD EE 03 lda $03ee
C6D8: 85 03    sta $03
C6DA: 20 60 D1 jsr $d160
C6DD: 20 90 C7 jsr $c790
C6E0: A5 05    lda $05
C6E2: 8D EC 03 sta $03ec
C6E5: A5 06    lda $06
C6E7: 8D ED 03 sta $03ed
C6EA: AD F9 03 lda $03f9
C6ED: 85 03    sta $03
C6EF: 20 60 D1 jsr $d160
C6F2: 20 90 C7 jsr $c790
C6F5: A5 05    lda $05
C6F7: 8D F7 03 sta $03f7
C6FA: A5 06    lda $06
C6FC: 8D F8 03 sta $03f8
C6FF: AD F4 03 lda $03f4
C702: 85 03    sta $03
C704: 20 60 D1 jsr $d160
C707: 20 90 C7 jsr $c790
C70A: A5 05    lda $05
C70C: 8D F1 03 sta $03f1
C70F: A5 06    lda $06
C711: 8D F2 03 sta $03f2
C714: A5 1B    lda $1b
C716: 85 03    sta $03
C718: 20 60 D1 jsr $d160
C71B: 20 90 C7 jsr $c790
C71E: A5 05    lda $05
C720: 85 C6    sta $c6
C722: A5 06    lda $06
C724: 85 D4    sta $d4
C726: A9 0D    lda #$0d
C728: 20 1F B7 jsr $b71f
C72B: 8D FA 03 sta $03fa
C72E: AD EA 03 lda $03ea
C731: 85 9C    sta $9c
C733: AD EB 03 lda $03eb
C736: 85 AA    sta $aa
C738: AD EC 03 lda $03ec
C73B: 85 C6    sta $c6
C73D: AD ED 03 lda $03ed
C740: 85 D4    sta $d4
C742: A9 0D    lda #$0d
C744: 20 1F B7 jsr $b71f
C747: 8D E9 03 sta $03e9
C74A: AD EF 03 lda $03ef
C74D: 85 9C    sta $9c
C74F: AD F0 03 lda $03f0
C752: 85 AA    sta $aa
C754: AD F1 03 lda $03f1
C757: 85 C6    sta $c6
C759: AD F2 03 lda $03f2
C75C: 85 D4    sta $d4
C75E: A9 0D    lda #$0d
C760: 20 1F B7 jsr $b71f
C763: 8D F3 03 sta $03f3
C766: 60       rts
C767: 2C 7F 02 bit $027f
C76A: 30 12    bmi $c77e
C76C: A5 04    lda $04
C76E: 18       clc
C76F: 65 85    adc $85
C771: A5 05    lda $05
C773: 65 93    adc $93
C775: 85 05    sta $05
C777: A5 06    lda $06
C779: 65 A1    adc $a1
C77B: 85 06    sta $06
C77D: 60       rts
C77E: A5 85    lda $85
C780: 38       sec
C781: E5 04    sbc $04
C783: A5 93    lda $93
C785: E5 05    sbc $05
C787: 85 05    sta $05
C789: A5 A1    lda $a1
C78B: E5 06    sbc $06
C78D: 85 06    sta $06
C78F: 60       rts
C790: 2C 99 02 bit $0299
C793: 30 12    bmi $c7a7
C795: A5 04    lda $04
C797: 18       clc
C798: 65 AF    adc $af
C79A: A5 05    lda $05
C79C: 65 BD    adc $bd
C79E: 85 05    sta $05
C7A0: A5 06    lda $06
C7A2: 65 CB    adc $cb
C7A4: 85 06    sta $06
C7A6: 60       rts
C7A7: A5 AF    lda $af
C7A9: 38       sec
C7AA: E5 04    sbc $04
C7AC: A5 BD    lda $bd
C7AE: E5 05    sbc $05
C7B0: 85 05    sta $05
C7B2: A5 CB    lda $cb
C7B4: E5 06    sbc $06
C7B6: 85 06    sta $06
C7B8: 60       rts
C7B9: A9 03    lda #$03
C7BB: 85 00    sta $00
C7BD: A9 01    lda #$01
C7BF: 85 01    sta $01
C7C1: A5 01    lda $01
C7C3: 0A       asl a
C7C4: 0A       asl a
C7C5: 0A       asl a
C7C6: A8       tay
C7C7: A2 00    ldx #$00
C7C9: B9 D7 C8 lda $c8d7, y
C7CC: 95 08    sta $08, x
C7CE: C8       iny
C7CF: E8       inx
C7D0: E0 08    cpx #$08
C7D2: 90 F5    bcc $c7c9
C7D4: A4 01    ldy $01
C7D6: B9 D5 C8 lda $c8d5, y
C7D9: 85 02    sta $02
C7DB: A6 00    ldx $00
C7DD: A4 02    ldy $02
C7DF: B5 8F    lda $8f, x
C7E1: 38       sec
C7E2: F9 EA 03 sbc $03ea, y
C7E5: 85 10    sta $10
C7E7: B5 9D    lda $9d, x
C7E9: F9 EB 03 sbc $03eb, y
C7EC: 85 11    sta $11
C7EE: 10 03    bpl $c7f3
C7F0: 20 98 CF jsr $cf98
C7F3: A4 00    ldy $00
C7F5: A5 10    lda $10
C7F7: A6 11    ldx $11
C7F9: F0 02    beq $c7fd
C7FB: A9 FF    lda #$ff
C7FD: 91 08    sta ($08), y
C7FF: A6 00    ldx $00
C801: A4 02    ldy $02
C803: B5 B9    lda $b9, x
C805: 38       sec
C806: F9 EC 03 sbc $03ec, y
C809: 85 10    sta $10
C80B: B5 C7    lda $c7, x
C80D: F9 ED 03 sbc $03ed, y
C810: 85 11    sta $11
C812: 10 03    bpl $c817
C814: 20 98 CF jsr $cf98
C817: A4 00    ldy $00
C819: A5 10    lda $10
C81B: A6 11    ldx $11
C81D: F0 02    beq $c821
C81F: A9 FF    lda #$ff
C821: 91 0A    sta ($0a), y
C823: B1 08    lda ($08), y
C825: 85 10    sta $10
C827: 85 12    sta $12
C829: A9 00    lda #$00
C82B: 85 11    sta $11
C82D: 85 13    sta $13
C82F: 20 29 D1 jsr $d129
C832: A5 14    lda $14
C834: 91 0C    sta ($0c), y
C836: A5 15    lda $15
C838: 91 0E    sta ($0e), y
C83A: B1 0A    lda ($0a), y
C83C: 85 10    sta $10
C83E: 85 12    sta $12
C840: A9 00    lda #$00
C842: 85 11    sta $11
C844: 85 13    sta $13
C846: 20 29 D1 jsr $d129
C849: A5 14    lda $14
C84B: 18       clc
C84C: 71 0C    adc ($0c), y
C84E: 91 0C    sta ($0c), y
C850: A5 15    lda $15
C852: 71 0E    adc ($0e), y
C854: 91 0E    sta ($0e), y
C856: C6 01    dec $01
C858: 30 03    bmi $c85d
C85A: 4C C1 C7 jmp $c7c1
C85D: C6 00    dec $00
C85F: 30 03    bmi $c864
C861: 4C BD C7 jmp $c7bd
C864: A0 00    ldy #$00
C866: A9 00    lda #$00
C868: 85 00    sta $00
C86A: B9 47 03 lda $0347, y
C86D: 38       sec
C86E: F9 48 03 sbc $0348, y
C871: B9 4B 03 lda $034b, y
C874: F9 4C 03 sbc $034c, y
C877: 90 02    bcc $c87b
C879: E6 00    inc $00
C87B: A5 00    lda $00
C87D: 99 57 03 sta $0357, y
C880: 20 BF C8 jsr $c8bf
C883: C8       iny
C884: 49 01    eor #$01
C886: 99 57 03 sta $0357, y
C889: 20 BF C8 jsr $c8bf
C88C: C8       iny
C88D: C0 04    cpy #$04
C88F: D0 D5    bne $c866
C891: A0 00    ldy #$00
C893: A9 00    lda #$00
C895: 85 00    sta $00
C897: B9 5B 03 lda $035b, y
C89A: 38       sec
C89B: F9 5C 03 sbc $035c, y
C89E: B9 5F 03 lda $035f, y
C8A1: F9 60 03 sbc $0360, y
C8A4: 90 02    bcc $c8a8
C8A6: E6 00    inc $00
C8A8: A5 00    lda $00
C8AA: 99 6B 03 sta $036b, y
C8AD: 20 CA C8 jsr $c8ca
C8B0: C8       iny
C8B1: 49 01    eor #$01
C8B3: 99 6B 03 sta $036b, y
C8B6: 20 CA C8 jsr $c8ca
C8B9: C8       iny
C8BA: C0 04    cpy #$04
C8BC: D0 D5    bne $c893
C8BE: 60       rts
C8BF: C9 00    cmp #$00
C8C1: D0 06    bne $c8c9
C8C3: 98       tya
C8C4: 4A       lsr a
C8C5: AA       tax
C8C6: 98       tya
C8C7: 95 61    sta $61, x
C8C9: 60       rts
C8CA: C9 00    cmp #$00
C8CC: D0 06    bne $c8d4
C8CE: 98       tya
C8CF: 4A       lsr a
C8D0: AA       tax
C8D1: 98       tya
C8D2: 95 63    sta $63, x
C8D4: 60       rts

C8E7: A5 56    lda $56                                             
C8E9: 29 10    and #$10                                            
C8EC: 4A       lsr a
C8ED: 4A       lsr a
C8EE: 4A       lsr a
C8EF: 49 01    eor #$01
C8F1: A8       tay
C8F2: B6 5F    ldx $5f, y
C8F4: BD 76 C9 lda $c976, x
C8F7: 18       clc
C8F8: 08       php
C8F9: 75 8F    adc $8f, x
C8FB: 8D 00 04 sta $0400
C8FE: B5 9D    lda $9d, x
C900: 69 00    adc #$00
C902: 28       plp
C903: 10 02    bpl $c907
C905: 69 FF    adc #$ff
C907: 8D 01 04 sta $0401
C90A: A5 85    lda $85
C90C: 85 00    sta $00
C90E: A5 93    lda $93
C910: 38       sec
C911: ED 00 04 sbc $0400
C914: 85 01    sta $01
C916: A5 A1    lda $a1
C918: ED 01 04 sbc $0401
C91B: 85 02    sta $02
C91D: 10 03    bpl $c922
C91F: 20 D6 CF jsr $cfd6
C922: AD 72 02 lda $0272
C925: 85 10    sta $10
C927: AD 7F 02 lda $027f
C92A: 85 11    sta $11
C92C: 10 03    bpl $c931
C92E: 20 98 CF jsr $cf98
C931: 20 86 D0 jsr $d086
C934: AD EE 03 lda $03ee
C937: C5 00    cmp $00
C939: 90 23    bcc $c95e
C93B: A5 00    lda $00
C93D: 8D 06 04 sta $0406
C940: 20 7A C9 jsr $c97a
C943: A5 14    lda $14
C945: 8D 02 04 sta $0402
C948: A5 15    lda $15
C94A: 8D 03 04 sta $0403
C94D: AC 06 04 ldy $0406
C950: 20 B2 C9 jsr $c9b2
C953: A5 10    lda $10
C955: 8D 04 04 sta $0404
C958: A5 11    lda $11
C95A: 8D 05 04 sta $0405
C95D: 60       rts
C95E: A9 00    lda #$00
C960: 8D 06 04 sta $0406
C963: 8D 00 04 sta $0400
C966: 8D 01 04 sta $0401
C969: 8D 02 04 sta $0402
C96C: 8D 03 04 sta $0403
C96F: 8D 04 04 sta $0404
C972: 8D 05 04 sta $0405
C975: 60       rts

C97A: 48       pha
C97B: A9 00    lda #$00
C97D: 85 02    sta $02
C97F: AD 8C 02 lda $028c
C982: 85 00    sta $00
C984: AD 99 02 lda $0299
C987: 85 01    sta $01
C989: 10 07    bpl $c992
C98B: A9 FF    lda #$ff
C98D: 85 02    sta $02
C98F: 20 D6 CF jsr $cfd6
C992: 68       pla
C993: 85 03    sta $03
C995: 20 60 D1 jsr $d160
C998: 2C 99 02 bit $0299
C99B: 10 03    bpl $c9a0
C99D: 20 F0 CF jsr $cff0
C9A0: A5 04    lda $04
C9A2: 18       clc
C9A3: 65 AF    adc $af
C9A5: A5 05    lda $05
C9A7: 65 BD    adc $bd
C9A9: 85 14    sta $14
C9AB: A5 06    lda $06
C9AD: 65 CB    adc $cb
C9AF: 85 15    sta $15
C9B1: 60       rts
C9B2: A5 D9    lda $d9
C9B4: 85 00    sta $00
C9B6: A5 E7    lda $e7
C9B8: 85 10    sta $10
C9BA: A5 F5    lda $f5
C9BC: 85 11    sta $11
C9BE: AD A6 02 lda $02a6
C9C1: 85 12    sta $12
C9C3: AD B3 02 lda $02b3
C9C6: 85 13    sta $13
C9C8: A5 12    lda $12
C9CA: 18       clc
C9CB: 65 00    adc $00
C9CD: 85 00    sta $00
C9CF: A5 13    lda $13
C9D1: 08       php
C9D2: 65 10    adc $10
C9D4: 85 10    sta $10
C9D6: A5 11    lda $11
C9D8: 69 00    adc #$00
C9DA: 28       plp
C9DB: 10 03    bpl $c9e0
C9DD: 18       clc
C9DE: 69 FF    adc #$ff
C9E0: 85 11    sta $11
C9E2: A5 12    lda $12
C9E4: 38       sec
C9E5: ED C0 02 sbc $02c0
C9E8: 85 12    sta $12
C9EA: A5 13    lda $13
C9EC: ED CD 02 sbc $02cd
C9EF: 85 13    sta $13
C9F1: 88       dey
C9F2: D0 D4    bne $c9c8
C9F4: 60       rts
C9F5: A5 56    lda $56
C9F7: 29 10    and #$10
C9F9: 4A       lsr a
C9FA: 4A       lsr a
C9FB: 4A       lsr a
C9FC: 49 02    eor #$02
C9FE: AA       tax
C9FF: 20 09 CA jsr $ca09
CA02: E8       inx
CA03: 8A       txa
CA04: 29 01    and #$01
CA06: D0 F7    bne $c9ff
CA08: 60       rts
CA09: A5 85    lda $85
CA0B: 38       sec
CA0C: F5 81    sbc $81, x
CA0E: 85 00    sta $00
CA10: A5 93    lda $93
CA12: F5 8F    sbc $8f, x
CA14: 85 01    sta $01
CA16: A5 A1    lda $a1
CA18: F5 9D    sbc $9d, x
CA1A: 85 02    sta $02
CA1C: 10 03    bpl $ca21
CA1E: 20 D6 CF jsr $cfd6
CA21: AD 72 02 lda $0272
CA24: 85 10    sta $10
CA26: AD 7F 02 lda $027f
CA29: 85 11    sta $11
CA2B: 10 03    bpl $ca30
CA2D: 20 98 CF jsr $cf98
CA30: 20 86 D0 jsr $d086
CA33: AD EE 03 lda $03ee
CA36: C5 00    cmp $00
CA38: 90 30    bcc $ca6a
CA3A: A5 00    lda $00
CA3C: 9D A0 03 sta $03a0, x
CA3F: 20 7A C9 jsr $c97a
CA42: A5 14    lda $14
CA44: 9D 90 03 sta $0390, x
CA47: A5 15    lda $15
CA49: 9D 94 03 sta $0394, x
CA4C: BD A0 03 lda $03a0, x
CA4F: A8       tay
CA50: 20 B2 C9 jsr $c9b2
CA53: A5 10    lda $10
CA55: 9D 98 03 sta $0398, x
CA58: A5 11    lda $11
CA5A: 9D 9C 03 sta $039c, x
CA5D: 10 08    bpl $ca67
CA5F: A9 00    lda #$00
CA61: 9D 98 03 sta $0398, x
CA64: 9D 9C 03 sta $039c, x
CA67: 4C 7B CA jmp $ca7b
CA6A: A9 00    lda #$00
CA6C: 9D A0 03 sta $03a0, x
CA6F: 9D 90 03 sta $0390, x
CA72: 9D 94 03 sta $0394, x
CA75: 9D 98 03 sta $0398, x
CA78: 9D 9C 03 sta $039c, x
CA7B: 60       rts
CA7C: A9 0D    lda #$0d
CA7E: 20 4A B4 jsr $b44a
CA81: 8D 58 02 sta $0258
CA84: 85 00    sta $00
CA86: AD 65 02 lda $0265
CA89: 85 01    sta $01
CA8B: 20 7C B6 jsr $b67c
CA8E: 20 F5 CC jsr $ccf5
CA91: A2 00    ldx #$00
CA93: AD 58 02 lda $0258
CA96: 18       clc
CA97: 69 20    adc #$20
CA99: 85 00    sta $00
CA9B: 10 02    bpl $ca9f
CA9D: 49 80    eor #$80
CA9F: C9 40    cmp #$40
CAA1: B0 02    bcs $caa5
CAA3: A2 03    ldx #$03
CAA5: BD 16 04 lda $0416, x
CAA8: 85 00    sta $00
CAAA: BD 17 04 lda $0417, x
CAAD: 85 01    sta $01
CAAF: BD 18 04 lda $0418, x
CAB2: 85 02    sta $02
CAB4: 10 03    bpl $cab9
CAB6: 20 D6 CF jsr $cfd6
CAB9: E0 00    cpx #$00
CABB: F0 08    beq $cac5
CABD: A5 12    lda $12
CABF: 85 10    sta $10
CAC1: A5 13    lda $13
CAC3: 85 11    sta $11
CAC5: 24 11    bit $11
CAC7: 10 03    bpl $cacc
CAC9: 20 98 CF jsr $cf98
CACC: 20 86 D0 jsr $d086
CACF: AC E0 03 ldy $03e0
CAD2: A5 00    lda $00
CAD4: 18       clc
CAD5: 79 E4 CC adc $cce4, y
CAD8: 8D 1F 04 sta $041f
CADB: 85 10    sta $10
CADD: A9 00    lda #$00
CADF: 85 11    sta $11
CAE1: AD 16 04 lda $0416
CAE4: 85 00    sta $00
CAE6: AD 17 04 lda $0417
CAE9: 85 01    sta $01
CAEB: AD 18 04 lda $0418
CAEE: 85 02    sta $02
CAF0: 10 03    bpl $caf5
CAF2: 20 D6 CF jsr $cfd6
CAF5: 20 86 D0 jsr $d086
CAF8: 2C 18 04 bit $0418
CAFB: 10 03    bpl $cb00
CAFD: 20 D6 CF jsr $cfd6
CB00: A5 00    lda $00
CB02: 8D 72 02 sta $0272
CB05: A5 01    lda $01
CB07: 8D 7F 02 sta $027f
CB0A: AD 19 04 lda $0419
CB0D: 85 00    sta $00
CB0F: AD 1A 04 lda $041a
CB12: 85 01    sta $01
CB14: AD 1B 04 lda $041b
CB17: 85 02    sta $02
CB19: 10 03    bpl $cb1e
CB1B: 20 D6 CF jsr $cfd6
CB1E: 20 86 D0 jsr $d086
CB21: 2C 1B 04 bit $041b
CB24: 10 03    bpl $cb29
CB26: 20 D6 CF jsr $cfd6
CB29: A5 00    lda $00
CB2B: 8D 8C 02 sta $028c
CB2E: A5 01    lda $01
CB30: 8D 99 02 sta $0299
CB33: AD E0 03 lda $03e0
CB36: C9 07    cmp #$07
CB38: F0 08    beq $cb42
CB3A: C9 0A    cmp #$0a
CB3C: 90 2D    bcc $cb6b
CB3E: C9 0C    cmp #$0c
CB40: B0 29    bcs $cb6b
CB42: AD 1C 04 lda $041c
CB45: 85 00    sta $00
CB47: AD 1D 04 lda $041d
CB4A: 85 01    sta $01
CB4C: AD 1E 04 lda $041e
CB4F: 85 02    sta $02
CB51: 10 03    bpl $cb56
CB53: 20 D6 CF jsr $cfd6
CB56: 20 86 D0 jsr $d086
CB59: 2C 1E 04 bit $041e
CB5C: 10 03    bpl $cb61
CB5E: 20 D6 CF jsr $cfd6
CB61: A5 00    lda $00
CB63: 8D A6 02 sta $02a6
CB66: A5 01    lda $01
CB68: 8D B3 02 sta $02b3
CB6B: AD 72 02 lda $0272
CB6E: 85 10    sta $10
CB70: AD 7F 02 lda $027f
CB73: 85 11    sta $11
CB75: 10 03    bpl $cb7a
CB77: 20 98 CF jsr $cf98
CB7A: A5 10    lda $10
CB7C: 85 00    sta $00
CB7E: A5 11    lda $11
CB80: 85 01    sta $01
CB82: A9 00    lda #$00
CB84: 85 02    sta $02
CB86: AD 1F 04 lda $041f
CB89: 85 03    sta $03
CB8B: 20 60 D1 jsr $d160
CB8E: 2C 7F 02 bit $027f
CB91: 10 03    bpl $cb96
CB93: 20 F0 CF jsr $cff0
CB96: A5 93    lda $93
CB98: 18       clc
CB99: 65 05    adc $05
CB9B: 85 05    sta $05
CB9D: A5 A1    lda $a1
CB9F: 65 06    adc $06
CBA1: 85 06    sta $06
CBA3: A5 9C    lda $9c
CBA5: 38       sec
CBA6: E5 05    sbc $05
CBA8: 85 05    sta $05
CBAA: A5 AA    lda $aa
CBAC: E5 06    sbc $06
CBAE: 85 06    sta $06
CBB0: A5 93    lda $93
CBB2: 18       clc
CBB3: 65 05    adc $05
CBB5: 85 93    sta $93
CBB7: A5 A1    lda $a1
CBB9: 65 06    adc $06
CBBB: 85 A1    sta $a1
CBBD: AD 8C 02 lda $028c
CBC0: 85 10    sta $10
CBC2: AD 99 02 lda $0299
CBC5: 85 11    sta $11
CBC7: 10 03    bpl $cbcc
CBC9: 20 98 CF jsr $cf98
CBCC: A5 10    lda $10
CBCE: 85 00    sta $00
CBD0: A5 11    lda $11
CBD2: 85 01    sta $01
CBD4: A9 00    lda #$00
CBD6: 85 02    sta $02
CBD8: AD 1F 04 lda $041f
CBDB: 85 03    sta $03
CBDD: 20 60 D1 jsr $d160
CBE0: 2C 99 02 bit $0299
CBE3: 10 03    bpl $cbe8
CBE5: 20 F0 CF jsr $cff0
CBE8: A5 BD    lda $bd
CBEA: 18       clc
CBEB: 65 05    adc $05
CBED: 85 05    sta $05
CBEF: A5 CB    lda $cb
CBF1: 65 06    adc $06
CBF3: 85 06    sta $06
CBF5: A5 C6    lda $c6
CBF7: 38       sec
CBF8: E5 05    sbc $05
CBFA: 85 05    sta $05
CBFC: A5 D4    lda $d4
CBFE: E5 06    sbc $06
CC00: 85 06    sta $06
CC02: A5 BD    lda $bd
CC04: 18       clc
CC05: 65 05    adc $05
CC07: 85 BD    sta $bd
CC09: A5 CB    lda $cb
CC0B: 65 06    adc $06
CC0D: 85 CB    sta $cb
CC0F: AD E0 03 lda $03e0
CC12: C9 07    cmp #$07
CC14: F0 08    beq $cc1e
CC16: C9 0A    cmp #$0a
CC18: 90 60    bcc $cc7a
CC1A: C9 0C    cmp #$0c
CC1C: B0 5C    bcs $cc7a
CC1E: AD A6 02 lda $02a6
CC21: 85 10    sta $10
CC23: AD B3 02 lda $02b3
CC26: 85 11    sta $11
CC28: 10 03    bpl $cc2d
CC2A: 20 98 CF jsr $cf98
CC2D: A5 10    lda $10
CC2F: 85 00    sta $00
CC31: A5 11    lda $11
CC33: 85 01    sta $01
CC35: A9 00    lda #$00
CC37: 85 02    sta $02
CC39: AD 1F 04 lda $041f
CC3C: 85 03    sta $03
CC3E: 20 60 D1 jsr $d160
CC41: 2C B3 02 bit $02b3
CC44: 10 03    bpl $cc49
CC46: 20 F0 CF jsr $cff0
CC49: A5 E7    lda $e7
CC4B: 18       clc
CC4C: 65 05    adc $05
CC4E: 85 05    sta $05
CC50: A5 F5    lda $f5
CC52: 65 06    adc $06
CC54: 85 06    sta $06
CC56: A5 F0    lda $f0
CC58: 38       sec
CC59: E5 05    sbc $05
CC5B: 85 05    sta $05
CC5D: A5 FE    lda $fe
CC5F: E5 06    sbc $06
CC61: 85 06    sta $06
CC63: A5 E7    lda $e7
CC65: 18       clc
CC66: 65 05    adc $05
CC68: 85 E7    sta $e7
CC6A: A5 F5    lda $f5
CC6C: 65 06    adc $06
CC6E: 85 F5    sta $f5
CC70: A9 00    lda #$00
CC72: 8D C0 02 sta $02c0
CC75: 8D CD 02 sta $02cd
CC78: F0 69    beq $cce3
CC7A: AD 1F 04 lda $041f
CC7D: 4A       lsr a
CC7E: 85 00    sta $00
CC80: A5 00    lda $00
CC82: 85 10    sta $10
CC84: A9 00    lda #$00
CC86: 85 11    sta $11
CC88: A9 40    lda #$40
CC8A: 85 12    sta $12
CC8C: A9 00    lda #$00
CC8E: 85 13    sta $13
CC90: 20 29 D1 jsr $d129
CC93: A5 14    lda $14
CC95: 8D A6 02 sta $02a6
CC98: A5 15    lda $15
CC9A: 8D B3 02 sta $02b3
CC9D: AD 1F 04 lda $041f
CCA0: 85 12    sta $12
CCA2: A9 00    lda #$00
CCA4: 85 13    sta $13
CCA6: A5 E2    lda $e2
CCA8: 38       sec
CCA9: E5 D9    sbc $d9
CCAB: 85 10    sta $10
CCAD: A5 F0    lda $f0
CCAF: E5 E7    sbc $e7
CCB1: 85 11    sta $11
CCB3: B0 0C    bcs $ccc1
CCB5: 20 98 CF jsr $cf98
CCB8: 20 2E D0 jsr $d02e
CCBB: 20 98 CF jsr $cf98
CCBE: 4C C8 CC jmp $ccc8
CCC1: 05 10    ora $10
CCC3: F0 14    beq $ccd9
CCC5: 20 2E D0 jsr $d02e
CCC8: AD A6 02 lda $02a6
CCCB: 18       clc
CCCC: 65 10    adc $10
CCCE: 8D A6 02 sta $02a6
CCD1: AD B3 02 lda $02b3
CCD4: 65 11    adc $11
CCD6: 8D B3 02 sta $02b3
CCD9: A9 40    lda #$40
CCDB: 8D C0 02 sta $02c0
CCDE: A9 00    lda #$00
CCE0: 8D CD 02 sta $02cd
CCE3: 60       rts

CCF5: A5 8E    lda $8e
CCF7: 38       sec
CCF8: E5 85    sbc $85
CCFA: 8D 16 04 sta $0416
CCFD: A5 9C    lda $9c
CCFF: E5 93    sbc $93
CD01: 8D 17 04 sta $0417
CD04: A5 AA    lda $aa
CD06: E5 A1    sbc $a1
CD08: 8D 18 04 sta $0418
CD0B: A5 B8    lda $b8
CD0D: 38       sec
CD0E: E5 AF    sbc $af
CD10: 8D 19 04 sta $0419
CD13: A5 C6    lda $c6
CD15: E5 BD    sbc $bd
CD17: 8D 1A 04 sta $041a
CD1A: A5 D4    lda $d4
CD1C: E5 CB    sbc $cb
CD1E: 8D 1B 04 sta $041b
CD21: A5 E2    lda $e2
CD23: 38       sec
CD24: E5 D9    sbc $d9
CD26: 8D 1C 04 sta $041c
CD29: A5 F0    lda $f0
CD2B: E5 E7    sbc $e7
CD2D: 8D 1D 04 sta $041d
CD30: A5 FE    lda $fe
CD32: E5 F5    sbc $f5
CD34: 8D 1E 04 sta $041e
CD37: 60       rts
CD38: A9 40    lda #$40
CD3A: 8D C0 02 sta $02c0
CD3D: 20 9F CD jsr $cd9f
CD40: 20 9F CD jsr $cd9f
CD43: A6 4C    ldx $4c
CD45: BD 1A 03 lda $031a, x
CD48: 29 7F    and #$7f
CD4A: C9 12    cmp #$12
CD4C: F0 08    beq $cd56
CD4E: C9 15    cmp #$15
CD50: F0 04    beq $cd56
CD52: C9 16    cmp #$16
CD54: D0 03    bne $cd59
CD56: 20 9F CD jsr $cd9f
CD59: AD A6 02 lda $02a6
CD5C: 85 10    sta $10
CD5E: AD B3 02 lda $02b3
CD61: 85 11    sta $11
CD63: 20 98 CF jsr $cf98
CD66: A5 10    lda $10
CD68: 8D A6 02 sta $02a6
CD6B: A5 11    lda $11
CD6D: 8D B3 02 sta $02b3
CD70: 20 AD CD jsr $cdad
CD73: 20 88 C5 jsr $c588
CD76: AD E9 03 lda $03e9
CD79: 29 0F    and #$0f
CD7B: C9 06    cmp #$06
CD7D: B0 06    bcs $cd85
CD7F: A5 56    lda $56
CD81: 29 DF    and #$df
CD83: 85 56    sta $56
CD85: AD 09 04 lda $0409
CD88: C9 02    cmp #$02
CD8A: 90 12    bcc $cd9e
CD8C: A9 22    lda #$22
CD8E: A6 4C    ldx $4c
CD90: 9D 27 03 sta $0327, x
CD93: A9 02    lda #$02
CD95: 9D 33 03 sta $0333, x
CD98: AD 15 04 lda $0415
CD9B: 9D 54 02 sta $0254, x
CD9E: 60       rts
CD9F: 18       clc
CDA0: 2C 7F 02 bit $027f
CDA3: 10 01    bpl $cda6
CDA5: 38       sec
CDA6: 6E 7F 02 ror $027f
CDA9: 6E 72 02 ror $0272
CDAC: 60       rts
CDAD: 18       clc
CDAE: 2C 99 02 bit $0299
CDB1: 10 01    bpl $cdb4
CDB3: 38       sec
CDB4: 6E 99 02 ror $0299
CDB7: 6E 8C 02 ror $028c
CDBA: 60       rts
CDBB: 18       clc
CDBC: 2C B3 02 bit $02b3
CDBF: 10 01    bpl $cdc2
CDC1: 38       sec
CDC2: 6E B3 02 ror $02b3
CDC5: 6E A6 02 ror $02a6
CDC8: 60       rts
CDC9: AD 72 02 lda $0272
CDCC: 85 10    sta $10
CDCE: AD 7F 02 lda $027f
CDD1: 85 11    sta $11
CDD3: 20 98 CF jsr $cf98
CDD6: A5 10    lda $10
CDD8: 8D 72 02 sta $0272
CDDB: A5 11    lda $11
CDDD: 8D 7F 02 sta $027f
CDE0: 60       rts
CDE1: A2 03    ldx #$03
CDE3: BD A0 03 lda $03a0, x
CDE6: F0 03    beq $cdeb
CDE8: DE A0 03 dec $03a0, x
CDEB: CA       dex
CDEC: 10 F5    bpl $cde3
CDEE: AD EE 03 lda $03ee
CDF1: F0 03    beq $cdf6
CDF3: CE EE 03 dec $03ee
CDF6: AD F4 03 lda $03f4
CDF9: F0 03    beq $cdfe
CDFB: CE F4 03 dec $03f4
CDFE: AD F9 03 lda $03f9
CE01: F0 03    beq $ce06
CE03: CE F9 03 dec $03f9
CE06: AD FF 03 lda $03ff
CE09: F0 03    beq $ce0e
CE0B: CE FF 03 dec $03ff
CE0E: AD 06 04 lda $0406
CE11: F0 03    beq $ce16
CE13: CE 06 04 dec $0406
CE16: 60       rts
CE17: 4C D8 CE jmp $ced8
CE1A: A5 46    lda $46
CE1C: 29 0F    and #$0f
CE1E: D0 F7    bne $ce17
CE20: A5 4F    lda $4f
CE22: 10 F3    bpl $ce17
CE24: AD E9 03 lda $03e9
CE27: 29 0F    and #$0f
CE29: C9 0F    cmp #$0f
CE2B: F0 EA    beq $ce17
CE2D: A5 56    lda $56
CE2F: 29 10    and #$10
CE31: 4A       lsr a
CE32: 4A       lsr a
CE33: 4A       lsr a
CE34: 4A       lsr a
CE35: A8       tay
CE36: B9 47 00 lda $0047, y
CE39: 10 19    bpl $ce54
CE3B: A5 56    lda $56
CE3D: 29 2F    and #$2f
CE3F: C9 03    cmp #$03
CE41: D0 11    bne $ce54
CE43: AD 11 04 lda $0411
CE46: 49 01    eor #$01
CE48: AA       tax
CE49: BD 0A 03 lda $030a, x
CE4C: 30 06    bmi $ce54
CE4E: A5 53    lda $53
CE50: C9 01    cmp #$01
CE52: F0 C3    beq $ce17
CE54: A2 00    ldx #$00
CE56: A5 56    lda $56
CE58: 29 10    and #$10
CE5A: 4A       lsr a
CE5B: 4A       lsr a
CE5C: 4A       lsr a
CE5D: 4A       lsr a
CE5E: A8       tay
CE5F: B9 47 00 lda $0047, y
CE62: 10 01    bpl $ce65
CE64: E8       inx
CE65: 86 00    stx $00
CE67: A5 37    lda $37
CE69: C9 02    cmp #$02
CE6B: 90 04    bcc $ce71
CE6D: A9 02    lda #$02
CE6F: 85 00    sta $00
CE71: AD E0 03 lda $03e0
CE74: 0A       asl a
CE75: 6D E0 03 adc $03e0
CE78: 65 00    adc $00
CE7A: A8       tay
CE7B: B9 D9 CE lda $ced9, y
CE7E: F0 58    beq $ced8
CE80: AD EA 03 lda $03ea
CE83: 85 9B    sta $9b
CE85: AD EB 03 lda $03eb
CE88: 85 A9    sta $a9
CE8A: AD EC 03 lda $03ec
CE8D: 85 C5    sta $c5
CE8F: AD ED 03 lda $03ed
CE92: 85 D3    sta $d3
CE94: A9 00    lda #$00
CE96: 85 EF    sta $ef
CE98: 85 FD    sta $fd
CE9A: AD E0 03 lda $03e0
CE9D: C9 08    cmp #$08
CE9F: F0 0A    beq $ceab
CEA1: C9 05    cmp #$05
CEA3: D0 19    bne $cebe
CEA5: A5 56    lda $56
CEA7: 29 20    and #$20
CEA9: D0 13    bne $cebe
CEAB: AD FB 03 lda $03fb
CEAE: 85 9B    sta $9b
CEB0: AD FC 03 lda $03fc
CEB3: 85 A9    sta $a9
CEB5: AD FD 03 lda $03fd
CEB8: 85 C5    sta $c5
CEBA: A9 00    lda #$00
CEBC: 85 D3    sta $d3
CEBE: A9 19    lda #$19
CEC0: 85 71    sta $71
CEC2: A9 02    lda #$02
CEC4: 85 7F    sta $7f
CEC6: AD F5 07 lda $07f5
CEC9: 29 04    and #$04
CECB: 4A       lsr a
CECC: 4A       lsr a
CECD: 05 7F    ora $7f
CECF: 85 7F    sta $7f
CED1: A9 0C    lda #$0c
CED3: 85 4C    sta $4c
CED5: 20 F3 DF jsr $dff3
CED8: 60       rts

CF0C: A2 2F    ldx #$2f
CF0E: A9 00    lda #$00
CF10: 95 00    sta $00, x
CF12: E8       inx
CF13: D0 FB    bne $cf10
CF15: 60       rts
CF16: 85 02    sta $02
CF18: A9 00    lda #$00
CF1A: 85 00    sta $00
CF1C: A9 02    lda #$02
CF1E: 85 01    sta $01
CF20: A0 00    ldy #$00
CF22: A9 00    lda #$00
CF24: 91 00    sta ($00), y
CF26: C8       iny
CF27: D0 FB    bne $cf24
CF29: E6 01    inc $01
CF2B: A5 01    lda $01
CF2D: C5 02    cmp $02
CF2F: 90 F1    bcc $cf22
CF31: 20 8F D8 jsr $d88f
CF34: 60       rts
CF35: A0 00    ldy #$00
CF37: A9 00    lda #$00
CF39: 85 10    sta $10
CF3B: 85 12    sta $12
CF3D: A9 20    lda #$20
CF3F: 85 11    sta $11
CF41: A9 30    lda #$30
CF43: 85 13    sta $13
CF45: A9 00    lda #$00
CF47: 91 10    sta ($10), y	; [video_address]
CF49: 91 12    sta ($12), y	; [video_address]
CF4B: C8       iny
CF4C: D0 F9    bne $cf47
CF4E: E6 11    inc $11
CF50: E6 13    inc $13
CF52: A5 11    lda $11
CF54: C9 30    cmp #$30
CF56: 90 ED    bcc $cf45
CF58: 60       rts
CF59: AE DA 06 ldx $06da
CF5C: A9 F8    lda #$f8
CF5E: 9D DB 06 sta $06db, x
CF61: 9D DE 06 sta $06de, x
CF64: A9 00    lda #$00
CF66: 9D DC 06 sta $06dc, x
CF69: 9D DD 06 sta $06dd, x
CF6C: E8       inx
CF6D: E8       inx
CF6E: E8       inx
CF6F: E8       inx
CF70: D0 EA    bne $cf5c
CF72: 60       rts
CF73: A2 00    ldx #$00
CF75: A9 00    lda #$00
CF77: 9D 01 08 sta $0801, x
CF7A: 9D DC 06 sta $06dc, x
CF7D: 9D 02 08 sta $0802, x
CF80: 9D DD 06 sta $06dd, x
CF83: A9 F8    lda #$f8
CF85: 9D 00 08 sta $0800, x
CF88: 9D DB 06 sta $06db, x
CF8B: 9D 03 08 sta $0803, x
CF8E: 9D DE 06 sta $06de, x
CF91: E8       inx
CF92: E8       inx
CF93: E8       inx
CF94: E8       inx
CF95: D0 DE    bne $cf75
CF97: 60       rts
CF98: A5 10    lda $10
CF9A: 49 FF    eor #$ff
CF9C: 18       clc
CF9D: 69 01    adc #$01
CF9F: 85 10    sta $10
CFA1: A5 11    lda $11
CFA3: 49 FF    eor #$ff
CFA5: 69 00    adc #$00
CFA7: 85 11    sta $11
CFA9: 60       rts
CFAA: A5 14    lda $14
CFAC: 49 FF    eor #$ff
CFAE: 18       clc
CFAF: 69 01    adc #$01
CFB1: 85 14    sta $14
CFB3: A5 15    lda $15
CFB5: 49 FF    eor #$ff
CFB7: 69 00    adc #$00
CFB9: 85 15    sta $15
CFBB: 60       rts
CFBC: A5 00    lda $00
CFBE: 49 FF    eor #$ff
CFC0: 18       clc
CFC1: 69 01    adc #$01
CFC3: 85 00    sta $00
CFC5: A5 10    lda $10
CFC7: 49 FF    eor #$ff
CFC9: 69 00    adc #$00
CFCB: 85 10    sta $10
CFCD: A5 11    lda $11
CFCF: 49 FF    eor #$ff
CFD1: 69 00    adc #$00
CFD3: 85 11    sta $11
CFD5: 60       rts
CFD6: A5 00    lda $00
CFD8: 49 FF    eor #$ff
CFDA: 18       clc
CFDB: 69 01    adc #$01
CFDD: 85 00    sta $00
CFDF: A5 01    lda $01
CFE1: 49 FF    eor #$ff
CFE3: 69 00    adc #$00
CFE5: 85 01    sta $01
CFE7: A5 02    lda $02
CFE9: 49 FF    eor #$ff
CFEB: 69 00    adc #$00
CFED: 85 02    sta $02
CFEF: 60       rts
CFF0: A5 04    lda $04
CFF2: 49 FF    eor #$ff
CFF4: 18       clc
CFF5: 69 01    adc #$01
CFF7: 85 04    sta $04
CFF9: A5 05    lda $05
CFFB: 49 FF    eor #$ff
CFFD: 69 00    adc #$00
CFFF: 85 05    sta $05
D001: A5 06    lda $06
D003: 49 FF    eor #$ff
D005: 69 00    adc #$00
D007: 85 06    sta $06
D009: 60       rts
D00A: 84 1A    sty $1a
D00C: A0 04    ldy #$04
D00E: E6 2B    inc $2b
D010: E6 2D    inc $2d
D012: 66 2C    ror $2c
D014: 66 2D    ror $2d
D016: 66 2E    ror $2e
D018: B0 06    bcs $d020
D01A: A5 2D    lda $2d
D01C: 65 2B    adc $2b
D01E: 85 2D    sta $2d
D020: 88       dey
D021: D0 EF    bne $d012
D023: A5 2C    lda $2c
D025: 65 2E    adc $2e
D027: 85 2E    sta $2e
D029: 65 2D    adc $2d
D02B: A4 1A    ldy $1a
D02D: 60       rts
D02E: 8A       txa
D02F: 48       pha
D030: 98       tya
D031: 48       pha
D032: A9 00    lda #$00
D034: 85 15    sta $15
D036: 85 14    sta $14
D038: A5 12    lda $12
D03A: 05 13    ora $13
D03C: D0 06    bne $d044
D03E: 85 10    sta $10
D040: 85 11    sta $11
D042: F0 3D    beq $d081
D044: A2 10    ldx #$10
D046: 18       clc
D047: 26 10    rol $10
D049: 26 11    rol $11
D04B: CA       dex
D04C: F0 33    beq $d081
D04E: 90 F7    bcc $d047
D050: A5 10    lda $10
D052: 09 01    ora #$01
D054: 85 10    sta $10
D056: E8       inx
D057: 86 00    stx $00
D059: B0 05    bcs $d060
D05B: 38       sec
D05C: 26 10    rol $10
D05E: 26 11    rol $11
D060: 26 14    rol $14
D062: 26 15    rol $15
D064: A6 14    ldx $14
D066: A4 15    ldy $15
D068: A5 14    lda $14
D06A: 38       sec
D06B: E5 12    sbc $12
D06D: 85 14    sta $14
D06F: A5 15    lda $15
D071: E5 13    sbc $13
D073: 85 15    sta $15
D075: B0 06    bcs $d07d
D077: 86 14    stx $14
D079: 84 15    sty $15
D07B: C6 10    dec $10
D07D: C6 00    dec $00
D07F: D0 DA    bne $d05b
D081: 68       pla
D082: A8       tay
D083: 68       pla
D084: AA       tax
D085: 60       rts
D086: 8A       txa
D087: 48       pha
D088: 98       tya
D089: 48       pha
D08A: A9 00    lda #$00
D08C: 85 03    sta $03
D08E: 85 04    sta $04
D090: 85 05    sta $05
D092: A5 10    lda $10
D094: 05 11    ora $11
D096: D0 08    bne $d0a0
D098: 85 00    sta $00
D09A: 85 01    sta $01
D09C: 85 02    sta $02
D09E: F0 59    beq $d0f9
D0A0: A2 18    ldx #$18
D0A2: 18       clc
D0A3: 26 00    rol $00
D0A5: 26 01    rol $01
D0A7: 26 02    rol $02
D0A9: CA       dex
D0AA: F0 4D    beq $d0f9
D0AC: 90 F5    bcc $d0a3
D0AE: A5 00    lda $00
D0B0: 09 01    ora #$01
D0B2: 85 00    sta $00
D0B4: E8       inx
D0B5: 86 0F    stx $0f
D0B7: B0 07    bcs $d0c0
D0B9: 38       sec
D0BA: 26 00    rol $00
D0BC: 26 01    rol $01
D0BE: 26 02    rol $02
D0C0: 26 03    rol $03
D0C2: 26 04    rol $04
D0C4: 26 05    rol $05
D0C6: A5 03    lda $03
D0C8: 85 06    sta $06
D0CA: A5 04    lda $04
D0CC: 85 07    sta $07
D0CE: A5 05    lda $05
D0D0: 85 08    sta $08
D0D2: A5 03    lda $03
D0D4: 38       sec
D0D5: E5 10    sbc $10
D0D7: 85 03    sta $03
D0D9: A5 04    lda $04
D0DB: E5 11    sbc $11
D0DD: 85 04    sta $04
D0DF: A5 05    lda $05
D0E1: E9 00    sbc #$00
D0E3: 85 05    sta $05
D0E5: B0 0E    bcs $d0f5
D0E7: A5 06    lda $06
D0E9: 85 03    sta $03
D0EB: A5 07    lda $07
D0ED: 85 04    sta $04
D0EF: A5 08    lda $08
D0F1: 85 05    sta $05
D0F3: C6 00    dec $00
D0F5: C6 0F    dec $0f
D0F7: D0 C0    bne $d0b9
D0F9: 68       pla
D0FA: A8       tay
D0FB: 68       pla
D0FC: AA       tax
D0FD: 60       rts
D0FE: 48       pha
D0FF: 8A       txa
D100: 48       pha
D101: A5 01    lda $01
D103: 48       pha
D104: A9 00    lda #$00
D106: 85 01    sta $01
D108: A2 10    ldx #$10
D10A: 18       clc
D10B: 26 10    rol $10
D10D: 26 11    rol $11
D10F: 26 01    rol $01
D111: A5 01    lda $01
D113: C5 00    cmp $00
D115: 90 04    bcc $d11b
D117: E5 00    sbc $00
D119: 85 01    sta $01
D11B: 26 10    rol $10
D11D: 26 11    rol $11
D11F: CA       dex
D120: D0 ED    bne $d10f
D122: 68       pla
D123: 85 01    sta $01
D125: 68       pla
D126: AA       tax
D127: 68       pla
D128: 60       rts
D129: 8A       txa
D12A: 48       pha
D12B: 98       tya
D12C: 48       pha
D12D: A9 00    lda #$00
D12F: 85 14    sta $14
D131: 85 15    sta $15
D133: A5 11    lda $11
D135: 05 10    ora $10
D137: F0 21    beq $d15a
D139: 46 11    lsr $11
D13B: 66 10    ror $10
D13D: 90 0F    bcc $d14e
D13F: 18       clc
D140: A5 14    lda $14
D142: 65 12    adc $12
D144: 85 14    sta $14
D146: A5 15    lda $15
D148: 65 13    adc $13
D14A: 85 15    sta $15
D14C: B0 06    bcs $d154
D14E: 06 12    asl $12
D150: 26 13    rol $13
D152: 90 DF    bcc $d133
D154: 68       pla
D155: A8       tay
D156: 68       pla
D157: AA       tax
D158: 38       sec
D159: 60       rts
D15A: 68       pla
D15B: A8       tay
D15C: 68       pla
D15D: AA       tax
D15E: 18       clc
D15F: 60       rts
D160: 8A       txa
D161: 48       pha
D162: 98       tya
D163: 48       pha
D164: A5 00    lda $00
D166: 85 07    sta $07
D168: A5 01    lda $01
D16A: 85 08    sta $08
D16C: A5 02    lda $02
D16E: 85 09    sta $09
D170: A9 00    lda #$00
D172: 85 04    sta $04
D174: 85 05    sta $05
D176: 85 06    sta $06
D178: A5 03    lda $03
D17A: F0 27    beq $d1a3
D17C: 46 03    lsr $03
D17E: 90 15    bcc $d195
D180: 18       clc
D181: A5 04    lda $04
D183: 65 07    adc $07
D185: 85 04    sta $04
D187: A5 05    lda $05
D189: 65 08    adc $08
D18B: 85 05    sta $05
D18D: A5 06    lda $06
D18F: 65 09    adc $09
D191: 85 06    sta $06
D193: B0 08    bcs $d19d
D195: 06 07    asl $07
D197: 26 08    rol $08
D199: 26 09    rol $09
D19B: 90 DB    bcc $d178
D19D: 68       pla
D19E: A8       tay
D19F: 68       pla
D1A0: AA       tax
D1A1: 38       sec
D1A2: 60       rts
D1A3: 68       pla
D1A4: A8       tay
D1A5: 68       pla
D1A6: AA       tax
D1A7: 18       clc
D1A8: 60       rts
D1A9: 85 10    sta $10
D1AB: 85 12    sta $12
D1AD: A9 00    lda #$00
D1AF: 85 11    sta $11
D1B1: 85 13    sta $13
D1B3: 20 29 D1 jsr $d129
D1B6: 60       rts
D1B7: AD DB 06 lda $06db
D1BA: 8D 00 08 sta $0800
D1BD: AD DC 06 lda $06dc
D1C0: 8D 01 08 sta $0801
D1C3: AD DD 06 lda $06dd
D1C6: 8D 02 08 sta $0802
D1C9: AD DE 06 lda $06de
D1CC: 8D 03 08 sta $0803
D1CF: AD DF 06 lda $06df
D1D2: 8D 04 08 sta $0804
D1D5: AD E0 06 lda $06e0
D1D8: 8D 05 08 sta $0805
D1DB: AD E1 06 lda $06e1
D1DE: 8D 06 08 sta $0806
D1E1: AD E2 06 lda $06e2
D1E4: 8D 07 08 sta $0807
D1E7: AD E3 06 lda $06e3
D1EA: 8D 08 08 sta $0808
D1ED: AD E4 06 lda $06e4
D1F0: 8D 09 08 sta $0809
D1F3: AD E5 06 lda $06e5
D1F6: 8D 0A 08 sta $080a
D1F9: AD E6 06 lda $06e6
D1FC: 8D 0B 08 sta $080b
D1FF: AD E7 06 lda $06e7
D202: 8D 0C 08 sta $080c
D205: AD E8 06 lda $06e8
D208: 8D 0D 08 sta $080d
D20B: AD E9 06 lda $06e9
D20E: 8D 0E 08 sta $080e
D211: AD EA 06 lda $06ea
D214: 8D 0F 08 sta $080f
D217: AD EB 06 lda $06eb
D21A: 8D 10 08 sta $0810
D21D: AD EC 06 lda $06ec
D220: 8D 11 08 sta $0811
D223: AD ED 06 lda $06ed
D226: 8D 12 08 sta $0812
D229: AD EE 06 lda $06ee
D22C: 8D 13 08 sta $0813
D22F: AD EF 06 lda $06ef
D232: 8D 14 08 sta $0814
D235: AD F0 06 lda $06f0
D238: 8D 15 08 sta $0815
D23B: AD F1 06 lda $06f1
D23E: 8D 16 08 sta $0816
D241: AD F2 06 lda $06f2
D244: 8D 17 08 sta $0817
D247: AD F3 06 lda $06f3
D24A: 8D 18 08 sta $0818
D24D: AD F4 06 lda $06f4
D250: 8D 19 08 sta $0819
D253: AD F5 06 lda $06f5
D256: 8D 1A 08 sta $081a
D259: AD F6 06 lda $06f6
D25C: 8D 1B 08 sta $081b
D25F: AD F7 06 lda $06f7
D262: 8D 1C 08 sta $081c
D265: AD F8 06 lda $06f8
D268: 8D 1D 08 sta $081d
D26B: AD F9 06 lda $06f9
D26E: 8D 1E 08 sta $081e
D271: AD FA 06 lda $06fa
D274: 8D 1F 08 sta $081f
D277: AD FB 06 lda $06fb
D27A: 8D 20 08 sta $0820
D27D: AD FC 06 lda $06fc
D280: 8D 21 08 sta $0821
D283: AD FD 06 lda $06fd
D286: 8D 22 08 sta $0822
D289: AD FE 06 lda $06fe
D28C: 8D 23 08 sta $0823
D28F: AD FF 06 lda $06ff
D292: 8D 24 08 sta $0824
D295: AD 00 07 lda $0700
D298: 8D 25 08 sta $0825
D29B: AD 01 07 lda $0701
D29E: 8D 26 08 sta $0826
D2A1: AD 02 07 lda $0702
D2A4: 8D 27 08 sta $0827
D2A7: AD 03 07 lda $0703
D2AA: 8D 28 08 sta $0828
D2AD: AD 04 07 lda $0704
D2B0: 8D 29 08 sta $0829
D2B3: AD 05 07 lda $0705
D2B6: 8D 2A 08 sta $082a
D2B9: AD 06 07 lda $0706
D2BC: 8D 2B 08 sta $082b
D2BF: AD 07 07 lda $0707
D2C2: 8D 2C 08 sta $082c
D2C5: AD 08 07 lda $0708
D2C8: 8D 2D 08 sta $082d
D2CB: AD 09 07 lda $0709
D2CE: 8D 2E 08 sta $082e
D2D1: AD 0A 07 lda $070a
D2D4: 8D 2F 08 sta $082f
D2D7: AD 0B 07 lda $070b
D2DA: 8D 30 08 sta $0830
D2DD: AD 0C 07 lda $070c
D2E0: 8D 31 08 sta $0831
D2E3: AD 0D 07 lda $070d
D2E6: 8D 32 08 sta $0832
D2E9: AD 0E 07 lda $070e
D2EC: 8D 33 08 sta $0833
D2EF: AD 0F 07 lda $070f
D2F2: 8D 34 08 sta $0834
D2F5: AD 10 07 lda $0710
D2F8: 8D 35 08 sta $0835
D2FB: AD 11 07 lda $0711
D2FE: 8D 36 08 sta $0836
D301: AD 12 07 lda $0712
D304: 8D 37 08 sta $0837
D307: AD 13 07 lda $0713
D30A: 8D 38 08 sta $0838
D30D: AD 14 07 lda $0714
D310: 8D 39 08 sta $0839
D313: AD 15 07 lda $0715
D316: 8D 3A 08 sta $083a
D319: AD 16 07 lda $0716
D31C: 8D 3B 08 sta $083b
D31F: AD 17 07 lda $0717
D322: 8D 3C 08 sta $083c
D325: AD 18 07 lda $0718
D328: 8D 3D 08 sta $083d
D32B: AD 19 07 lda $0719
D32E: 8D 3E 08 sta $083e
D331: AD 1A 07 lda $071a
D334: 8D 3F 08 sta $083f
D337: AD 1B 07 lda $071b
D33A: 8D 40 08 sta $0840
D33D: AD 1C 07 lda $071c
D340: 8D 41 08 sta $0841
D343: AD 1D 07 lda $071d
D346: 8D 42 08 sta $0842
D349: AD 1E 07 lda $071e
D34C: 8D 43 08 sta $0843
D34F: AD 1F 07 lda $071f
D352: 8D 44 08 sta $0844
D355: AD 20 07 lda $0720
D358: 8D 45 08 sta $0845
D35B: AD 21 07 lda $0721
D35E: 8D 46 08 sta $0846
D361: AD 22 07 lda $0722
D364: 8D 47 08 sta $0847
D367: AD 23 07 lda $0723
D36A: 8D 48 08 sta $0848
D36D: AD 24 07 lda $0724
D370: 8D 49 08 sta $0849
D373: AD 25 07 lda $0725
D376: 8D 4A 08 sta $084a
D379: AD 26 07 lda $0726
D37C: 8D 4B 08 sta $084b
D37F: AD 27 07 lda $0727
D382: 8D 4C 08 sta $084c
D385: AD 28 07 lda $0728
D388: 8D 4D 08 sta $084d
D38B: AD 29 07 lda $0729
D38E: 8D 4E 08 sta $084e
D391: AD 2A 07 lda $072a
D394: 8D 4F 08 sta $084f
D397: AD 2B 07 lda $072b
D39A: 8D 50 08 sta $0850
D39D: AD 2C 07 lda $072c
D3A0: 8D 51 08 sta $0851
D3A3: AD 2D 07 lda $072d
D3A6: 8D 52 08 sta $0852
D3A9: AD 2E 07 lda $072e
D3AC: 8D 53 08 sta $0853
D3AF: AD 2F 07 lda $072f
D3B2: 8D 54 08 sta $0854
D3B5: AD 30 07 lda $0730
D3B8: 8D 55 08 sta $0855
D3BB: AD 31 07 lda $0731
D3BE: 8D 56 08 sta $0856
D3C1: AD 32 07 lda $0732
D3C4: 8D 57 08 sta $0857
D3C7: AD 33 07 lda $0733
D3CA: 8D 58 08 sta $0858
D3CD: AD 34 07 lda $0734
D3D0: 8D 59 08 sta $0859
D3D3: AD 35 07 lda $0735
D3D6: 8D 5A 08 sta $085a
D3D9: AD 36 07 lda $0736
D3DC: 8D 5B 08 sta $085b
D3DF: AD 37 07 lda $0737
D3E2: 8D 5C 08 sta $085c
D3E5: AD 38 07 lda $0738
D3E8: 8D 5D 08 sta $085d
D3EB: AD 39 07 lda $0739
D3EE: 8D 5E 08 sta $085e
D3F1: AD 3A 07 lda $073a
D3F4: 8D 5F 08 sta $085f
D3F7: AD 3B 07 lda $073b
D3FA: 8D 60 08 sta $0860
D3FD: AD 3C 07 lda $073c
D400: 8D 61 08 sta $0861
D403: AD 3D 07 lda $073d
D406: 8D 62 08 sta $0862
D409: AD 3E 07 lda $073e
D40C: 8D 63 08 sta $0863
D40F: AD 3F 07 lda $073f
D412: 8D 64 08 sta $0864
D415: AD 40 07 lda $0740
D418: 8D 65 08 sta $0865
D41B: AD 41 07 lda $0741
D41E: 8D 66 08 sta $0866
D421: AD 42 07 lda $0742
D424: 8D 67 08 sta $0867
D427: AD 43 07 lda $0743
D42A: 8D 68 08 sta $0868
D42D: AD 44 07 lda $0744
D430: 8D 69 08 sta $0869
D433: AD 45 07 lda $0745
D436: 8D 6A 08 sta $086a
D439: AD 46 07 lda $0746
D43C: 8D 6B 08 sta $086b
D43F: AD 47 07 lda $0747
D442: 8D 6C 08 sta $086c
D445: AD 48 07 lda $0748
D448: 8D 6D 08 sta $086d
D44B: AD 49 07 lda $0749
D44E: 8D 6E 08 sta $086e
D451: AD 4A 07 lda $074a
D454: 8D 6F 08 sta $086f
D457: AD 4B 07 lda $074b
D45A: 8D 70 08 sta $0870
D45D: AD 4C 07 lda $074c
D460: 8D 71 08 sta $0871
D463: AD 4D 07 lda $074d
D466: 8D 72 08 sta $0872
D469: AD 4E 07 lda $074e
D46C: 8D 73 08 sta $0873
D46F: AD 4F 07 lda $074f
D472: 8D 74 08 sta $0874
D475: AD 50 07 lda $0750
D478: 8D 75 08 sta $0875
D47B: AD 51 07 lda $0751
D47E: 8D 76 08 sta $0876
D481: AD 52 07 lda $0752
D484: 8D 77 08 sta $0877
D487: AD 53 07 lda $0753
D48A: 8D 78 08 sta $0878
D48D: AD 54 07 lda $0754
D490: 8D 79 08 sta $0879
D493: AD 55 07 lda $0755
D496: 8D 7A 08 sta $087a
D499: AD 56 07 lda $0756
D49C: 8D 7B 08 sta $087b
D49F: AD 57 07 lda $0757
D4A2: 8D 7C 08 sta $087c
D4A5: AD 58 07 lda $0758
D4A8: 8D 7D 08 sta $087d
D4AB: AD 59 07 lda $0759
D4AE: 8D 7E 08 sta $087e
D4B1: AD 5A 07 lda $075a
D4B4: 8D 7F 08 sta $087f
D4B7: AD 5B 07 lda $075b
D4BA: 8D 80 08 sta $0880
D4BD: AD 5C 07 lda $075c
D4C0: 8D 81 08 sta $0881
D4C3: AD 5D 07 lda $075d
D4C6: 8D 82 08 sta $0882
D4C9: AD 5E 07 lda $075e
D4CC: 8D 83 08 sta $0883
D4CF: AD 5F 07 lda $075f
D4D2: 8D 84 08 sta $0884
D4D5: AD 60 07 lda $0760
D4D8: 8D 85 08 sta $0885
D4DB: AD 61 07 lda $0761
D4DE: 8D 86 08 sta $0886
D4E1: AD 62 07 lda $0762
D4E4: 8D 87 08 sta $0887
D4E7: AD 63 07 lda $0763
D4EA: 8D 88 08 sta $0888
D4ED: AD 64 07 lda $0764
D4F0: 8D 89 08 sta $0889
D4F3: AD 65 07 lda $0765
D4F6: 8D 8A 08 sta $088a
D4F9: AD 66 07 lda $0766
D4FC: 8D 8B 08 sta $088b
D4FF: AD 67 07 lda $0767
D502: 8D 8C 08 sta $088c
D505: AD 68 07 lda $0768
D508: 8D 8D 08 sta $088d
D50B: AD 69 07 lda $0769
D50E: 8D 8E 08 sta $088e
D511: AD 6A 07 lda $076a
D514: 8D 8F 08 sta $088f
D517: AD 6B 07 lda $076b
D51A: 8D 90 08 sta $0890
D51D: AD 6C 07 lda $076c
D520: 8D 91 08 sta $0891
D523: AD 6D 07 lda $076d
D526: 8D 92 08 sta $0892
D529: AD 6E 07 lda $076e
D52C: 8D 93 08 sta $0893
D52F: AD 6F 07 lda $076f
D532: 8D 94 08 sta $0894
D535: AD 70 07 lda $0770
D538: 8D 95 08 sta $0895
D53B: AD 71 07 lda $0771
D53E: 8D 96 08 sta $0896
D541: AD 72 07 lda $0772
D544: 8D 97 08 sta $0897
D547: AD 73 07 lda $0773
D54A: 8D 98 08 sta $0898
D54D: AD 74 07 lda $0774
D550: 8D 99 08 sta $0899
D553: AD 75 07 lda $0775
D556: 8D 9A 08 sta $089a
D559: AD 76 07 lda $0776
D55C: 8D 9B 08 sta $089b
D55F: AD 77 07 lda $0777
D562: 8D 9C 08 sta $089c
D565: AD 78 07 lda $0778
D568: 8D 9D 08 sta $089d
D56B: AD 79 07 lda $0779
D56E: 8D 9E 08 sta $089e
D571: AD 7A 07 lda $077a
D574: 8D 9F 08 sta $089f
D577: AD 7B 07 lda $077b
D57A: 8D A0 08 sta $08a0
D57D: AD 7C 07 lda $077c
D580: 8D A1 08 sta $08a1
D583: AD 7D 07 lda $077d
D586: 8D A2 08 sta $08a2
D589: AD 7E 07 lda $077e
D58C: 8D A3 08 sta $08a3
D58F: AD 7F 07 lda $077f
D592: 8D A4 08 sta $08a4
D595: AD 80 07 lda $0780
D598: 8D A5 08 sta $08a5
D59B: AD 81 07 lda $0781
D59E: 8D A6 08 sta $08a6
D5A1: AD 82 07 lda $0782
D5A4: 8D A7 08 sta $08a7
D5A7: AD 83 07 lda $0783
D5AA: 8D A8 08 sta $08a8
D5AD: AD 84 07 lda $0784
D5B0: 8D A9 08 sta $08a9
D5B3: AD 85 07 lda $0785
D5B6: 8D AA 08 sta $08aa
D5B9: AD 86 07 lda $0786
D5BC: 8D AB 08 sta $08ab
D5BF: AD 87 07 lda $0787
D5C2: 8D AC 08 sta $08ac
D5C5: AD 88 07 lda $0788
D5C8: 8D AD 08 sta $08ad
D5CB: AD 89 07 lda $0789
D5CE: 8D AE 08 sta $08ae
D5D1: AD 8A 07 lda $078a
D5D4: 8D AF 08 sta $08af
D5D7: AD 8B 07 lda $078b
D5DA: 8D B0 08 sta $08b0
D5DD: AD 8C 07 lda $078c
D5E0: 8D B1 08 sta $08b1
D5E3: AD 8D 07 lda $078d
D5E6: 8D B2 08 sta $08b2
D5E9: AD 8E 07 lda $078e
D5EC: 8D B3 08 sta $08b3
D5EF: AD 8F 07 lda $078f
D5F2: 8D B4 08 sta $08b4
D5F5: AD 90 07 lda $0790
D5F8: 8D B5 08 sta $08b5
D5FB: AD 91 07 lda $0791
D5FE: 8D B6 08 sta $08b6
D601: AD 92 07 lda $0792
D604: 8D B7 08 sta $08b7
D607: AD 93 07 lda $0793
D60A: 8D B8 08 sta $08b8
D60D: AD 94 07 lda $0794
D610: 8D B9 08 sta $08b9
D613: AD 95 07 lda $0795
D616: 8D BA 08 sta $08ba
D619: AD 96 07 lda $0796
D61C: 8D BB 08 sta $08bb
D61F: AD 97 07 lda $0797
D622: 8D BC 08 sta $08bc
D625: AD 98 07 lda $0798
D628: 8D BD 08 sta $08bd
D62B: AD 99 07 lda $0799
D62E: 8D BE 08 sta $08be
D631: AD 9A 07 lda $079a
D634: 8D BF 08 sta $08bf
D637: AD 9B 07 lda $079b
D63A: 8D C0 08 sta $08c0
D63D: AD 9C 07 lda $079c
D640: 8D C1 08 sta $08c1
D643: AD 9D 07 lda $079d
D646: 8D C2 08 sta $08c2
D649: AD 9E 07 lda $079e
D64C: 8D C3 08 sta $08c3
D64F: AD 9F 07 lda $079f
D652: 8D C4 08 sta $08c4
D655: AD A0 07 lda $07a0
D658: 8D C5 08 sta $08c5
D65B: AD A1 07 lda $07a1
D65E: 8D C6 08 sta $08c6
D661: AD A2 07 lda $07a2
D664: 8D C7 08 sta $08c7
D667: AD A3 07 lda $07a3
D66A: 8D C8 08 sta $08c8
D66D: AD A4 07 lda $07a4
D670: 8D C9 08 sta $08c9
D673: AD A5 07 lda $07a5
D676: 8D CA 08 sta $08ca
D679: AD A6 07 lda $07a6
D67C: 8D CB 08 sta $08cb
D67F: AD A7 07 lda $07a7
D682: 8D CC 08 sta $08cc
D685: AD A8 07 lda $07a8
D688: 8D CD 08 sta $08cd
D68B: AD A9 07 lda $07a9
D68E: 8D CE 08 sta $08ce
D691: AD AA 07 lda $07aa
D694: 8D CF 08 sta $08cf
D697: AD AB 07 lda $07ab
D69A: 8D D0 08 sta $08d0
D69D: AD AC 07 lda $07ac
D6A0: 8D D1 08 sta $08d1
D6A3: AD AD 07 lda $07ad
D6A6: 8D D2 08 sta $08d2
D6A9: AD AE 07 lda $07ae
D6AC: 8D D3 08 sta $08d3
D6AF: AD AF 07 lda $07af
D6B2: 8D D4 08 sta $08d4
D6B5: AD B0 07 lda $07b0
D6B8: 8D D5 08 sta $08d5
D6BB: AD B1 07 lda $07b1
D6BE: 8D D6 08 sta $08d6
D6C1: AD B2 07 lda $07b2
D6C4: 8D D7 08 sta $08d7
D6C7: AD B3 07 lda $07b3
D6CA: 8D D8 08 sta $08d8
D6CD: AD B4 07 lda $07b4
D6D0: 8D D9 08 sta $08d9
D6D3: AD B5 07 lda $07b5
D6D6: 8D DA 08 sta $08da
D6D9: AD B6 07 lda $07b6
D6DC: 8D DB 08 sta $08db
D6DF: AD B7 07 lda $07b7
D6E2: 8D DC 08 sta $08dc
D6E5: AD B8 07 lda $07b8
D6E8: 8D DD 08 sta $08dd
D6EB: AD B9 07 lda $07b9
D6EE: 8D DE 08 sta $08de
D6F1: AD BA 07 lda $07ba
D6F4: 8D DF 08 sta $08df
D6F7: AD BB 07 lda $07bb
D6FA: 8D E0 08 sta $08e0
D6FD: AD BC 07 lda $07bc
D700: 8D E1 08 sta $08e1
D703: AD BD 07 lda $07bd
D706: 8D E2 08 sta $08e2
D709: AD BE 07 lda $07be
D70C: 8D E3 08 sta $08e3
D70F: AD BF 07 lda $07bf
D712: 8D E4 08 sta $08e4
D715: AD C0 07 lda $07c0
D718: 8D E5 08 sta $08e5
D71B: AD C1 07 lda $07c1
D71E: 8D E6 08 sta $08e6
D721: AD C2 07 lda $07c2
D724: 8D E7 08 sta $08e7
D727: AD C3 07 lda $07c3
D72A: 8D E8 08 sta $08e8
D72D: AD C4 07 lda $07c4
D730: 8D E9 08 sta $08e9
D733: AD C5 07 lda $07c5
D736: 8D EA 08 sta $08ea
D739: AD C6 07 lda $07c6
D73C: 8D EB 08 sta $08eb
D73F: AD C7 07 lda $07c7
D742: 8D EC 08 sta $08ec
D745: AD C8 07 lda $07c8
D748: 8D ED 08 sta $08ed
D74B: AD C9 07 lda $07c9
D74E: 8D EE 08 sta $08ee
D751: AD CA 07 lda $07ca
D754: 8D EF 08 sta $08ef
D757: AD CB 07 lda $07cb
D75A: 8D F0 08 sta $08f0
D75D: AD CC 07 lda $07cc
D760: 8D F1 08 sta $08f1
D763: AD CD 07 lda $07cd
D766: 8D F2 08 sta $08f2
D769: AD CE 07 lda $07ce
D76C: 8D F3 08 sta $08f3
D76F: AD CF 07 lda $07cf
D772: 8D F4 08 sta $08f4
D775: AD D0 07 lda $07d0
D778: 8D F5 08 sta $08f5
D77B: AD D1 07 lda $07d1
D77E: 8D F6 08 sta $08f6
D781: AD D2 07 lda $07d2
D784: 8D F7 08 sta $08f7
D787: AD D3 07 lda $07d3
D78A: 8D F8 08 sta $08f8
D78D: AD D4 07 lda $07d4
D790: 8D F9 08 sta $08f9
D793: AD D5 07 lda $07d5
D796: 8D FA 08 sta $08fa
D799: AD D6 07 lda $07d6
D79C: 8D FB 08 sta $08fb
D79F: AD D7 07 lda $07d7
D7A2: 8D FC 08 sta $08fc
D7A5: AD D8 07 lda $07d8
D7A8: 8D FD 08 sta $08fd
D7AB: AD D9 07 lda $07d9
D7AE: 8D FE 08 sta $08fe
D7B1: AD DA 07 lda $07da
D7B4: 8D FF 08 sta $08ff
D7B7: 60       rts
D7B8: 8D F2 07 sta $07f2
D7BB: 8A       txa
D7BC: 48       pha
D7BD: AE E9 07 ldx $07e9
D7C0: E0 08    cpx #$08
D7C2: B0 09    bcs $d7cd
D7C4: AD F2 07 lda $07f2
D7C7: 9D EA 07 sta $07ea, x
D7CA: EE E9 07 inc $07e9
D7CD: 68       pla
D7CE: AA       tax
D7CF: 60       rts
D7D0: AD E9 07 lda $07e9
D7D3: F0 25    beq $d7fa
D7D5: A5 36    lda $36
D7D7: D0 05    bne $d7de
D7D9: 2C 04 10 bit dsw2_1004
D7DC: 10 0C    bpl $d7ea
D7DE: AD EA 07 lda $07ea
D7E1: F0 07    beq $d7ea
D7E3: C9 52    cmp #$52
D7E5: B0 03    bcs $d7ea
D7E7: 8D 0D 10 sta sound_100d
D7EA: A2 00    ldx #$00
D7EC: BD EB 07 lda $07eb, x
D7EF: 9D EA 07 sta $07ea, x
D7F2: E8       inx
D7F3: E0 07    cpx #$07
D7F5: 90 F5    bcc $d7ec
D7F7: CE E9 07 dec $07e9
D7FA: 60       rts
D7FB: 0A       asl a
D7FC: 65 00    adc $00
D7FE: AA       tax
D7FF: F8       sed
D800: AD 16 04 lda $0416
D803: 18       clc
D804: 75 3C    adc $3c, x
D806: 95 3C    sta $3c, x
D808: AD 17 04 lda $0417
D80B: 75 3D    adc $3d, x
D80D: 95 3D    sta $3d, x
D80F: AD 18 04 lda $0418
D812: 75 3E    adc $3e, x
D814: 95 3E    sta $3e, x
D816: D8       cld
D817: 90 08    bcc $d821
D819: A9 99    lda #$99
D81B: 95 3C    sta $3c, x
D81D: 95 3D    sta $3d, x
D81F: 95 3E    sta $3e, x
D821: 60       rts
D822: A9 5A    lda #$5a
D824: 85 2F    sta $2f
D826: A5 2F    lda $2f
D828: D0 FC    bne $d826
D82A: 60       rts
D82B: 8D F6 07 sta $07f6
D82E: 8A       txa
D82F: 48       pha
D830: 98       tya
D831: 48       pha
D832: 20 22 D8 jsr $d822
D835: CE F6 07 dec $07f6
D838: D0 F8    bne $d832
D83A: 68       pla
D83B: A8       tay
D83C: 68       pla
D83D: AA       tax
D83E: 60       rts
D83F: 8D F6 07 sta $07f6
D842: 8A       txa
D843: 48       pha
D844: 98       tya
D845: 48       pha
D846: 20 22 D8 jsr $d822
D849: AD 01 10 lda p2_1001
D84C: 2D 00 10 and p1_1000
D84F: 2C 03 10 bit dsw1_1003
D852: 30 06    bmi $d85a
D854: 2D 05 10 and $1005
D857: 2D 06 10 and $1006
D85A: 29 F0    and #$f0
D85C: C9 F0    cmp #$f0
D85E: D0 05    bne $d865
D860: CE F6 07 dec $07f6
D863: D0 E1    bne $d846
D865: 68       pla
D866: A8       tay
D867: 68       pla
D868: AA       tax
D869: 60       rts
D86A: 8D F6 07 sta $07f6
D86D: 20 22 D8 jsr $d822
D870: CE F6 07 dec $07f6
D873: D0 F8    bne $d86d
D875: 60       rts
D876: 48       pha
D877: 8A       txa
D878: 48       pha
D879: 98       tya
D87A: 48       pha
D87B: A2 7E    ldx #$7e
D87D: AD 2C 02 lda $022c
D880: 29 01    and #$01
D882: F0 02    beq $d886
D884: A2 B0    ldx #$b0
D886: CA       dex
D887: D0 FD    bne $d886
D889: 68       pla
D88A: A8       tay
D88B: 68       pla
D88C: AA       tax
D88D: 68       pla
D88E: 60       rts
D88F: AD 2C 02 lda $022c
D892: 29 FE    and #$fe
D894: 2C 04 10 bit dsw2_1004
D897: 70 02    bvs $d89b
D899: 09 01    ora #$01
D89B: 8D 2C 02 sta $022c
D89E: 8D 08 10 sta scrollx_hi_1008
D8A1: 60       rts
D8A2: AD F4 07 lda $07f4
D8A5: 29 07    and #$07
D8A7: 0A       asl a
D8A8: 0A       asl a
D8A9: 0A       asl a
D8AA: 85 00    sta $00
D8AC: AD F3 07 lda $07f3
D8AF: 29 07    and #$07
D8B1: 05 00    ora $00
D8B3: 0A       asl a
D8B4: 0A       asl a
D8B5: 85 00    sta $00
D8B7: AD 2C 02 lda $022c
D8BA: 29 03    and #$03
D8BC: 05 00    ora $00
D8BE: 8D 2C 02 sta $022c
D8C1: 8D 08 10 sta scrollx_hi_1008
D8C4: 60       rts
D8C5: AD F4 07 lda $07f4
D8C8: 29 07    and #$07
D8CA: 0A       asl a
D8CB: 0A       asl a
D8CC: 0A       asl a
D8CD: 0A       asl a
D8CE: 0A       asl a
D8CF: 85 00    sta $00
D8D1: AD 2C 02 lda $022c
D8D4: 29 1F    and #$1f
D8D6: 05 00    ora $00
D8D8: 8D 2C 02 sta $022c
D8DB: 8D 08 10 sta scrollx_hi_1008
D8DE: 60       rts
D8DF: 85 00    sta $00
D8E1: AD 2D 02 lda bankswitch_copy_022d
D8E4: 29 F8    and #$f8
D8E6: 05 00    ora $00
D8E8: 8D 2D 02 sta bankswitch_copy_022d
D8EB: 8D 09 10 sta bankswitch_1009
D8EE: 60       rts
D8EF: 98       tya
D8F0: 48       pha
D8F1: AD 2E 02 lda $022e
D8F4: 8D 36 02 sta $0236
D8F7: AD 00 10 lda p1_1000
D8FA: 49 FF    eor #$ff
D8FC: 8D 2E 02 sta $022e
D8FF: 2C 03 10 bit dsw1_1003
D902: 30 10    bmi $d914
D904: 70 0E    bvs $d914
D906: 29 0F    and #$0f
D908: A8       tay
D909: AD 2E 02 lda $022e
D90C: 29 F0    and #$f0
D90E: 19 86 D9 ora $d986, y
D911: 8D 2E 02 sta $022e
D914: AD 2F 02 lda $022f
D917: 8D 37 02 sta $0237
D91A: AD 01 10 lda p2_1001
D91D: 49 FF    eor #$ff
D91F: 8D 2F 02 sta $022f
D922: AD 30 02 lda $0230
D925: 8D 38 02 sta $0238
D928: AD 05 10 lda $1005
D92B: 49 FF    eor #$ff
D92D: 8D 30 02 sta $0230
D930: AD 31 02 lda $0231
D933: 8D 39 02 sta $0239
D936: AD 06 10 lda $1006
D939: 49 FF    eor #$ff
D93B: 8D 31 02 sta $0231
D93E: 2C 03 10 bit dsw1_1003
D941: 30 10    bmi $d953
D943: 70 0E    bvs $d953
D945: 29 0F    and #$0f
D947: A8       tay
D948: AD 31 02 lda $0231
D94B: 29 F0    and #$f0
D94D: 19 96 D9 ora $d996, y
D950: 8D 31 02 sta $0231
D953: AD 36 02 lda $0236
D956: 2D 2E 02 and $022e
D959: 4D 2E 02 eor $022e
D95C: 8D 32 02 sta $0232
D95F: AD 37 02 lda $0237
D962: 2D 2F 02 and $022f
D965: 4D 2F 02 eor $022f
D968: 8D 33 02 sta $0233
D96B: AD 38 02 lda $0238
D96E: 2D 30 02 and $0230
D971: 4D 30 02 eor $0230
D974: 8D 34 02 sta $0234
D977: AD 39 02 lda $0239
D97A: 2D 31 02 and $0231
D97D: 4D 31 02 eor $0231
D980: 8D 35 02 sta $0235
D983: 68       pla
D984: A8       tay
D985: 60       rts

D9A6: 85 0C    sta $0c
D9A8: 8A       txa
D9A9: 48       pha
D9AA: 98       tya
D9AB: 48       pha
D9AC: A5 0C    lda $0c
D9AE: 0A       asl a
D9AF: 0A       asl a
D9B0: 0A       asl a
D9B1: 38       sec
D9B2: E5 0C    sbc $0c
D9B4: A8       tay
D9B5: B9 47 DA lda $da47, y
D9B8: 85 10    sta $10
D9BA: 85 12    sta $12
D9BC: B9 48 DA lda $da48, y
D9BF: 85 11    sta $11
D9C1: 18       clc
D9C2: 69 10    adc #$10
D9C4: 85 13    sta $13
D9C6: B9 49 DA lda $da49, y
D9C9: 85 0E    sta $0e
D9CB: C6 0E    dec $0e
D9CD: 4A       lsr a
D9CE: 08       php
D9CF: 69 00    adc #$00
D9D1: 85 0F    sta $0f
D9D3: B9 4A DA lda $da4a, y
D9D6: 85 14    sta $14
D9D8: B9 4B DA lda $da4b, y
D9DB: 85 15    sta $15
D9DD: B9 4C DA lda $da4c, y
D9E0: 85 0D    sta $0d
D9E2: B9 4D DA lda $da4d, y
D9E5: 85 0B    sta $0b
D9E7: A9 00    lda #$00
D9E9: 28       plp
D9EA: 90 02    bcc $d9ee
D9EC: A9 FF    lda #$ff
D9EE: 85 0C    sta $0c
D9F0: A4 0F    ldy $0f
D9F2: 88       dey
D9F3: B1 14    lda ($14), y
D9F5: 24 0C    bit $0c
D9F7: 30 09    bmi $da02
D9F9: 48       pha
D9FA: 4A       lsr a
D9FB: 4A       lsr a
D9FC: 4A       lsr a
D9FD: 4A       lsr a
D9FE: 20 12 DA jsr $da12
DA01: 68       pla
DA02: 20 12 DA jsr $da12
DA05: A9 00    lda #$00
DA07: 85 0C    sta $0c
DA09: C6 0F    dec $0f
DA0B: D0 E3    bne $d9f0
DA0D: 68       pla
DA0E: A8       tay
DA0F: 68       pla
DA10: AA       tax
DA11: 60       rts
DA12: 29 0F    and #$0f
DA14: F0 04    beq $da1a
DA16: A0 00    ldy #$00
DA18: 84 0E    sty $0e
DA1A: A4 0E    ldy $0e
DA1C: F0 07    beq $da25
DA1E: C6 0E    dec $0e
DA20: A9 00    lda #$00
DA22: 4C 32 DA jmp $da32
DA25: 18       clc
DA26: C9 0A    cmp #$0a
DA28: 90 04    bcc $da2e
DA2A: 69 16    adc #$16
DA2C: D0 02    bne $da30
DA2E: 69 10    adc #$10
DA30: 65 0D    adc $0d
DA32: A0 00    ldy #$00
DA34: 91 10    sta ($10), y
DA36: A5 0B    lda $0b
DA38: 91 12    sta ($12), y
DA3A: E6 10    inc $10
DA3C: D0 02    bne $da40
DA3E: E6 11    inc $11
DA40: E6 12    inc $12
DA42: D0 02    bne $da46
DA44: E6 13    inc $13
DA46: 60       rts

DA7F: 85 0F    sta $0f
DA81: 85 10    sta $10
DA83: 8A       txa
DA84: 48       pha
DA85: 98       tya
DA86: 48       pha
DA87: A5 0F    lda $0f
DA89: 29 3F    and #$3f
DA8B: 0A       asl a
DA8C: AA       tax
DA8D: BD 51 DB lda $db51, x
DA90: 85 10    sta $10
DA92: BD 52 DB lda $db52, x
DA95: 85 11    sta $11
DA97: A0 00    ldy #$00
DA99: 84 0E    sty $0e
DA9B: B1 10    lda ($10), y
DA9D: C8       iny
DA9E: 85 0D    sta $0d
DAA0: B1 10    lda ($10), y
DAA2: C8       iny
DAA3: 85 0B    sta $0b
DAA5: B1 10    lda ($10), y
DAA7: C8       iny
DAA8: 85 12    sta $12
DAAA: 85 14    sta $14
DAAC: B1 10    lda ($10), y
DAAE: C8       iny
DAAF: 85 13    sta $13
DAB1: 18       clc
DAB2: 69 10    adc #$10
DAB4: 85 15    sta $15
DAB6: B1 10    lda ($10), y
DAB8: C8       iny
DAB9: C9 FF    cmp #$ff
DABB: D0 03    bne $dac0
DABD: 4C 4C DB jmp $db4c
DAC0: C9 FE    cmp #$fe
DAC2: F0 E1    beq $daa5
DAC4: C9 FD    cmp #$fd
DAC6: D0 08    bne $dad0
DAC8: B1 10    lda ($10), y
DACA: C8       iny
DACB: 85 0D    sta $0d
DACD: 4C B6 DA jmp $dab6
DAD0: C9 FC    cmp #$fc
DAD2: D0 0C    bne $dae0
DAD4: A9 80    lda #$80
DAD6: 85 0E    sta $0e
DAD8: B1 10    lda ($10), y
DADA: C8       iny
DADB: 85 0C    sta $0c
DADD: 4C B6 DA jmp $dab6
DAE0: C9 FB    cmp #$fb
DAE2: D0 07    bne $daeb
DAE4: A9 00    lda #$00
DAE6: 85 0E    sta $0e
DAE8: 4C B6 DA jmp $dab6
DAEB: C9 FA    cmp #$fa
DAED: D0 13    bne $db02
DAEF: B1 10    lda ($10), y
DAF1: C8       iny
DAF2: 18       clc
DAF3: 65 12    adc $12
DAF5: 85 12    sta $12
DAF7: 85 14    sta $14
DAF9: 90 04    bcc $daff
DAFB: E6 13    inc $13
DAFD: E6 15    inc $15
DAFF: 4C B6 DA jmp $dab6
DB02: 24 0F    bit $0f
DB04: 10 06    bpl $db0c
DB06: A9 00    lda #$00
DB08: 85 0D    sta $0d
DB0A: A9 20    lda #$20
DB0C: A2 00    ldx #$00
DB0E: 38       sec
DB0F: E9 20    sbc #$20
DB11: F0 03    beq $db16
DB13: 18       clc
DB14: 65 0D    adc $0d
DB16: 81 12    sta ($12, x)
DB18: A5 0B    lda $0b
DB1A: 81 14    sta ($14, x)
DB1C: E6 12    inc $12
DB1E: D0 02    bne $db22
DB20: E6 13    inc $13
DB22: E6 14    inc $14
DB24: D0 02    bne $db28
DB26: E6 15    inc $15
DB28: 24 0E    bit $0e
DB2A: 30 03    bmi $db2f
DB2C: 4C B6 DA jmp $dab6
DB2F: 24 0F    bit $0f
DB31: 10 03    bpl $db36
DB33: 4C B6 DA jmp $dab6
DB36: A6 0C    ldx $0c
DB38: AD 02 10 lda system_1002
DB3B: 29 01    and #$01
DB3D: F0 F9    beq $db38
DB3F: AD 02 10 lda system_1002
DB42: 29 01    and #$01
DB44: D0 F9    bne $db3f
DB46: CA       dex
DB47: 10 EF    bpl $db38
DB49: 4C B6 DA jmp $dab6
DB4C: 68       pla
DB4D: A8       tay
DB4E: 68       pla
DB4F: AA       tax
DB50: 60       rts

; this region contains ascii strings

DFF3: A9 01    lda #$01
DFF5: 20 DF D8 jsr $d8df
DFF8: AD DA 06 lda $06da
DFFB: C9 FC    cmp #$fc
DFFD: 90 03    bcc $e002
DFFF: 4C 7E E1 jmp $e17e
E002: A6 4C    ldx $4c
E004: B5 65    lda $65, x
E006: 0A       asl a
E007: A8       tay
E008: B9 00 40 lda $4000, y
E00B: 85 00    sta $00
E00D: B9 01 40 lda $4001, y
E010: 85 01    sta $01
E012: B5 73    lda $73, x
E014: 0A       asl a
E015: A8       tay
E016: B1 00    lda ($00), y
E018: 85 10    sta $10
E01A: C8       iny
E01B: B1 00    lda ($00), y
E01D: 85 11    sta $11
E01F: B5 B9    lda $b9, x
E021: 18       clc
E022: 75 E3    adc $e3, x
E024: 85 02    sta $02
E026: B5 C7    lda $c7, x
E028: 75 F1    adc $f1, x
E02A: 85 03    sta $03
E02C: A5 02    lda $02
E02E: 38       sec
E02F: ED E0 07 sbc $07e0
E032: 85 02    sta $02
E034: A5 03    lda $03
E036: ED E1 07 sbc $07e1
E039: 85 03    sta $03
E03B: B5 8F    lda $8f, x
E03D: 38       sec
E03E: ED DE 07 sbc $07de
E041: 85 00    sta $00
E043: B5 9D    lda $9d, x
E045: ED DF 07 sbc $07df
E048: 85 01    sta $01
E04A: B5 73    lda $73, x
E04C: 4A       lsr a
E04D: 29 40    and #$40
E04F: 49 40    eor #$40
E051: 85 04    sta $04
E053: B4 65    ldy $65, x
E055: B9 84 E1 lda $e184, y
E058: 85 05    sta $05
E05A: A0 00    ldy #$00
E05C: B1 10    lda ($10), y
E05E: 85 0C    sta $0c
E060: D0 03    bne $e065
E062: 4C 7E E1 jmp $e17e
E065: C8       iny
E066: B1 10    lda ($10), y
E068: 85 06    sta $06
E06A: C8       iny
E06B: 24 06    bit $06
E06D: 10 05    bpl $e074
E06F: B1 10    lda ($10), y
E071: 85 07    sta $07
E073: C8       iny
E074: 50 05    bvc $e07b
E076: B1 10    lda ($10), y
E078: 85 08    sta $08
E07A: C8       iny
E07B: A5 06    lda $06
E07D: 29 08    and #$08
E07F: F0 15    beq $e096
E081: 2C 3A 02 bit $023a
E084: 30 0E    bmi $e094
E086: B1 10    lda ($10), y
E088: 48       pha
E089: C8       iny
E08A: B1 10    lda ($10), y
E08C: 85 11    sta $11
E08E: 68       pla
E08F: 85 10    sta $10
E091: 4C 5A E0 jmp $e05a
E094: C8       iny
E095: C8       iny
E096: A5 06    lda $06
E098: 29 30    and #$30
E09A: F0 0E    beq $e0aa
E09C: B1 10    lda ($10), y
E09E: 85 12    sta $12
E0A0: C8       iny
E0A1: B1 10    lda ($10), y
E0A3: 85 13    sta $13
E0A5: C8       iny
E0A6: A9 00    lda #$00
E0A8: 85 09    sta $09
E0AA: AE DA 06 ldx $06da
E0AD: A5 07    lda $07
E0AF: 24 06    bit $06
E0B1: 30 03    bmi $e0b6
E0B3: B1 10    lda ($10), y
E0B5: C8       iny
E0B6: 05 05    ora $05
E0B8: 45 04    eor $04
E0BA: 49 40    eor #$40
E0BC: 9D DC 06 sta $06dc, x
E0BF: 85 0A    sta $0a
E0C1: A5 06    lda $06
E0C3: 29 08    and #$08
E0C5: F0 0A    beq $e0d1
E0C7: BD DC 06 lda $06dc, x
E0CA: 29 C7    and #$c7
E0CC: 09 30    ora #$30
E0CE: 9D DC 06 sta $06dc, x
E0D1: 50 0D    bvc $e0e0
E0D3: A5 08    lda $08
E0D5: E6 08    inc $08
E0D7: 24 0A    bit $0a
E0D9: 10 08    bpl $e0e3
E0DB: E6 08    inc $08
E0DD: 4C E3 E0 jmp $e0e3
E0E0: B1 10    lda ($10), y
E0E2: C8       iny
E0E3: 9D DD 06 sta $06dd, x
E0E6: 84 0D    sty $0d
E0E8: A5 06    lda $06
E0EA: 29 20    and #$20
E0EC: D0 0A    bne $e0f8
E0EE: A5 10    lda $10
E0F0: 85 12    sta $12
E0F2: A5 11    lda $11
E0F4: 85 13    sta $13
E0F6: 84 09    sty $09
E0F8: A4 09    ldy $09
E0FA: B1 12    lda ($12), y
E0FC: C8       iny
E0FD: 24 04    bit $04
E0FF: 50 05    bvc $e106
E101: 49 FF    eor #$ff
E103: 18       clc
E104: 69 01    adc #$01
E106: 18       clc
E107: 29 FF    and #$ff
E109: 08       php
E10A: 65 00    adc $00
E10C: 9D DE 06 sta $06de, x
E10F: A5 01    lda $01
E111: 69 00    adc #$00
E113: 28       plp
E114: 10 02    bpl $e118
E116: 69 FF    adc #$ff
E118: 85 0E    sta $0e
E11A: B1 12    lda ($12), y
E11C: 08       php
E11D: C8       iny
E11E: 18       clc
E11F: 65 02    adc $02
E121: 9D DB 06 sta $06db, x
E124: A5 03    lda $03
E126: 69 00    adc #$00
E128: 28       plp
E129: 10 02    bpl $e12d
E12B: 69 FF    adc #$ff
E12D: 85 0F    sta $0f
E12F: A5 0E    lda $0e
E131: 05 0F    ora $0f
E133: D0 35    bne $e16a
E135: 24 0A    bit $0a
E137: 10 0B    bpl $e144
E139: BD DB 06 lda $06db, x
E13C: C9 08    cmp #$08
E13E: 90 2A    bcc $e16a
E140: C9 F9    cmp #$f9
E142: B0 26    bcs $e16a
E144: BD DE 06 lda $06de, x
E147: 38       sec
E148: E9 08    sbc #$08
E14A: 9D DE 06 sta $06de, x
E14D: BD DB 06 lda $06db, x
E150: 38       sec
E151: E9 07    sbc #$07
E153: 24 0A    bit $0a
E155: 10 03    bpl $e15a
E157: 38       sec
E158: E9 08    sbc #$08
E15A: 9D DB 06 sta $06db, x
E15D: AD DA 06 lda $06da
E160: 18       clc
E161: 69 04    adc #$04
E163: 8D DA 06 sta $06da
E166: C9 FC    cmp #$fc
E168: B0 14    bcs $e17e
E16A: 84 09    sty $09
E16C: A5 06    lda $06
E16E: 29 20    and #$20
E170: F0 02    beq $e174
E172: A4 0D    ldy $0d
E174: C6 0C    dec $0c
E176: F0 03    beq $e17b
E178: 4C AA E0 jmp $e0aa
E17B: 4C 5C E0 jmp $e05c
E17E: A9 00    lda #$00
E180: 20 DF D8 jsr $d8df
E183: 60       rts

E1B5: A9 01    lda #$01
E1B7: 20 DF D8 jsr $d8df
E1BA: A5 4C    lda $4c
E1BC: AA       tax
E1BD: 0A       asl a
E1BE: A8       tay
E1BF: 85 0B    sta $0b
E1C1: E0 0D    cpx #$0d
E1C3: 90 07    bcc $e1cc
E1C5: 98       tya
E1C6: 18       clc
E1C7: 65 01    adc $01
E1C9: A8       tay
E1CA: 85 0B    sta $0b
E1CC: B9 7E E4 lda $e47e, y
E1CF: 85 14    sta $14
E1D1: B9 7F E4 lda $e47f, y
E1D4: 85 15    sta $15
E1D6: BD 3A 02 lda $023a, x
E1D9: 29 20    and #$20
E1DB: D0 08    bne $e1e5
E1DD: A0 00    ldy #$00
E1DF: B1 14    lda ($14), y
E1E1: 09 80    ora #$80
E1E3: 91 14    sta ($14), y
E1E5: B5 8F    lda $8f, x
E1E7: A0 01    ldy #$01
E1E9: 91 14    sta ($14), y
E1EB: B5 9D    lda $9d, x
E1ED: 29 0F    and #$0f
E1EF: C8       iny
E1F0: 91 14    sta ($14), y
E1F2: B5 B9    lda $b9, x
E1F4: 18       clc
E1F5: 75 E3    adc $e3, x
E1F7: C8       iny
E1F8: 91 14    sta ($14), y
E1FA: B5 C7    lda $c7, x
E1FC: 75 F1    adc $f1, x
E1FE: A0 02    ldy #$02
E200: 0A       asl a
E201: 0A       asl a
E202: 0A       asl a
E203: 0A       asl a
E204: 11 14    ora ($14), y
E206: 91 14    sta ($14), y
E208: B5 B9    lda $b9, x
E20A: A0 04    ldy #$04
E20C: 91 14    sta ($14), y
E20E: B5 C7    lda $c7, x
E210: 10 04    bpl $e216
E212: A9 00    lda #$00
E214: 91 14    sta ($14), y
E216: F0 04    beq $e21c
E218: A9 FF    lda #$ff
E21A: 91 14    sta ($14), y
E21C: 20 3D E4 jsr $e43d
E21F: BD 3A 02 lda $023a, x
E222: 29 01    and #$01
E224: D0 0A    bne $e230
E226: BD 3A 02 lda $023a, x
E229: 29 02    and #$02
E22B: F0 0B    beq $e238
E22D: 4C 6D E3 jmp $e36d
E230: BD 3A 02 lda $023a, x
E233: 09 02    ora #$02
E235: 9D 3A 02 sta $023a, x
E238: B5 65    lda $65, x
E23A: 0A       asl a
E23B: A8       tay
E23C: B9 00 40 lda $4000, y
E23F: 85 00    sta $00
E241: B9 01 40 lda $4001, y
E244: 85 01    sta $01
E246: B5 73    lda $73, x
E248: 0A       asl a
E249: A8       tay
E24A: B1 00    lda ($00), y
E24C: 85 10    sta $10
E24E: C8       iny
E24F: B1 00    lda ($00), y
E251: 85 11    sta $11
E253: B5 73    lda $73, x
E255: 4A       lsr a
E256: 29 40    and #$40
E258: 49 40    eor #$40
E25A: 85 04    sta $04
E25C: B4 65    ldy $65, x
E25E: B9 84 E1 lda $e184, y
E261: 85 05    sta $05
E263: A9 00    lda #$00
E265: 85 1B    sta $1b
E267: A5 14    lda $14
E269: 18       clc
E26A: 69 06    adc #$06
E26C: 85 14    sta $14
E26E: A5 15    lda $15
E270: 69 00    adc #$00
E272: 85 15    sta $15
E274: A0 00    ldy #$00
E276: B1 10    lda ($10), y
E278: 85 0C    sta $0c
E27A: D0 03    bne $e27f
E27C: 4C 57 E3 jmp $e357
E27F: C8       iny
E280: B1 10    lda ($10), y
E282: 85 06    sta $06
E284: C8       iny
E285: 24 06    bit $06
E287: 10 05    bpl $e28e
E289: B1 10    lda ($10), y
E28B: 85 07    sta $07
E28D: C8       iny
E28E: 50 05    bvc $e295
E290: B1 10    lda ($10), y
E292: 85 08    sta $08
E294: C8       iny
E295: A5 06    lda $06
E297: 29 08    and #$08
E299: F0 17    beq $e2b2
E29B: A6 4C    ldx $4c
E29D: BD 3A 02 lda $023a, x
E2A0: 30 0E    bmi $e2b0
E2A2: B1 10    lda ($10), y
E2A4: 48       pha
E2A5: C8       iny
E2A6: B1 10    lda ($10), y
E2A8: 85 11    sta $11
E2AA: 68       pla
E2AB: 85 10    sta $10
E2AD: 4C 74 E2 jmp $e274
E2B0: C8       iny
E2B1: C8       iny
E2B2: A5 06    lda $06
E2B4: 29 30    and #$30
E2B6: F0 0E    beq $e2c6
E2B8: B1 10    lda ($10), y
E2BA: 85 12    sta $12
E2BC: C8       iny
E2BD: B1 10    lda ($10), y
E2BF: 85 13    sta $13
E2C1: C8       iny
E2C2: A9 00    lda #$00
E2C4: 85 09    sta $09
E2C6: A5 07    lda $07
E2C8: 24 06    bit $06
E2CA: 30 03    bmi $e2cf
E2CC: B1 10    lda ($10), y
E2CE: C8       iny
E2CF: 05 05    ora $05
E2D1: 45 04    eor $04
E2D3: 49 40    eor #$40
E2D5: 85 01    sta $01
E2D7: 85 0A    sta $0a
E2D9: A5 06    lda $06
E2DB: 29 08    and #$08
E2DD: F0 08    beq $e2e7
E2DF: A5 01    lda $01
E2E1: 29 C7    and #$c7
E2E3: 09 30    ora #$30
E2E5: 85 01    sta $01
E2E7: 50 0D    bvc $e2f6
E2E9: A5 08    lda $08
E2EB: E6 08    inc $08
E2ED: 24 0A    bit $0a
E2EF: 10 08    bpl $e2f9
E2F1: E6 08    inc $08
E2F3: 4C F9 E2 jmp $e2f9
E2F6: B1 10    lda ($10), y
E2F8: C8       iny
E2F9: 85 02    sta $02
E2FB: 84 0D    sty $0d
E2FD: A5 06    lda $06
E2FF: 29 20    and #$20
E301: D0 0A    bne $e30d
E303: A5 10    lda $10
E305: 85 12    sta $12
E307: A5 11    lda $11
E309: 85 13    sta $13
E30B: 84 09    sty $09
E30D: A4 09    ldy $09
E30F: B1 12    lda ($12), y
E311: C8       iny
E312: 24 04    bit $04
E314: 50 05    bvc $e31b
E316: 49 FF    eor #$ff
E318: 18       clc
E319: 69 01    adc #$01
E31B: 85 03    sta $03
E31D: B1 12    lda ($12), y
E31F: C8       iny
E320: 85 00    sta $00
E322: 98       tya
E323: 48       pha
E324: A2 00    ldx #$00
E326: A0 00    ldy #$00
E328: B5 00    lda $00, x
E32A: 91 14    sta ($14), y
E32C: E8       inx
E32D: C8       iny
E32E: E0 04    cpx #$04
E330: 90 F6    bcc $e328
E332: A5 14    lda $14
E334: 18       clc
E335: 69 04    adc #$04
E337: 85 14    sta $14
E339: A5 15    lda $15
E33B: 69 00    adc #$00
E33D: 85 15    sta $15
E33F: E6 1B    inc $1b
E341: 68       pla
E342: A8       tay
E343: 84 09    sty $09
E345: A5 06    lda $06
E347: 29 20    and #$20
E349: F0 02    beq $e34d
E34B: A4 0D    ldy $0d
E34D: C6 0C    dec $0c
E34F: F0 03    beq $e354
E351: 4C C6 E2 jmp $e2c6
E354: 4C 76 E2 jmp $e276
E357: A6 0B    ldx $0b
E359: BD 7E E4 lda $e47e, x
E35C: 85 14    sta $14
E35E: BD 7F E4 lda $e47f, x
E361: 85 15    sta $15
E363: A2 00    ldx #$00
E365: A1 14    lda ($14, x)
E367: 29 80    and #$80
E369: 05 1B    ora $1b
E36B: 81 14    sta ($14, x)
E36D: A6 4C    ldx $4c
E36F: B5 65    lda $65, x
E371: C9 16    cmp #$16
E373: D0 0F    bne $e384
E375: BD 73 03 lda $0373, x
E378: 29 0F    and #$0f
E37A: C9 0F    cmp #$0f
E37C: F0 42    beq $e3c0
E37E: A9 01    lda #$01
E380: A8       tay
E381: 4C 96 E3 jmp $e396
E384: C9 16    cmp #$16
E386: B0 38    bcs $e3c0
E388: BD 0E 03 lda $030e, x
E38B: 10 33    bpl $e3c0
E38D: B5 73    lda $73, x
E38F: 29 7F    and #$7f
E391: A8       tay
E392: B9 A0 E4 lda $e4a0, y
E395: A8       tay
E396: B5 65    lda $65, x
E398: 48       pha
E399: B5 73    lda $73, x
E39B: 48       pha
E39C: B5 E3    lda $e3, x
E39E: 48       pha
E39F: B5 F1    lda $f1, x
E3A1: 48       pha
E3A2: A9 1B    lda #$1b
E3A4: 95 65    sta $65, x
E3A6: 98       tya
E3A7: 95 73    sta $73, x
E3A9: A9 00    lda #$00
E3AB: 95 E3    sta $e3, x
E3AD: 95 F1    sta $f1, x
E3AF: 20 F3 DF jsr $dff3
E3B2: A6 4C    ldx $4c
E3B4: 68       pla
E3B5: 95 F1    sta $f1, x
E3B7: 68       pla
E3B8: 95 E3    sta $e3, x
E3BA: 68       pla
E3BB: 95 73    sta $73, x
E3BD: 68       pla
E3BE: 95 65    sta $65, x
E3C0: A6 4C    ldx $4c
E3C2: B5 65    lda $65, x
E3C4: C9 16    cmp #$16
E3C6: B0 65    bcs $e42d
E3C8: BD 3A 02 lda $023a, x
E3CB: 29 40    and #$40
E3CD: F0 5E    beq $e42d
E3CF: A9 30    lda #$30
E3D1: 85 72    sta $72
E3D3: 20 B7 F7 jsr $f7b7
E3D6: 48       pha
E3D7: 8A       txa
E3D8: 4A       lsr a
E3D9: A8       tay
E3DA: 68       pla
E3DB: B6 47    ldx $47, y
E3DD: 30 02    bmi $e3e1
E3DF: A9 04    lda #$04
E3E1: 18       clc
E3E2: 69 8A    adc #$8a
E3E4: 85 80    sta $80
E3E6: A6 4C    ldx $4c
E3E8: B5 8F    lda $8f, x
E3EA: 85 9C    sta $9c
E3EC: B5 9D    lda $9d, x
E3EE: 85 AA    sta $aa
E3F0: B5 B9    lda $b9, x
E3F2: 38       sec
E3F3: 38       sec
E3F4: E9 01    sbc #$01
E3F6: 85 C6    sta $c6
E3F8: B5 C7    lda $c7, x
E3FA: E9 00    sbc #$00
E3FC: 85 D4    sta $d4
E3FE: B5 E3    lda $e3, x
E400: 18       clc
E401: 69 48    adc #$48
E403: 85 F0    sta $f0
E405: B5 F1    lda $f1, x
E407: 69 00    adc #$00
E409: 85 FE    sta $fe
E40B: A9 01    lda #$01
E40D: 8D 47 02 sta $0247
E410: AD F5 07 lda $07f5
E413: 29 08    and #$08
E415: 0A       asl a
E416: 0A       asl a
E417: 0D 47 02 ora $0247
E41A: 8D 47 02 sta $0247
E41D: A5 4C    lda $4c
E41F: 48       pha
E420: 0A       asl a
E421: 85 01    sta $01
E423: A9 0D    lda #$0d
E425: 85 4C    sta $4c
E427: 20 B5 E1 jsr $e1b5
E42A: 68       pla
E42B: 85 4C    sta $4c
E42D: A6 4C    ldx $4c
E42F: BD 3A 02 lda $023a, x
E432: 29 02    and #$02
E434: 9D 3A 02 sta $023a, x
E437: A9 00    lda #$00
E439: 20 DF D8 jsr $d8df
E43C: 60       rts
E43D: B5 C7    lda $c7, x
E43F: 30 36    bmi $e477
E441: D0 30    bne $e473
E443: B5 B9    lda $b9, x
E445: C9 80    cmp #$80
E447: B0 2A    bcs $e473
E449: C9 18    cmp #$18
E44B: 90 2A    bcc $e477
E44D: B5 9D    lda $9d, x
E44F: 30 26    bmi $e477
E451: C9 02    cmp #$02
E453: B0 1E    bcs $e473
E455: A9 80    lda #$80
E457: 38       sec
E458: F5 B9    sbc $b9, x
E45A: 4A       lsr a
E45B: 4A       lsr a
E45C: 4A       lsr a
E45D: 18       clc
E45E: 69 FC    adc #$fc
E460: 85 16    sta $16
E462: A9 00    lda #$00
E464: 69 00    adc #$00
E466: 85 17    sta $17
E468: B5 8F    lda $8f, x
E46A: 38       sec
E46B: E5 16    sbc $16
E46D: B5 9D    lda $9d, x
E46F: E5 17    sbc $17
E471: 90 04    bcc $e477
E473: A9 00    lda #$00
E475: F0 02    beq $e479
E477: A9 01    lda #$01
E479: A0 05    ldy #$05
E47B: 91 14    sta ($14), y
E47D: 60       rts

E4E8: A9 00    lda #$00
E4EA: 85 1B    sta $1b
E4EC: 85 1C    sta $1c
E4EE: 85 1D    sta $1d
E4F0: A5 1B    lda $1b
E4F2: C9 06    cmp #$06
E4F4: F0 2A    beq $e520
E4F6: 0A       asl a
E4F7: A8       tay
E4F8: B9 7E E4 lda $e47e, y
E4FB: 85 10    sta $10
E4FD: B9 7F E4 lda $e47f, y
E500: 85 11    sta $11
E502: A0 00    ldy #$00
E504: B1 10    lda ($10), y
E506: 10 18    bpl $e520
E508: A0 05    ldy #$05
E50A: B1 10    lda ($10), y
E50C: D0 1B    bne $e529
E50E: A5 1C    lda $1c
E510: 0A       asl a
E511: AA       tax
E512: A5 1B    lda $1b
E514: 9D 00 02 sta $0200, x
E517: A0 04    ldy #$04
E519: B1 10    lda ($10), y
E51B: 9D 01 02 sta $0201, x
E51E: E6 1C    inc $1c
E520: E6 1B    inc $1b
E522: A5 1B    lda $1b
E524: C9 11    cmp #$11
E526: 90 C8    bcc $e4f0
E528: 60       rts
E529: A5 1D    lda $1d
E52B: 0A       asl a
E52C: AA       tax
E52D: A5 1B    lda $1b
E52F: 9D 16 02 sta $0216, x
E532: A0 04    ldy #$04
E534: B1 10    lda ($10), y
E536: 9D 17 02 sta $0217, x
E539: E6 1D    inc $1d
E53B: 4C 20 E5 jmp $e520
E53E: A5 1C    lda $1c
E540: F0 0A    beq $e54c
E542: C9 02    cmp #$02
E544: 90 03    bcc $e549
E546: 20 6A E5 jsr $e56a
E549: 20 BB E5 jsr $e5bb
E54C: A9 06    lda #$06
E54E: 20 DB E5 jsr $e5db
E551: A5 1D    lda $1d
E553: F0 0A    beq $e55f
E555: C9 02    cmp #$02
E557: 90 03    bcc $e55c
E559: 20 60 E5 jsr $e560
E55C: 20 B1 E5 jsr $e5b1
E55F: 60       rts
E560: A9 16    lda #$16
E562: 85 1F    sta $1f
E564: A5 1D    lda $1d
E566: 85 20    sta $20
E568: D0 08    bne $e572
E56A: A9 00    lda #$00
E56C: 85 1F    sta $1f
E56E: A5 1C    lda $1c
E570: 85 20    sta $20
E572: A6 1F    ldx $1f
E574: A9 00    lda #$00
E576: 85 1B    sta $1b
E578: A9 01    lda #$01
E57A: 85 1E    sta $1e
E57C: BD 01 02 lda $0201, x
E57F: DD 03 02 cmp $0203, x
E582: B0 1E    bcs $e5a2
E584: BD 00 02 lda $0200, x
E587: 48       pha
E588: BD 01 02 lda $0201, x
E58B: 48       pha
E58C: BD 02 02 lda $0202, x
E58F: 9D 00 02 sta $0200, x
E592: BD 03 02 lda $0203, x
E595: 9D 01 02 sta $0201, x
E598: 68       pla
E599: 9D 03 02 sta $0203, x
E59C: 68       pla
E59D: 9D 02 02 sta $0202, x
E5A0: E6 1B    inc $1b
E5A2: E8       inx
E5A3: E8       inx
E5A4: E6 1E    inc $1e
E5A6: A5 1E    lda $1e
E5A8: C5 20    cmp $20
E5AA: 90 D0    bcc $e57c
E5AC: A5 1B    lda $1b
E5AE: D0 C2    bne $e572
E5B0: 60       rts
E5B1: A2 16    ldx #$16
E5B3: A5 1D    lda $1d
E5B5: 85 1E    sta $1e
E5B7: D0 0A    bne $e5c3
E5B9: F0 1F    beq $e5da
E5BB: A2 00    ldx #$00
E5BD: A5 1C    lda $1c
E5BF: 85 1E    sta $1e
E5C1: F0 17    beq $e5da
E5C3: A0 00    ldy #$00
E5C5: 8A       txa
E5C6: 48       pha
E5C7: 98       tya
E5C8: 48       pha
E5C9: BD 00 02 lda $0200, x
E5CC: 20 DB E5 jsr $e5db
E5CF: 68       pla
E5D0: A8       tay
E5D1: 68       pla
E5D2: AA       tax
E5D3: E8       inx
E5D4: E8       inx
E5D5: C8       iny
E5D6: C4 1E    cpy $1e
E5D8: 90 EB    bcc $e5c5
E5DA: 60       rts
E5DB: 48       pha
E5DC: A9 01    lda #$01
E5DE: 20 DF D8 jsr $d8df
E5E1: 68       pla
E5E2: AE DA 06 ldx $06da
E5E5: E0 FC    cpx #$fc
E5E7: 90 03    bcc $e5ec
E5E9: 4C C6 E6 jmp $e6c6
E5EC: 0A       asl a
E5ED: A8       tay
E5EE: B9 7E E4 lda $e47e, y
E5F1: 85 10    sta $10
E5F3: B9 7F E4 lda $e47f, y
E5F6: 85 11    sta $11
E5F8: A0 00    ldy #$00
E5FA: B1 10    lda ($10), y
E5FC: 29 7F    and #$7f
E5FE: 91 10    sta ($10), y
E600: 85 00    sta $00
E602: C8       iny
E603: B1 10    lda ($10), y
E605: 85 12    sta $12
E607: C8       iny
E608: B1 10    lda ($10), y
E60A: 48       pha
E60B: 29 0F    and #$0f
E60D: C9 08    cmp #$08
E60F: 90 02    bcc $e613
E611: 09 F0    ora #$f0
E613: 85 13    sta $13
E615: 68       pla
E616: 4A       lsr a
E617: 4A       lsr a
E618: 4A       lsr a
E619: 4A       lsr a
E61A: C9 08    cmp #$08
E61C: 90 02    bcc $e620
E61E: 09 F0    ora #$f0
E620: 85 15    sta $15
E622: C8       iny
E623: B1 10    lda ($10), y
E625: 85 14    sta $14
E627: C8       iny
E628: A5 12    lda $12
E62A: 38       sec
E62B: ED DE 07 sbc $07de
E62E: 85 12    sta $12
E630: A5 13    lda $13
E632: ED DF 07 sbc $07df
E635: 85 13    sta $13
E637: A5 14    lda $14
E639: 38       sec
E63A: ED E0 07 sbc $07e0
E63D: 85 14    sta $14
E63F: A5 15    lda $15
E641: ED E1 07 sbc $07e1
E644: 85 15    sta $15
E646: C8       iny
E647: C8       iny
E648: B1 10    lda ($10), y
E64A: 18       clc
E64B: 08       php
E64C: C8       iny
E64D: 65 14    adc $14
E64F: 9D DB 06 sta $06db, x
E652: A5 15    lda $15
E654: 69 00    adc #$00
E656: 28       plp
E657: 10 02    bpl $e65b
E659: 69 FF    adc #$ff
E65B: 85 01    sta $01
E65D: B1 10    lda ($10), y
E65F: C8       iny
E660: 9D DC 06 sta $06dc, x
E663: B1 10    lda ($10), y
E665: C8       iny
E666: 9D DD 06 sta $06dd, x
E669: B1 10    lda ($10), y
E66B: 18       clc
E66C: 08       php
E66D: C8       iny
E66E: 65 12    adc $12
E670: 9D DE 06 sta $06de, x
E673: A5 13    lda $13
E675: 69 00    adc #$00
E677: 28       plp
E678: 10 02    bpl $e67c
E67A: 69 FF    adc #$ff
E67C: 85 02    sta $02
E67E: A5 01    lda $01
E680: 05 02    ora $02
E682: D0 3B    bne $e6bf
E684: 24 03    bit $03
E686: 10 0B    bpl $e693
E688: BD DB 06 lda $06db, x
E68B: C9 08    cmp #$08
E68D: 90 30    bcc $e6bf
E68F: C9 F9    cmp #$f9
E691: B0 2C    bcs $e6bf
E693: BD DE 06 lda $06de, x
E696: 38       sec
E697: E9 08    sbc #$08
E699: 9D DE 06 sta $06de, x
E69C: BD DC 06 lda $06dc, x
E69F: 85 03    sta $03
E6A1: BD DB 06 lda $06db, x
E6A4: 38       sec
E6A5: E9 07    sbc #$07
E6A7: 24 03    bit $03
E6A9: 10 03    bpl $e6ae
E6AB: 38       sec
E6AC: E9 08    sbc #$08
E6AE: 9D DB 06 sta $06db, x
E6B1: AD DA 06 lda $06da
E6B4: 18       clc
E6B5: 69 04    adc #$04
E6B7: 8D DA 06 sta $06da
E6BA: AA       tax
E6BB: C9 FC    cmp #$fc
E6BD: B0 07    bcs $e6c6
E6BF: C6 00    dec $00
E6C1: F0 03    beq $e6c6
E6C3: 4C 48 E6 jmp $e648
E6C6: A9 00    lda #$00
E6C8: 20 DF D8 jsr $d8df
E6CB: 60       rts
E6CC: 20 E8 E4 jsr $e4e8
E6CF: 20 3E E5 jsr $e53e
E6D2: 60       rts
E6D3: 8A       txa
E6D4: 48       pha
E6D5: 98       tya
E6D6: 48       pha
E6D7: 20 1C E7 jsr $e71c
E6DA: 20 84 E7 jsr $e784
E6DD: 68       pla
E6DE: A8       tay
E6DF: 68       pla
E6E0: AA       tax
E6E1: 60       rts
E6E2: 8A       txa
E6E3: 48       pha
E6E4: 98       tya
E6E5: 48       pha
E6E6: 20 F1 E6 jsr $e6f1
E6E9: 20 6F E7 jsr $e76f
E6EC: 68       pla
E6ED: A8       tay
E6EE: 68       pla
E6EF: AA       tax
E6F0: 60       rts
E6F1: A5 46    lda $46
E6F3: 29 0A    and #$0a
E6F5: D0 6D    bne $e764
E6F7: E6 49    inc $49
E6F9: A5 49    lda $49
E6FB: C9 1F    cmp #$1f
E6FD: 90 65    bcc $e764
E6FF: A9 00    lda #$00
E701: 85 49    sta $49
E703: F8       sed
E704: 38       sec
E705: A5 4A    lda $4a
E707: E9 01    sbc #$01
E709: 85 4A    sta $4a
E70B: D8       cld
E70C: 10 0E    bpl $e71c
E70E: A9 59    lda #$59
E710: 85 4A    sta $4a
E712: C6 4B    dec $4b
E714: 10 06    bpl $e71c
E716: A9 00    lda #$00
E718: 85 4A    sta $4a
E71A: 85 4B    sta $4b
E71C: A5 37    lda $37
E71E: F0 0F    beq $e72f
E720: A5 4B    lda $4b
E722: D0 0B    bne $e72f
E724: A5 4A    lda $4a
E726: C9 29    cmp #$29
E728: D0 05    bne $e72f
E72A: A9 03    lda #$03
E72C: 20 B8 D7 jsr $d7b8
E72F: A9 00    lda #$00
E731: 8D C0 3C sta $3cc0
E734: 8D C1 3C sta $3cc1
E737: 8D C2 3C sta $3cc2
E73A: 8D C3 3C sta $3cc3
E73D: A4 4B    ldy $4b
E73F: B9 65 E7 lda $e765, y
E742: 8D C0 2C sta $2cc0
E745: A9 C4    lda #$c4
E747: 8D C1 2C sta $2cc1
E74A: A5 4A    lda $4a
E74C: 29 F0    and #$f0
E74E: 4A       lsr a
E74F: 4A       lsr a
E750: 4A       lsr a
E751: 4A       lsr a
E752: A8       tay
E753: B9 65 E7 lda $e765, y
E756: 8D C2 2C sta $2cc2
E759: A5 4A    lda $4a
E75B: 29 0F    and #$0f
E75D: A8       tay
E75E: B9 65 E7 lda $e765, y
E761: 8D C3 2C sta $2cc3
E764: 60       rts

E76F: A5 57    lda $57
E771: C5 59    cmp $59
E773: D0 07    bne $e77c
E775: A5 58    lda $58
E777: C5 5A    cmp $5a
E779: D0 01    bne $e77c
E77B: 60       rts
E77C: A5 57    lda $57
E77E: 85 59    sta $59
E780: A5 58    lda $58
E782: 85 5A    sta $5a
E784: A9 00    lda #$00
E786: 8D 9D 38 sta $389d
E789: 8D 9E 38 sta $389e
E78C: 8D BD 38 sta $38bd
E78F: 8D BE 38 sta $38be
E792: 8D 81 3C sta $3c81
E795: 8D 82 3C sta $3c82
E798: 8D A1 3C sta $3ca1
E79B: 8D A2 3C sta $3ca2
E79E: A5 57    lda $57
E7A0: 29 F0    and #$f0
E7A2: 4A       lsr a
E7A3: 4A       lsr a
E7A4: 4A       lsr a
E7A5: A8       tay
E7A6: D0 02    bne $e7aa
E7A8: A0 14    ldy #$14
E7AA: B9 92 E8 lda $e892, y
E7AD: 8D 9D 28 sta $289d
E7B0: B9 93 E8 lda $e893, y
E7B3: 8D BD 28 sta $28bd
E7B6: A5 57    lda $57
E7B8: 29 0F    and #$0f
E7BA: 0A       asl a
E7BB: A8       tay
E7BC: B9 92 E8 lda $e892, y
E7BF: 8D 9E 28 sta $289e
E7C2: B9 93 E8 lda $e893, y
E7C5: 8D BE 28 sta $28be
E7C8: A5 58    lda $58
E7CA: 29 F0    and #$f0
E7CC: 4A       lsr a
E7CD: 4A       lsr a
E7CE: 4A       lsr a
E7CF: A8       tay
E7D0: D0 02    bne $e7d4
E7D2: A0 14    ldy #$14
E7D4: B9 92 E8 lda $e892, y
E7D7: 8D 81 2C sta $2c81
E7DA: B9 93 E8 lda $e893, y
E7DD: 8D A1 2C sta $2ca1
E7E0: A5 58    lda $58
E7E2: 29 0F    and #$0f
E7E4: 0A       asl a
E7E5: A8       tay
E7E6: B9 92 E8 lda $e892, y
E7E9: 8D 82 2C sta $2c82
E7EC: B9 93 E8 lda $e893, y
E7EF: 8D A2 2C sta $2ca2
E7F2: A9 00    lda #$00
E7F4: 8D 9C 38 sta $389c
E7F7: 8D BC 38 sta $38bc
E7FA: 8D 83 3C sta $3c83
E7FD: 8D A3 3C sta $3ca3
E800: A9 C6    lda #$c6
E802: 8D 9C 28 sta $289c
E805: 8D BC 28 sta $28bc
E808: 8D 83 2C sta $2c83
E80B: 8D A3 2C sta $2ca3
E80E: A9 00    lda #$00
E810: 8D 7C 38 sta $387c
E813: 8D 7D 38 sta $387d
E816: 8D 7E 38 sta $387e
E819: 8D 7F 38 sta $387f
E81C: 8D 60 3C sta $3c60
E81F: 8D 61 3C sta $3c61
E822: 8D 62 3C sta $3c62
E825: 8D 63 3C sta $3c63
E828: A9 C6    lda #$c6
E82A: 8D 7C 28 sta $287c
E82D: 8D 7F 28 sta $287f
E830: 8D 60 2C sta $2c60
E833: 8D 63 2C sta $2c63
E836: A5 37    lda $37
E838: C9 02    cmp #$02
E83A: F0 2D    beq $e869
E83C: A5 47    lda $47
E83E: 10 07    bpl $e847
E840: A9 1F    lda #$1f
E842: 85 5B    sta $5b
E844: 4C 51 E8 jmp $e851
E847: A5 38    lda $38
E849: 29 0F    and #$0f
E84B: A8       tay
E84C: B9 AE E8 lda $e8ae, y
E84F: 85 5B    sta $5b
E851: A5 48    lda $48
E853: 10 07    bpl $e85c
E855: A9 29    lda #$29
E857: 85 5C    sta $5c
E859: 4C 71 E8 jmp $e871
E85C: A5 38    lda $38
E85E: 29 0F    and #$0f
E860: A8       tay
E861: B9 AE E8 lda $e8ae, y
E864: 85 5C    sta $5c
E866: 4C 71 E8 jmp $e871
E869: A9 35    lda #$35
E86B: 85 5B    sta $5b
E86D: A9 35    lda #$35
E86F: 85 5C    sta $5c
E871: A5 5B    lda $5b
E873: 0A       asl a
E874: A8       tay
E875: B9 B7 E8 lda $e8b7, y
E878: 8D 7D 28 sta $287d
E87B: B9 B8 E8 lda $e8b8, y
E87E: 8D 7E 28 sta $287e
E881: A5 5C    lda $5c
E883: 0A       asl a
E884: A8       tay
E885: B9 B7 E8 lda $e8b7, y
E888: 8D 61 2C sta $2c61
E88B: B9 B8 E8 lda $e8b8, y
E88E: 8D 62 2C sta $2c62
E891: 60       rts

E923: AD DB 07 lda $07db
E926: D0 01    bne $e929
E928: 60       rts
E929: A5 46    lda $46
E92B: 29 0B    and #$0b
E92D: F0 0D    beq $e93c
E92F: A9 80    lda #$80
E931: 8D DE 07 sta $07de
E934: A9 00    lda #$00
E936: 8D DF 07 sta $07df
E939: 4C 23 EA jmp $ea23
E93C: A5 4F    lda $4f
E93E: 30 12    bmi $e952
E940: 29 02    and #$02
E942: A8       tay
E943: B9 5D EA lda $ea5d, y
E946: 8D DE 07 sta $07de
E949: B9 5E EA lda $ea5e, y
E94C: 8D DF 07 sta $07df
E94F: 4C 23 EA jmp $ea23
E952: AD E0 03 lda $03e0
E955: C9 0D    cmp #$0d
E957: 90 03    bcc $e95c
E959: 4C DD E9 jmp $e9dd
E95C: C9 0A    cmp #$0a
E95E: B0 16    bcs $e976
E960: C9 05    cmp #$05
E962: B0 29    bcs $e98d
E964: C9 00    cmp #$00
E966: D0 0E    bne $e976
E968: A5 56    lda $56
E96A: 29 20    and #$20
E96C: F0 08    beq $e976
E96E: AD E9 03 lda $03e9
E971: 49 10    eor #$10
E973: 4C 78 E9 jmp $e978
E976: A5 56    lda $56
E978: 29 10    and #$10
E97A: 4A       lsr a
E97B: 4A       lsr a
E97C: 4A       lsr a
E97D: A8       tay
E97E: B9 61 EA lda $ea61, y
E981: 8D E2 07 sta $07e2
E984: B9 62 EA lda $ea62, y
E987: 8D E3 07 sta $07e3
E98A: 4C DD E9 jmp $e9dd
E98D: A5 56    lda $56
E98F: 29 20    and #$20
E991: F0 1E    beq $e9b1
E993: AD E1 03 lda $03e1
E996: C9 0B    cmp #$0b
E998: F0 17    beq $e9b1
E99A: AD 11 04 lda $0411
E99D: 30 12    bmi $e9b1
E99F: 29 02    and #$02
E9A1: A8       tay
E9A2: B9 5D EA lda $ea5d, y
E9A5: 8D E2 07 sta $07e2
E9A8: B9 5E EA lda $ea5e, y
E9AB: 8D E3 07 sta $07e3
E9AE: 4C DD E9 jmp $e9dd
E9B1: A5 56    lda $56
E9B3: 29 10    and #$10
E9B5: 4A       lsr a
E9B6: 4A       lsr a
E9B7: 4A       lsr a
E9B8: 4A       lsr a
E9B9: A8       tay
E9BA: B9 5F 00 lda $005f, y
E9BD: 49 01    eor #$01
E9BF: AA       tax
E9C0: B9 69 EA lda $ea69, y
E9C3: 18       clc
E9C4: 08       php
E9C5: 75 8F    adc $8f, x
E9C7: 8D E2 07 sta $07e2
E9CA: B5 9D    lda $9d, x
E9CC: 69 00    adc #$00
E9CE: 28       plp
E9CF: 10 02    bpl $e9d3
E9D1: 69 FF    adc #$ff
E9D3: 8D E3 07 sta $07e3
E9D6: C0 00    cpy #$00
E9D8: F0 03    beq $e9dd
E9DA: CE E3 07 dec $07e3
E9DD: A0 00    ldy #$00
E9DF: AD DE 07 lda $07de
E9E2: 38       sec
E9E3: ED E2 07 sbc $07e2
E9E6: 85 10    sta $10
E9E8: AD DF 07 lda $07df
E9EB: ED E3 07 sbc $07e3
E9EE: 85 11    sta $11
E9F0: 10 05    bpl $e9f7
E9F2: A0 02    ldy #$02
E9F4: 20 98 CF jsr $cf98
E9F7: A5 11    lda $11
E9F9: D0 15    bne $ea10
E9FB: A5 10    lda $10
E9FD: C9 09    cmp #$09
E9FF: B0 0F    bcs $ea10
EA01: AD E2 07 lda $07e2
EA04: 8D DE 07 sta $07de
EA07: AD E3 07 lda $07e3
EA0A: 8D DF 07 sta $07df
EA0D: 4C 23 EA jmp $ea23
EA10: B9 65 EA lda $ea65, y
EA13: 18       clc
EA14: 6D DE 07 adc $07de
EA17: 8D DE 07 sta $07de
EA1A: B9 66 EA lda $ea66, y
EA1D: 6D DF 07 adc $07df
EA20: 8D DF 07 sta $07df
EA23: A0 00    ldy #$00
EA25: AD E0 03 lda $03e0
EA28: C9 08    cmp #$08
EA2A: D0 2D    bne $ea59
EA2C: A5 46    lda $46
EA2E: 29 02    and #$02
EA30: D0 27    bne $ea59
EA32: A5 E7    lda $e7
EA34: 18       clc
EA35: 65 BD    adc $bd
EA37: 85 00    sta $00
EA39: A5 F5    lda $f5
EA3B: 65 CB    adc $cb
EA3D: 85 01    sta $01
EA3F: A5 00    lda $00
EA41: 18       clc
EA42: 69 20    adc #$20
EA44: AA       tax
EA45: A5 01    lda $01
EA47: 69 00    adc #$00
EA49: 30 0E    bmi $ea59
EA4B: F0 0C    beq $ea59
EA4D: C9 02    cmp #$02
EA4F: B0 04    bcs $ea55
EA51: E0 21    cpx #$21
EA53: 90 02    bcc $ea57
EA55: A2 20    ldx #$20
EA57: 8A       txa
EA58: A8       tay
EA59: 8C E0 07 sty $07e0
EA5C: 60       rts

EA6B: AD DB 07 lda $07db
EA6E: 30 07    bmi $ea77
EA70: C9 01    cmp #$01
EA72: F0 04    beq $ea78
EA74: 20 E2 EA jsr $eae2
EA77: 60       rts
EA78: 20 06 EB jsr $eb06
EA7B: 60       rts
EA7C: 98       tya
EA7D: 48       pha
EA7E: AD DB 07 lda $07db
EA81: C9 02    cmp #$02
EA83: D0 32    bne $eab7
EA85: AD 2C 02 lda $022c
EA88: 29 01    and #$01
EA8A: A8       tay
EA8B: A5 31    lda $31
EA8D: D9 DE EA cmp $eade, y
EA90: D0 28    bne $eaba
EA92: 20 76 D8 jsr $d876
EA95: AD DE 07 lda $07de
EA98: 38       sec
EA99: E9 04    sbc #$04
EA9B: 8D 0C 10 sta scrollx_lo_100c
EA9E: AD DF 07 lda $07df
EAA1: E9 00    sbc #$00
EAA3: 29 01    and #$01
EAA5: 0A       asl a
EAA6: 8D F8 07 sta $07f8
EAA9: AD 2C 02 lda $022c
EAAC: 29 FD    and #$fd
EAAE: 0D F8 07 ora $07f8
EAB1: 8D 2C 02 sta $022c
EAB4: 8D 08 10 sta scrollx_hi_1008
EAB7: 68       pla
EAB8: A8       tay
EAB9: 60       rts
EABA: D9 E0 EA cmp $eae0, y
EABD: D0 F8    bne $eab7
EABF: 20 76 D8 jsr $d876
EAC2: A0 28    ldy #$28
EAC4: EA       nop
EAC5: 88       dey
EAC6: 10 FC    bpl $eac4
EAC8: AD 2C 02 lda $022c
EACB: A9 FC    lda #$fc
EACD: 8D 0C 10 sta scrollx_lo_100c
EAD0: AD 2C 02 lda $022c
EAD3: 09 02    ora #$02
EAD5: 8D 2C 02 sta $022c
EAD8: 8D 08 10 sta scrollx_hi_1008
EADB: 4C B7 EA jmp $eab7

EAE2: AD 2C 02 lda $022c		; [disable] useless lda
EAE5: A9 FC    lda #$fc
EAE7: 8D 0C 10 sta scrollx_lo_100c
EAEA: AD 2C 02 lda $022c
EAED: 09 02    ora #$02
EAEF: 8D 2C 02 sta $022c
EAF2: 8D 08 10 sta scrollx_hi_1008
EAF5: A9 00    lda #$00
EAF7: 8D 0E 10 sta scrolly_lo_100e
EAFA: AD 2D 02 lda bankswitch_copy_022d
EAFD: 09 40    ora #$40
EAFF: 8D 09 10 sta bankswitch_1009
EB02: 8D 2D 02 sta bankswitch_copy_022d
EB05: 60       rts
EB06: AD DE 07 lda $07de
EB09: 38       sec
EB0A: E9 04    sbc #$04
EB0C: 8D 0C 10 sta scrollx_lo_100c
EB0F: AD DF 07 lda $07df
EB12: E9 00    sbc #$00
EB14: 29 01    and #$01
EB16: 0A       asl a
EB17: 8D F8 07 sta $07f8
EB1A: AD 2C 02 lda $022c
EB1D: 29 FD    and #$fd
EB1F: 0D F8 07 ora $07f8
EB22: 8D 2C 02 sta $022c
EB25: 8D 08 10 sta scrollx_hi_1008
EB28: AD E0 07 lda $07e0
EB2B: F0 14    beq $eb41
EB2D: AD 2D 02 lda bankswitch_copy_022d
EB30: 29 BF    and #$bf
EB32: 8D 2D 02 sta bankswitch_copy_022d
EB35: 8D 09 10 sta bankswitch_1009
EB38: AD E0 07 lda $07e0
EB3B: 49 FF    eor #$ff
EB3D: 8D 0E 10 sta scrolly_lo_100e
EB40: 60       rts
EB41: AD 2D 02 lda bankswitch_copy_022d
EB44: 09 40    ora #$40
EB46: 8D 2D 02 sta bankswitch_copy_022d
EB49: 8D 09 10 sta bankswitch_1009
EB4C: A9 00    lda #$00
EB4E: 8D 0E 10 sta scrolly_lo_100e
EB51: 60       rts
EB52: 20 5E EB jsr $eb5e
EB55: 20 9D EC jsr $ec9d
EB58: A9 00    lda #$00
EB5A: 8D DB 07 sta $07db
EB5D: 60       rts
EB5E: 20 8F D8 jsr $d88f
EB61: AD DB 07 lda $07db
EB64: 8D DC 07 sta $07dc
EB67: A9 FF    lda #$ff
EB69: 8D DB 07 sta $07db
EB6C: AD 2D 02 lda bankswitch_copy_022d
EB6F: 29 BF    and #$bf
EB71: 8D 09 10 sta bankswitch_1009
EB74: 8D 2D 02 sta bankswitch_copy_022d
EB77: 20 35 CF jsr $cf35
EB7A: AC E4 07 ldy $07e4
EB7D: AD 2C 02 lda $022c
EB80: 29 E3    and #$e3
EB82: 19 CB EB ora $ebcb, y
EB85: 8D 2C 02 sta $022c
EB88: 8D 08 10 sta scrollx_hi_1008
EB8B: AD 2D 02 lda bankswitch_copy_022d
EB8E: 29 DF    and #$df
EB90: 19 DE EB ora $ebde, y
EB93: 8D 2D 02 sta bankswitch_copy_022d
EB96: 8D 09 10 sta bankswitch_1009
EB99: 60       rts
EB9A: AC DC 07 ldy $07dc
EB9D: 8C DB 07 sty $07db
EBA0: B9 C5 EB lda $ebc5, y
EBA3: 8D 0C 10 sta scrollx_lo_100c
EBA6: AD 2C 02 lda $022c
EBA9: 29 FD    and #$fd
EBAB: 19 C8 EB ora $ebc8, y
EBAE: 8D 2C 02 sta $022c
EBB1: 8D 08 10 sta scrollx_hi_1008
EBB4: A9 00    lda #$00
EBB6: 8D 0E 10 sta scrolly_lo_100e
EBB9: AD 2D 02 lda bankswitch_copy_022d
EBBC: 09 40    ora #$40
EBBE: 8D 09 10 sta bankswitch_1009
EBC1: 8D 2D 02 sta bankswitch_copy_022d
EBC4: 60       rts


EBF1: A9 0A    lda #$0a
EBF3: 8D E4 07 sta $07e4
EBF6: 20 5E EB jsr $eb5e
EBF9: 20 9D EC jsr $ec9d
EBFC: 20 2F EC jsr $ec2f
EBFF: 48       pha
EC00: C9 00    cmp #$00
EC02: F0 03    beq $ec07
EC04: 20 DC ED jsr $eddc
EC07: 68       pla
EC08: 18       clc
EC09: 69 14    adc #$14
EC0B: 20 80 EE jsr $ee80
EC0E: 20 2F EC jsr $ec2f
EC11: 0A       asl a
EC12: A8       tay
EC13: B9 25 EC lda $ec25, y
EC16: 8D DE 07 sta $07de
EC19: B9 26 EC lda $ec26, y
EC1C: 8D DF 07 sta $07df
EC1F: A9 02    lda #$02
EC21: 8D DB 07 sta $07db
EC24: 60       rts

EC2F: A5 38    lda $38
EC31: 29 0F    and #$0f
EC33: A8       tay
EC34: B9 39 EC lda $ec39, y
EC37: A8       tay
EC38: 60       rts

EC42: AD E5 07 lda $07e5
EC45: CD E6 07 cmp $07e6
EC48: 8D E6 07 sta $07e6
EC4B: D0 05    bne $ec52
EC4D: C9 02    cmp #$02
EC4F: F0 30    beq $ec81
EC51: 60       rts
EC52: C9 00    cmp #$00
EC54: D0 0A    bne $ec60
EC56: 20 2F EC jsr $ec2f
EC59: 18       clc
EC5A: 69 20    adc #$20
EC5C: 20 80 EE jsr $ee80
EC5F: 60       rts
EC60: C9 01    cmp #$01
EC62: D0 1D    bne $ec81
EC64: A5 38    lda $38
EC66: 29 0F    and #$0f
EC68: 18       clc
EC69: 69 05    adc #$05
EC6B: 20 80 EE jsr $ee80
EC6E: EE E7 07 inc $07e7
EC71: AD E7 07 lda $07e7
EC74: C5 80    cmp $80
EC76: 90 08    bcc $ec80
EC78: A9 00    lda #$00
EC7A: 8D E5 07 sta $07e5
EC7D: 8D E7 07 sta $07e7
EC80: 60       rts
EC81: A9 05    lda #$05
EC83: 85 00    sta $00
EC85: AD E7 07 lda $07e7
EC88: 29 04    and #$04
EC8A: F0 02    beq $ec8e
EC8C: 06 00    asl $00
EC8E: 20 2F EC jsr $ec2f
EC91: 29 0F    and #$0f
EC93: 18       clc
EC94: 65 00    adc $00
EC96: 20 80 EE jsr $ee80
EC99: EE E7 07 inc $07e7
EC9C: 60       rts
EC9D: A9 01    lda #$01
EC9F: 20 DF D8 jsr $d8df
ECA2: AD 00 60 lda $6000
ECA5: 85 1D    sta $1d
ECA7: AD 01 60 lda $6001
ECAA: 85 1E    sta $1e
ECAC: A9 00    lda #$00
ECAE: 85 03    sta $03
ECB0: AD E4 07 lda $07e4
ECB3: 0A       asl a
ECB4: A8       tay
ECB5: B1 1D    lda ($1d), y
ECB7: 85 10    sta $10
ECB9: C8       iny
ECBA: B1 1D    lda ($1d), y
ECBC: 85 11    sta $11
ECBE: A0 00    ldy #$00
ECC0: B1 10    lda ($10), y
ECC2: C8       iny
ECC3: 85 01    sta $01
ECC5: C9 00    cmp #$00
ECC7: D0 06    bne $eccf
ECC9: 20 B5 ED jsr $edb5
ECCC: 4C C0 EC jmp $ecc0
ECCF: C9 FF    cmp #$ff
ECD1: D0 03    bne $ecd6
ECD3: 4C AF ED jmp $edaf
ECD6: C9 FE    cmp #$fe
ECD8: D0 0E    bne $ece8
ECDA: B1 10    lda ($10), y
ECDC: 48       pha
ECDD: C8       iny
ECDE: B1 10    lda ($10), y
ECE0: 85 11    sta $11
ECE2: 68       pla
ECE3: 85 10    sta $10
ECE5: 4C BE EC jmp $ecbe
ECE8: B1 10    lda ($10), y
ECEA: 85 12    sta $12
ECEC: C8       iny
ECED: B1 10    lda ($10), y
ECEF: 85 13    sta $13
ECF1: C8       iny
ECF2: B1 10    lda ($10), y
ECF4: 85 1C    sta $1c
ECF6: C8       iny
ECF7: B1 10    lda ($10), y
ECF9: C8       iny
ECFA: 85 1D    sta $1d
ECFC: 05 1C    ora $1c
ECFE: D0 06    bne $ed06
ED00: 20 B5 ED jsr $edb5
ED03: 4C F2 EC jmp $ecf2
ED06: A5 1C    lda $1c
ED08: 85 14    sta $14
ED0A: A5 1D    lda $1d
ED0C: 85 15    sta $15
ED0E: A5 14    lda $14
ED10: 85 16    sta $16
ED12: A5 15    lda $15
ED14: 18       clc
ED15: 69 10    adc #$10
ED17: 85 17    sta $17
ED19: B1 10    lda ($10), y
ED1B: C8       iny
ED1C: 85 02    sta $02
ED1E: 29 7F    and #$7f
ED20: AA       tax
ED21: 84 00    sty $00
ED23: E0 00    cpx #$00
ED25: D0 06    bne $ed2d
ED27: 20 B5 ED jsr $edb5
ED2A: 4C 19 ED jmp $ed19
ED2D: A0 00    ldy #$00
ED2F: A5 12    lda $12
ED31: 91 14    sta ($14), y
ED33: A5 13    lda $13
ED35: 91 16    sta ($16), y
ED37: C8       iny
ED38: 24 02    bit $02
ED3A: 30 06    bmi $ed42
ED3C: E6 12    inc $12
ED3E: D0 02    bne $ed42
ED40: E6 13    inc $13
ED42: CA       dex
ED43: D0 EA    bne $ed2f
ED45: A9 20    lda #$20
ED47: 85 1B    sta $1b
ED49: A4 00    ldy $00
ED4B: B1 10    lda ($10), y
ED4D: C8       iny
ED4E: AA       tax
ED4F: C9 80    cmp #$80
ED51: D0 0F    bne $ed62
ED53: A5 14    lda $14
ED55: 29 E0    and #$e0
ED57: 85 14    sta $14
ED59: A5 15    lda $15
ED5B: 49 04    eor #$04
ED5D: 85 15    sta $15
ED5F: 4C 0E ED jmp $ed0e
ED62: 29 F0    and #$f0
ED64: C9 80    cmp #$80
ED66: D0 0B    bne $ed73
ED68: 8A       txa
ED69: 29 0F    and #$0f
ED6B: 18       clc
ED6C: 65 14    adc $14
ED6E: 85 14    sta $14
ED70: 4C 0E ED jmp $ed0e
ED73: 8A       txa
ED74: 18       clc
ED75: 65 1B    adc $1b
ED77: 10 02    bpl $ed7b
ED79: 29 1F    and #$1f
ED7B: 18       clc
ED7C: 65 1C    adc $1c
ED7E: 85 1C    sta $1c
ED80: A5 1D    lda $1d
ED82: 69 00    adc #$00
ED84: 85 1D    sta $1d
ED86: C6 01    dec $01
ED88: F0 03    beq $ed8d
ED8A: 4C 06 ED jmp $ed06
ED8D: A6 03    ldx $03
ED8F: F0 0F    beq $eda0
ED91: A5 0C    lda $0c
ED93: A8       tay
ED94: A5 04    lda $04
ED96: 85 10    sta $10
ED98: A5 05    lda $05
ED9A: 85 11    sta $11
ED9C: A9 00    lda #$00
ED9E: 85 03    sta $03
EDA0: 98       tya
EDA1: 18       clc
EDA2: 65 10    adc $10
EDA4: 85 10    sta $10
EDA6: A5 11    lda $11
EDA8: 69 00    adc #$00
EDAA: 85 11    sta $11
EDAC: 4C BE EC jmp $ecbe
EDAF: A9 00    lda #$00
EDB1: 20 DF D8 jsr $d8df
EDB4: 60       rts
EDB5: 98       tya
EDB6: 48       pha
EDB7: A5 03    lda $03
EDB9: 0A       asl a
EDBA: A8       tay
EDBB: A6 03    ldx $03
EDBD: A5 10    lda $10
EDBF: 99 04 00 sta $0004, y
EDC2: A5 11    lda $11
EDC4: 99 05 00 sta $0005, y
EDC7: 68       pla
EDC8: A8       tay
EDC9: B1 10    lda ($10), y
EDCB: C8       iny
EDCC: 48       pha
EDCD: B1 10    lda ($10), y
EDCF: C8       iny
EDD0: 85 11    sta $11
EDD2: 68       pla
EDD3: 85 10    sta $10
EDD5: 94 0C    sty $0c, x
EDD7: E6 03    inc $03
EDD9: A0 00    ldy #$00
EDDB: 60       rts
EDDC: 48       pha
EDDD: A9 01    lda #$01
EDDF: 20 DF D8 jsr $d8df
EDE2: 68       pla
EDE3: 0A       asl a
EDE4: A8       tay
EDE5: AD 02 60 lda $6002
EDE8: 85 10    sta $10
EDEA: AD 03 60 lda $6003
EDED: 85 11    sta $11
EDEF: B1 10    lda ($10), y
EDF1: 48       pha
EDF2: C8       iny
EDF3: B1 10    lda ($10), y
EDF5: 85 11    sta $11
EDF7: 68       pla
EDF8: 85 10    sta $10
EDFA: A0 00    ldy #$00
EDFC: B1 10    lda ($10), y
EDFE: C8       iny
EDFF: 85 01    sta $01
EE01: C9 00    cmp #$00
EE03: D0 0E    bne $ee13
EE05: B1 10    lda ($10), y
EE07: 48       pha
EE08: C8       iny
EE09: B1 10    lda ($10), y
EE0B: 85 11    sta $11
EE0D: 68       pla
EE0E: 85 10    sta $10
EE10: 4C FA ED jmp $edfa
EE13: C9 FF    cmp #$ff
EE15: D0 06    bne $ee1d
EE17: A9 00    lda #$00
EE19: 20 DF D8 jsr $d8df
EE1C: 60       rts
EE1D: B1 10    lda ($10), y
EE1F: C8       iny
EE20: 85 02    sta $02
EE22: B1 10    lda ($10), y
EE24: C8       iny
EE25: 85 14    sta $14
EE27: B1 10    lda ($10), y
EE29: C8       iny
EE2A: 85 15    sta $15
EE2C: B1 10    lda ($10), y
EE2E: 85 13    sta $13
EE30: C8       iny
EE31: 84 00    sty $00
EE33: A9 00    lda #$00
EE35: 85 1B    sta $1b
EE37: A5 14    lda $14
EE39: 85 16    sta $16
EE3B: A5 15    lda $15
EE3D: 18       clc
EE3E: 69 10    adc #$10
EE40: 85 17    sta $17
EE42: A6 02    ldx $02
EE44: A4 00    ldy $00
EE46: B1 10    lda ($10), y
EE48: C9 FF    cmp #$ff
EE4A: F0 17    beq $ee63
EE4C: C9 FE    cmp #$fe
EE4E: D0 0B    bne $ee5b
EE50: C8       iny
EE51: B1 10    lda ($10), y
EE53: 85 13    sta $13
EE55: E6 00    inc $00
EE57: E6 00    inc $00
EE59: D0 E9    bne $ee44
EE5B: A4 1B    ldy $1b
EE5D: 91 14    sta ($14), y
EE5F: A5 13    lda $13
EE61: 91 16    sta ($16), y
EE63: E6 00    inc $00
EE65: E6 1B    inc $1b
EE67: CA       dex
EE68: D0 DA    bne $ee44
EE6A: A5 14    lda $14
EE6C: 18       clc
EE6D: 69 20    adc #$20
EE6F: 85 14    sta $14
EE71: A5 15    lda $15
EE73: 69 00    adc #$00
EE75: 85 15    sta $15
EE77: C6 01    dec $01
EE79: D0 B8    bne $ee33
EE7B: A4 00    ldy $00
EE7D: 4C FC ED jmp $edfc
EE80: 48       pha
EE81: A9 01    lda #$01
EE83: 20 DF D8 jsr $d8df
EE86: AD 04 60 lda $6004
EE89: 85 1D    sta $1d
EE8B: AD 05 60 lda $6005
EE8E: 85 1E    sta $1e
EE90: A9 00    lda #$00
EE92: 85 03    sta $03
EE94: 68       pla
EE95: 20 B3 EC jsr $ecb3
EE98: A9 00    lda #$00
EE9A: 20 DF D8 jsr $d8df
EE9D: 60       rts

nmi_ee9e:
EE9E: 4C E0 EE jmp $eee0

reset_eea1:
EEA1: 4C 0D EF jmp reset_ef0d

irq_eea4:
EEA4: 4C A7 EE jmp $eea7
EEA7: D8       cld
EEA8: 48       pha
EEA9: E6 31    inc $31
EEAB: 20 7C EA jsr $ea7c
EEAE: A5 31    lda $31
EEB0: 29 07    and #$07
EEB2: D0 27    bne $eedb
EEB4: A5 35    lda nb_credits_0035
EEB6: 48       pha
EEB7: 8A       txa
EEB8: 48       pha
EEB9: 98       tya
EEBA: 48       pha
EEBB: 20 D0 D7 jsr $d7d0
EEBE: 20 15 F7 jsr $f715
EEC1: 68       pla
EEC2: A8       tay
EEC3: 68       pla
EEC4: AA       tax
EEC5: 68       pla
EEC6: C5 35    cmp nb_credits_0035
EEC8: F0 11    beq $eedb
EECA: A5 36    lda $36
EECC: 0D F9 07 ora $07f9
EECF: D0 0A    bne $eedb
EED1: A2 FF    ldx #$ff
EED3: 9A       txs
EED4: 58       cli
EED5: 8D 0B 10 sta irq_ack_100b
EED8: 4C F5 EF jmp $eff5
EEDB: 8D 0B 10 sta irq_ack_100b
EEDE: 68       pla
EEDF: 40       rti
EEE0: 48       pha
EEE1: 8A       txa
EEE2: 48       pha
EEE3: 98       tya
EEE4: 48       pha
EEE5: E6 30    inc $30
EEE7: A5 2F    lda $2f
EEE9: C9 5A    cmp #$5a
EEEB: D0 0C    bne $eef9
EEED: 20 B7 D1 jsr $d1b7
EEF0: A9 00    lda #$00
EEF2: 85 2F    sta $2f
EEF4: 85 30    sta $30
EEF6: 20 6B EA jsr $ea6b
EEF9: AD 02 10 lda system_1002
EEFC: 29 08    and #$08
EEFE: D0 F9    bne $eef9
EF00: A9 00    lda #$00
EF02: 85 31    sta $31
EF04: 8D 0A 10 sta irq_ack_100a
EF07: 68       pla
EF08: A8       tay
EF09: 68       pla
EF0A: AA       tax
EF0B: 68       pla
EF0C: 40       rti

reset_ef0d:
EF0D: 78       sei			 ; no interrupts
EF0E: D8       cld			 ; no decimal mode
EF0F: A2 FF    ldx #$ff		 ; stack top
EF11: 9A       txs
EF12: A9 18    lda #$18
EF14: 8D 09 10 sta bankswitch_1009	; bank 0
EF17: 20 0C CF jsr $cf0c
EF1A: A9 08    lda #$08
EF1C: 20 16 CF jsr $cf16
EF1F: 20 35 CF jsr $cf35
EF22: 20 73 CF jsr $cf73
EF25: A9 FF    lda #$ff
EF27: 85 42    sta $42
EF29: 85 43    sta $43
EF2B: 85 44    sta $44
EF2D: 85 45    sta $45
EF2F: 58       cli
EF30: 8D 0A 10 sta irq_ack_100a
EF33: 8D 0B 10 sta irq_ack_100b
EF36: A9 02    lda #$02
EF38: 8D F3 07 sta $07f3
EF3B: A9 00    lda #$00
EF3D: 8D F4 07 sta $07f4
EF40: 20 A2 D8 jsr $d8a2
EF43: 20 8F D8 jsr $d88f
EF46: 20 E2 EA jsr $eae2
EF49: A9 00    lda #$00
EF4B: 8D 0D 10 sta sound_100d
EF4E: A9 02    lda #$02
EF50: 20 2B D8 jsr $d82b
EF53: A9 05    lda #$05
EF55: 20 B8 D7 jsr $d7b8
EF58: A9 00    lda #$00
EF5A: 85 36    sta $36
EF5C: 8D DB 07 sta $07db
EF5F: 20 73 CF jsr $cf73
EF62: 20 8F D8 jsr $d88f
EF65: A9 0F    lda #$0f
EF67: 8D E4 07 sta $07e4
EF6A: 20 52 EB jsr $eb52
EF6D: A9 01    lda #$01
EF6F: 20 7F DA jsr $da7f
EF72: 20 9A EB jsr $eb9a
EF75: A9 00    lda #$00
EF77: 8D F5 07 sta $07f5
EF7A: A0 00    ldy #$00
EF7C: AD F5 07 lda $07f5
EF7F: 29 20    and #$20
EF81: D0 02    bne $ef85
EF83: A0 80    ldy #$80
EF85: 98       tya
EF86: 20 7F DA jsr $da7f
EF89: 20 22 D8 jsr $d822
EF8C: EE F5 07 inc $07f5
EF8F: D0 E9    bne $ef7a
EF91: 4C EB EF jmp $efeb
EF94: A9 00    lda #$00
EF96: 8D DB 07 sta $07db
EF99: 20 E2 EA jsr $eae2
EF9C: A9 06    lda #$06
EF9E: 8D E4 07 sta $07e4
EFA1: 20 52 EB jsr $eb52
EFA4: A9 19    lda #$19
EFA6: 20 80 EE jsr $ee80
EFA9: A9 06    lda #$06
EFAB: 20 7F DA jsr $da7f
EFAE: 20 9A EB jsr $eb9a
EFB1: A9 F0    lda #$f0
EFB3: 20 2B D8 jsr $d82b
EFB6: A9 80    lda #$80
EFB8: 20 2B D8 jsr $d82b
EFBB: EE E4 07 inc $07e4
EFBE: 20 52 EB jsr $eb52
EFC1: A9 19    lda #$19
EFC3: 20 80 EE jsr $ee80
EFC6: A9 07    lda #$07
EFC8: 20 7F DA jsr $da7f
EFCB: 20 9A EB jsr $eb9a
EFCE: A9 F0    lda #$f0
EFD0: 20 2B D8 jsr $d82b
EFD3: A9 80    lda #$80
EFD5: 20 2B D8 jsr $d82b
EFD8: EE E4 07 inc $07e4
EFDB: 20 52 EB jsr $eb52
EFDE: 20 9A EB jsr $eb9a
EFE1: A9 F0    lda #$f0
EFE3: 20 2B D8 jsr $d82b
EFE6: A9 80    lda #$80
EFE8: 20 2B D8 jsr $d82b
EFEB: 20 16 F3 jsr $f316
EFEE: A9 03    lda #$03
EFF0: 85 38    sta $38
EFF2: 4C A7 F1 jmp $f1a7
EFF5: A5 36    lda $36
EFF7: D0 07    bne $f000
EFF9: A9 00    lda #$00
EFFB: 85 38    sta $38
EFFD: 20 16 F3 jsr $f316
F000: A9 08    lda #$08
F002: 20 2B D8 jsr $d82b
F005: A9 1F    lda #$1f
F007: 20 B8 D7 jsr $d7b8
F00A: A9 07    lda #$07
F00C: 20 16 CF jsr $cf16
F00F: A2 4C    ldx #$4c
F011: 20 0E CF jsr $cf0e
F014: AD F9 07 lda $07f9
F017: 09 01    ora #$01
F019: 8D F9 07 sta $07f9
F01C: 20 73 CF jsr $cf73
F01F: A9 02    lda #$02
F021: 20 B8 D7 jsr $d7b8
F024: 20 8F D8 jsr $d88f
F027: A9 12    lda #$12
F029: 8D E4 07 sta $07e4
F02C: A9 00    lda #$00
F02E: 8D DB 07 sta $07db
F031: 20 52 EB jsr $eb52
F034: A9 05    lda #$05
F036: 20 7F DA jsr $da7f
F039: 20 9A EB jsr $eb9a
F03C: 20 E2 EA jsr $eae2
F03F: A9 01    lda #$01
F041: 85 46    sta $46
F043: A9 FF    lda #$ff
F045: 85 4F    sta $4f
F047: 20 64 AF jsr $af64
F04A: A9 00    lda #$00
F04C: 85 54    sta $54
F04E: A9 10    lda #$10
F050: 85 55    sta $55
F052: A9 80    lda #$80
F054: 8D DE 07 sta $07de
F057: A9 00    lda #$00
F059: 8D DF 07 sta $07df
F05C: A9 D0    lda #$d0
F05E: 8D E0 07 sta $07e0
F061: A9 FF    lda #$ff
F063: 8D E1 07 sta $07e1
F066: A9 00    lda #$00
F068: 85 CB    sta $cb
F06A: 85 93    sta $93
F06C: 85 E7    sta $e7
F06E: 85 F5    sta $f5
F070: A9 01    lda #$01
F072: 85 A1    sta $a1
F074: A9 B0    lda #$b0
F076: 85 BD    sta $bd
F078: A9 30    lda #$30
F07A: 85 69    sta $69
F07C: A9 89    lda #$89
F07E: 85 77    sta $77
F080: A9 00    lda #$00
F082: 8D F4 07 sta $07f4
F085: 20 C5 D8 jsr $d8c5
F088: A2 03    ldx #$03
F08A: 8A       txa
F08B: 4A       lsr a
F08C: A8       tay
F08D: B9 47 00 lda $0047, y
F090: 10 05    bpl $f097
F092: A9 C0    lda #$c0
F094: 9D 0A 03 sta $030a, x
F097: CA       dex
F098: 10 F0    bpl $f08a
F09A: 20 EF D8 jsr $d8ef
F09D: A9 07    lda #$07
F09F: 20 A6 D9 jsr $d9a6
F0A2: A0 03    ldy #$03
F0A4: AD F5 07 lda $07f5
F0A7: 29 10    and #$10
F0A9: D0 02    bne $f0ad
F0AB: A0 83    ldy #$83
F0AD: 98       tya
F0AE: 20 7F DA jsr $da7f
F0B1: A9 00    lda #$00
F0B3: 8D DA 06 sta $06da
F0B6: 20 45 A6 jsr $a645
F0B9: 20 6A AE jsr $ae6a
F0BC: 20 CC E6 jsr $e6cc
F0BF: A2 04    ldx #$04
F0C1: 86 4C    stx $4c
F0C3: 20 F3 DF jsr $dff3
F0C6: 20 59 CF jsr $cf59
F0C9: A9 5A    lda #$5a
F0CB: 85 2F    sta $2f
F0CD: A5 2F    lda $2f
F0CF: D0 FC    bne $f0cd
F0D1: EE F5 07 inc $07f5
F0D4: 20 EF D8 jsr $d8ef
F0D7: AD 03 10 lda dsw1_1003
F0DA: 30 03    bmi $f0df
F0DC: 4C B5 F1 jmp $f1b5
F0DF: AD 2F 02 lda $022f
F0E2: 10 27    bpl $f10b
F0E4: A9 02    lda #$02
F0E6: 38       sec
F0E7: E5 37    sbc $37
F0E9: 85 00    sta $00
F0EB: A5 35    lda nb_credits_0035
F0ED: C5 00    cmp $00
F0EF: 90 4C    bcc $f13d
F0F1: A9 80    lda #$80
F0F3: 85 47    sta $47
F0F5: 85 48    sta $48
F0F7: A9 C0    lda #$c0
F0F9: 8D 0A 03 sta $030a
F0FC: 8D 0B 03 sta $030b
F0FF: 8D 0C 03 sta $030c
F102: 8D 0D 03 sta $030d
F105: A9 02    lda #$02
F107: 85 37    sta $37
F109: D0 1F    bne $f12a
F10B: AD 2E 02 lda $022e
F10E: 10 2D    bpl $f13d
F110: A5 37    lda $37
F112: D0 5D    bne $f171
F114: A5 35    lda nb_credits_0035
F116: F0 25    beq $f13d
F118: A9 80    lda #$80
F11A: 85 47    sta $47
F11C: A9 C0    lda #$c0
F11E: 8D 0A 03 sta $030a
F121: 8D 0B 03 sta $030b
F124: A9 01    lda #$01
F126: 85 37    sta $37
F128: 85 00    sta $00
F12A: F8       sed
F12B: A5 35    lda nb_credits_0035
F12D: 38       sec
F12E: E5 00    sbc $00
F130: 85 35    sta nb_credits_0035
F132: D8       cld
F133: A9 80    lda #$80
F135: 85 36    sta $36
F137: 20 16 F3 jsr $f316
F13A: 4C 71 F1 jmp $f171
F13D: A5 47    lda $47
F13F: 05 48    ora $48
F141: 30 03    bmi $f146
F143: 4C 9D F0 jmp $f09d
F146: E6 54    inc $54
F148: A5 54    lda $54
F14A: C9 30    cmp #$30
F14C: 90 0D    bcc $f15b
F14E: A9 00    lda #$00
F150: 85 54    sta $54
F152: A5 55    lda $55
F154: F8       sed
F155: 38       sec
F156: E9 01    sbc #$01
F158: 85 55    sta $55
F15A: D8       cld
F15B: A5 55    lda $55
F15D: 30 12    bmi $f171
F15F: A9 18    lda #$18
F161: 20 7F DA jsr $da7f
F164: A9 06    lda #$06
F166: 20 A6 D9 jsr $d9a6
F169: 20 EC F7 jsr $f7ec
F16C: D0 03    bne $f171
F16E: 4C 9D F0 jmp $f09d
F171: A9 C0    lda #$c0
F173: 8D 0A 03 sta $030a
F176: 8D 0B 03 sta $030b
F179: 8D 0C 03 sta $030c
F17C: 8D 0D 03 sta $030d
F17F: A9 00    lda #$00
F181: 8D DA 06 sta $06da
F184: 8D F5 07 sta $07f5
F187: 20 45 A6 jsr $a645
F18A: 20 6A AE jsr $ae6a
F18D: 20 CC E6 jsr $e6cc
F190: A2 04    ldx #$04
F192: 86 4C    stx $4c
F194: 20 F3 DF jsr $dff3
F197: 20 59 CF jsr $cf59
F19A: 20 22 D8 jsr $d822
F19D: A9 07    lda #$07
F19F: 20 A6 D9 jsr $d9a6
F1A2: A9 50    lda #$50
F1A4: 20 2B D8 jsr $d82b
F1A7: A9 00    lda #$00
F1A9: 8D F9 07 sta $07f9
F1AC: 8D DB 07 sta $07db
F1AF: 8D E1 07 sta $07e1
F1B2: 4C 13 F2 jmp $f213
F1B5: A9 03    lda #$03
F1B7: 85 00    sta $00
F1B9: A6 00    ldx $00
F1BB: AD 03 10 lda dsw1_1003
F1BE: 49 FF    eor #$ff
F1C0: 29 30    and #$30
F1C2: F0 04    beq $f1c8
F1C4: C9 30    cmp #$30
F1C6: D0 02    bne $f1ca
F1C8: A9 80    lda #$80
F1CA: 3D 2E 02 and $022e, x
F1CD: F0 3D    beq $f20c
F1CF: A5 35    lda nb_credits_0035
F1D1: F0 39    beq $f20c
F1D3: B5 42    lda $42, x
F1D5: C5 00    cmp $00
F1D7: F0 33    beq $f20c
F1D9: A5 35    lda nb_credits_0035
F1DB: F8       sed
F1DC: 38       sec
F1DD: E9 01    sbc #$01
F1DF: 85 35    sta nb_credits_0035
F1E1: D8       cld
F1E2: E6 37    inc $37
F1E4: A9 80    lda #$80
F1E6: 85 36    sta $36
F1E8: 20 16 F3 jsr $f316
F1EB: 8A       txa
F1EC: 4A       lsr a
F1ED: A8       tay
F1EE: A9 80    lda #$80
F1F0: 99 47 00 sta $0047, y
F1F3: 8A       txa
F1F4: 49 01    eor #$01
F1F6: A8       tay
F1F7: A5 00    lda $00
F1F9: 95 42    sta $42, x
F1FB: A9 C0    lda #$c0
F1FD: 9D 0A 03 sta $030a, x
F200: 99 0A 03 sta $030a, y
F203: B9 42 00 lda $0042, y
F206: 10 04    bpl $f20c
F208: 8A       txa
F209: 99 42 00 sta $0042, y
F20C: C6 00    dec $00
F20E: 10 A9    bpl $f1b9
F210: 4C 3D F1 jmp $f13d
F213: 20 8F D8 jsr $d88f
F216: 20 35 CF jsr $cf35
F219: 20 73 CF jsr $cf73
F21C: A9 07    lda #$07
F21E: 20 16 CF jsr $cf16
F221: A2 4C    ldx #$4c
F223: 20 0E CF jsr $cf0e
F226: 20 35 CF jsr $cf35
F229: 20 73 CF jsr $cf73
F22C: A9 00    lda #$00
F22E: 85 46    sta $46
F230: A5 36    lda $36
F232: D0 03    bne $f237
F234: 4C BB F2 jmp $f2bb
F237: A9 02    lda #$02
F239: 20 B8 D7 jsr $d7b8
F23C: 20 F1 EB jsr $ebf1
F23F: 20 9A EB jsr $eb9a
F242: A9 02    lda #$02
F244: 8D DB 07 sta $07db
F247: A9 00    lda #$00
F249: 8D F5 07 sta $07f5
F24C: 20 2F EC jsr $ec2f
F24F: 98       tya
F250: 18       clc
F251: 69 05    adc #$05
F253: A8       tay
F254: AD F5 07 lda $07f5
F257: 29 10    and #$10
F259: F0 05    beq $f260
F25B: 98       tya
F25C: 18       clc
F25D: 69 05    adc #$05
F25F: A8       tay
F260: 98       tya
F261: 20 DC ED jsr $eddc
F264: 20 22 D8 jsr $d822
F267: AD 00 10 lda p1_1000
F26A: 2D 01 10 and p2_1001
F26D: 2C 03 10 bit dsw1_1003
F270: 30 06    bmi $f278
F272: 2D 05 10 and $1005
F275: 2D 06 10 and $1006
F278: 29 F0    and #$f0
F27A: C9 F0    cmp #$f0
F27C: D0 31    bne $f2af
F27E: EE F5 07 inc $07f5
F281: AD F5 07 lda $07f5
F284: C9 70    cmp #$70
F286: 90 C4    bcc $f24c
F288: A9 00    lda #$00
F28A: 8D F5 07 sta $07f5
F28D: EE F5 07 inc $07f5
F290: 20 22 D8 jsr $d822
F293: AD 00 10 lda p1_1000
F296: 2D 01 10 and p2_1001
F299: 2C 03 10 bit dsw1_1003
F29C: 30 06    bmi $f2a4
F29E: 2D 05 10 and $1005
F2A1: 2D 06 10 and $1006
F2A4: 29 F0    and #$f0
F2A6: C9 F0    cmp #$f0
F2A8: D0 05    bne $f2af
F2AA: AD F5 07 lda $07f5
F2AD: 10 DE    bpl $f28d
F2AF: 20 2F EC jsr $ec2f
F2B2: 98       tya
F2B3: 20 80 EE jsr $ee80
F2B6: A9 40    lda #$40
F2B8: 20 3F D8 jsr $d83f
F2BB: 20 2F EC jsr $ec2f
F2BE: 48       pha
F2BF: 8D E4 07 sta $07e4
F2C2: 20 52 EB jsr $eb52
F2C5: 20 D3 E6 jsr $e6d3
F2C8: 68       pla
F2C9: 48       pha
F2CA: 8D F4 07 sta $07f4
F2CD: 20 C5 D8 jsr $d8c5
F2D0: 20 9A EB jsr $eb9a
F2D3: 20 C8 F7 jsr $f7c8
F2D6: 20 64 AF jsr $af64
F2D9: A9 10    lda #$10
F2DB: 8D E0 03 sta $03e0
F2DE: A9 00    lda #$00
F2E0: 8D DD 07 sta $07dd
F2E3: 8D DF 07 sta $07df
F2E6: A9 80    lda #$80
F2E8: 8D DE 07 sta $07de
F2EB: A9 01    lda #$01
F2ED: 85 46    sta $46
F2EF: A9 00    lda #$00
F2F1: 8D F5 07 sta $07f5
F2F4: A9 80    lda #$80
F2F6: 8D DE 07 sta $07de
F2F9: A9 01    lda #$01
F2FB: 8D DB 07 sta $07db
F2FE: A9 00    lda #$00
F300: 8D F5 07 sta $07f5
F303: A5 36    lda $36
F305: F0 68    beq $f36f
F307: AD E4 07 lda $07e4
F30A: 29 0F    and #$0f
F30C: A8       tay
F30D: B9 6A F3 lda $f36a, y
F310: 20 B8 D7 jsr $d7b8
F313: 4C 6F F3 jmp $f36f
F316: AD 03 10 lda dsw1_1003
F319: 49 FF    eor #$ff
F31B: 48       pha
F31C: 29 03    and #$03
F31E: A8       tay
F31F: B9 52 F3 lda $f352, y
F322: 85 3A    sta $3a
F324: A0 00    ldy #$00
F326: 84 49    sty $49
F328: 68       pla
F329: 4A       lsr a
F32A: 4A       lsr a
F32B: 29 03    and #$03
F32D: A8       tay
F32E: B9 52 F3 lda $f352, y
F331: 0A       asl a
F332: A8       tay
F333: A5 37    lda $37
F335: D0 04    bne $f33b
F337: A0 0A    ldy #$0a
F339: D0 0C    bne $f347
F33B: C9 02    cmp #$02
F33D: 90 08    bcc $f347
F33F: A0 08    ldy #$08
F341: C9 03    cmp #$03
F343: 90 02    bcc $f347
F345: A0 0C    ldy #$0c
F347: B9 56 F3 lda $f356, y
F34A: 85 4A    sta $4a
F34C: B9 57 F3 lda $f357, y
F34F: 85 4B    sta $4b
F351: 60       rts

F36F: A9 00    lda #$00
F371: 85 30    sta $30
F373: A9 00    lda #$00
F375: 8D DA 06 sta $06da
F378: 20 23 E9 jsr $e923
F37B: A5 46    lda $46
F37D: 29 02    and #$02
F37F: D0 03    bne $f384
F381: 4C CA F4 jmp $f4ca
F384: 20 30 A7 jsr $a730
F387: 20 45 A6 jsr $a645
F38A: 20 A8 AC jsr $aca8
F38D: 20 CC E6 jsr $e6cc
F390: 20 A5 A8 jsr $a8a5
F393: AD F5 07 lda $07f5
F396: C9 58    cmp #$58
F398: B0 03    bcs $f39d
F39A: 4C FD F4 jmp $f4fd
F39D: A5 46    lda $46
F39F: 29 FD    and #$fd
F3A1: 85 46    sta $46
F3A3: A9 00    lda #$00
F3A5: 8D E5 07 sta $07e5
F3A8: A2 00    ldx #$00
F3AA: A5 46    lda $46
F3AC: 29 10    and #$10
F3AE: F0 01    beq $f3b1
F3B0: E8       inx
F3B1: B5 57    lda $57, x
F3B3: C9 10    cmp #$10
F3B5: 90 1F    bcc $f3d6
F3B7: A5 46    lda $46
F3B9: 29 FD    and #$fd
F3BB: 09 08    ora #$08
F3BD: 85 46    sta $46
F3BF: A9 00    lda #$00
F3C1: 8D F5 07 sta $07f5
F3C4: A0 14    ldy #$14
F3C6: B5 47    lda $47, x
F3C8: 30 02    bmi $f3cc
F3CA: A0 0E    ldy #$0e
F3CC: 98       tya
F3CD: 20 B8 D7 jsr $d7b8
F3D0: 20 82 AF jsr $af82
F3D3: 4C FD F4 jmp $f4fd
F3D6: C9 08    cmp #$08
F3D8: D0 0F    bne $f3e9
F3DA: 8A       txa
F3DB: 49 01    eor #$01
F3DD: AA       tax
F3DE: B5 57    lda $57, x
F3E0: C9 08    cmp #$08
F3E2: B0 05    bcs $f3e9
F3E4: A9 03    lda #$03
F3E6: 20 B8 D7 jsr $d7b8
F3E9: A5 46    lda $46
F3EB: 09 04    ora #$04
F3ED: 85 46    sta $46
F3EF: A5 46    lda $46
F3F1: 49 10    eor #$10
F3F3: 29 10    and #$10
F3F5: 4A       lsr a
F3F6: 4A       lsr a
F3F7: 4A       lsr a
F3F8: AA       tax
F3F9: E4 50    cpx $50
F3FB: D0 10    bne $f40d
F3FD: BD 0A 03 lda $030a, x
F400: 49 08    eor #$08
F402: 9D 0A 03 sta $030a, x
F405: BD 0B 03 lda $030b, x
F408: 49 08    eor #$08
F40A: 9D 0B 03 sta $030b, x
F40D: A2 03    ldx #$03
F40F: 8A       txa
F410: 4A       lsr a
F411: A8       tay
F412: B9 47 00 lda $0047, y
F415: A8       tay
F416: BD 0A 03 lda $030a, x
F419: 29 08    and #$08
F41B: F0 08    beq $f425
F41D: 09 40    ora #$40
F41F: C0 80    cpy #$80
F421: 90 02    bcc $f425
F423: 09 80    ora #$80
F425: 9D 0A 03 sta $030a, x
F428: 29 40    and #$40
F42A: F0 05    beq $f431
F42C: 8A       txa
F42D: 4A       lsr a
F42E: A8       tay
F42F: 96 51    stx $51, y
F431: A9 01    lda #$01
F433: 9D 1A 03 sta $031a, x
F436: A9 00    lda #$00
F438: 9D 0E 03 sta $030e, x
F43B: CA       dex
F43C: 10 D1    bpl $f40f
F43E: A5 46    lda $46
F440: 29 10    and #$10
F442: 4A       lsr a
F443: 4A       lsr a
F444: 4A       lsr a
F445: A8       tay
F446: B9 0A 03 lda $030a, y
F449: 29 08    and #$08
F44B: D0 01    bne $f44e
F44D: C8       iny
F44E: 84 4F    sty $4f
F450: A9 00    lda #$00
F452: 85 56    sta $56
F454: 20 82 AF jsr $af82
F457: A9 00    lda #$00
F459: A2 05    ldx #$05
F45B: 9D 1A 03 sta $031a, x
F45E: E8       inx
F45F: E0 0D    cpx #$0d
F461: 90 F8    bcc $f45b
F463: A5 4A    lda $4a
F465: 05 4B    ora $4b
F467: F0 03    beq $f46c
F469: 4C CA F4 jmp $f4ca
F46C: A5 37    lda $37
F46E: D0 03    bne $f473
F470: 4C 53 EF jmp $ef53
F473: A9 00    lda #$00
F475: AA       tax
F476: 9D DD 07 sta $07dd, x
F479: E8       inx
F47A: E0 05    cpx #$05
F47C: 90 F8    bcc $f476
F47E: 8D DB 07 sta $07db
F481: 20 73 CF jsr $cf73
F484: A9 00    lda #$00
F486: 8D DA 06 sta $06da
F489: 20 30 A7 jsr $a730
F48C: 20 45 A6 jsr $a645
F48F: 20 A8 AC jsr $aca8
F492: 20 CC E6 jsr $e6cc
F495: 20 59 CF jsr $cf59
F498: A9 12    lda #$12
F49A: 20 80 EE jsr $ee80
F49D: A5 4A    lda $4a
F49F: 05 4B    ora $4b
F4A1: D0 0F    bne $f4b2
F4A3: A9 17    lda #$17
F4A5: 20 7F DA jsr $da7f
F4A8: A9 05    lda #$05
F4AA: 20 B8 D7 jsr $d7b8
F4AD: A9 80    lda #$80
F4AF: 20 3F D8 jsr $d83f
F4B2: A9 00    lda #$00
F4B4: 85 54    sta $54
F4B6: A9 10    lda #$10
F4B8: 85 55    sta $55
F4BA: A5 46    lda $46
F4BC: 29 F7    and #$f7
F4BE: 09 40    ora #$40
F4C0: 85 46    sta $46
F4C2: 20 42 EC jsr $ec42
F4C5: A9 12    lda #$12
F4C7: 20 80 EE jsr $ee80
F4CA: A5 46    lda $46
F4CC: 29 40    and #$40
F4CE: F0 03    beq $f4d3
F4D0: 4C 71 F6 jmp $f671
F4D3: 20 EF D8 jsr $d8ef
F4D6: 20 1A CE jsr $ce1a
F4D9: 20 6A AE jsr $ae6a
F4DC: 20 FA B9 jsr $b9fa
F4DF: 20 E1 CD jsr $cde1
F4E2: 20 45 A6 jsr $a645
F4E5: 20 E0 A2 jsr $a2e0
F4E8: 20 30 A7 jsr $a730
F4EB: 20 1D AB jsr $ab1d
F4EE: 20 13 AC jsr $ac13
F4F1: 20 A7 AC jsr $aca7
F4F4: 20 A8 AC jsr $aca8
F4F7: 20 82 AD jsr $ad82
F4FA: 20 CC E6 jsr $e6cc
F4FD: 20 59 CF jsr $cf59
F500: A5 46    lda $46
F502: 29 40    and #$40
F504: D0 03    bne $f509
F506: 20 E2 E6 jsr $e6e2
F509: 20 42 EC jsr $ec42
F50C: A5 46    lda $46
F50E: 29 01    and #$01
F510: F0 0F    beq $f521
F512: AD F5 07 lda $07f5
F515: C9 20    cmp #$20
F517: 90 08    bcc $f521
F519: A5 46    lda $46
F51B: 29 FE    and #$fe
F51D: 09 04    ora #$04
F51F: 85 46    sta $46
F521: A5 30    lda $30
F523: F0 FC    beq $f521
F525: A9 5A    lda #$5a
F527: 85 2F    sta $2f
F529: A5 2F    lda $2f
F52B: D0 FC    bne $f529
F52D: EE F5 07 inc $07f5
F530: A5 46    lda $46
F532: 29 08    and #$08
F534: F0 07    beq $f53d
F536: AD F5 07 lda $07f5
F539: C9 C0    cmp #$c0
F53B: B0 03    bcs $f540
F53D: 4C 6F F3 jmp $f36f
F540: A5 46    lda $46
F542: 29 10    and #$10
F544: 49 10    eor #$10
F546: 4A       lsr a
F547: 4A       lsr a
F548: 4A       lsr a
F549: A8       tay
F54A: 4A       lsr a
F54B: AA       tax
F54C: B5 47    lda $47, x
F54E: 10 37    bpl $f587
F550: A9 00    lda #$00
F552: 95 47    sta $47, x
F554: AD 03 10 lda dsw1_1003
F557: 30 1D    bmi $f576
F559: 98       tya
F55A: D9 42 00 cmp $0042, y
F55D: D0 02    bne $f561
F55F: C6 37    dec $37
F561: A9 FF    lda #$ff
F563: 99 42 00 sta $0042, y
F566: C8       iny
F567: 98       tya
F568: D9 42 00 cmp $0042, y
F56B: D0 02    bne $f56f
F56D: C6 37    dec $37
F56F: A9 FF    lda #$ff
F571: 99 42 00 sta $0042, y
F574: 30 0A    bmi $f580
F576: A9 FF    lda #$ff
F578: 99 42 00 sta $0042, y
F57B: 99 43 00 sta $0043, y
F57E: C6 37    dec $37
F580: A5 37    lda $37
F582: D0 03    bne $f587
F584: 4C 10 F6 jmp $f610
F587: E6 38    inc $38
F589: A5 38    lda $38
F58B: 29 0F    and #$0f
F58D: C9 09    cmp #$09
F58F: 90 0F    bcc $f5a0
F591: A5 38    lda $38
F593: 29 F0    and #$f0
F595: C9 F0    cmp #$f0
F597: F0 03    beq $f59c
F599: 18       clc
F59A: 69 10    adc #$10
F59C: 09 04    ora #$04
F59E: 85 38    sta $38
F5A0: A5 38    lda $38
F5A2: 29 0F    and #$0f
F5A4: C9 04    cmp #$04
F5A6: D0 46    bne $f5ee
F5A8: 20 73 CF jsr $cf73
F5AB: 20 35 CF jsr $cf35
F5AE: A9 00    lda #$00
F5B0: 8D DB 07 sta $07db
F5B3: A9 11    lda #$11
F5B5: 8D E4 07 sta $07e4
F5B8: 20 52 EB jsr $eb52
F5BB: A4 38    ldy $38
F5BD: A9 0E    lda #$0e
F5BF: C0 10    cpy #$10
F5C1: 90 02    bcc $f5c5
F5C3: A9 0F    lda #$0f
F5C5: 20 7F DA jsr $da7f
F5C8: A9 12    lda #$12
F5CA: 20 B8 D7 jsr $d7b8
F5CD: 20 9A EB jsr $eb9a
F5D0: A9 FF    lda #$ff
F5D2: 20 3F D8 jsr $d83f
F5D5: A9 FF    lda #$ff
F5D7: 20 3F D8 jsr $d83f
F5DA: A9 FF    lda #$ff
F5DC: 20 3F D8 jsr $d83f
F5DF: A9 FF    lda #$ff
F5E1: 20 3F D8 jsr $d83f
F5E4: A9 FF    lda #$ff
F5E6: 20 3F D8 jsr $d83f
F5E9: A9 FF    lda #$ff
F5EB: 20 3F D8 jsr $d83f
F5EE: F8       sed
F5EF: 18       clc
F5F0: A9 00    lda #$00
F5F2: 85 49    sta $49
F5F4: A5 4A    lda $4a
F5F6: 69 30    adc #$30
F5F8: 85 4A    sta $4a
F5FA: A5 4B    lda $4b
F5FC: 69 00    adc #$00
F5FE: 85 4B    sta $4b
F600: A5 4A    lda $4a
F602: C9 60    cmp #$60
F604: 90 06    bcc $f60c
F606: E9 60    sbc #$60
F608: 85 4A    sta $4a
F60A: E6 4B    inc $4b
F60C: D8       cld
F60D: 4C F5 EF jmp $eff5
F610: A9 00    lda #$00
F612: AA       tax
F613: 9D DD 07 sta $07dd, x
F616: E8       inx
F617: E0 05    cpx #$05
F619: 90 F8    bcc $f613
F61B: 8D DB 07 sta $07db
F61E: 20 E2 EA jsr $eae2
F621: 20 73 CF jsr $cf73
F624: A9 00    lda #$00
F626: 8D DA 06 sta $06da
F629: 20 30 A7 jsr $a730
F62C: 20 45 A6 jsr $a645
F62F: 20 A8 AC jsr $aca8
F632: 20 CC E6 jsr $e6cc
F635: 20 59 CF jsr $cf59
F638: A9 12    lda #$12
F63A: 20 80 EE jsr $ee80
F63D: A9 14    lda #$14
F63F: 20 7F DA jsr $da7f
F642: A9 10    lda #$10
F644: 20 B8 D7 jsr $d7b8
F647: A9 FF    lda #$ff
F649: 20 3F D8 jsr $d83f
F64C: A9 FF    lda #$ff
F64E: 20 3F D8 jsr $d83f
F651: A9 00    lda #$00
F653: 85 47    sta $47
F655: 85 48    sta $48
F657: 85 37    sta $37
F659: A9 FF    lda #$ff
F65B: 85 42    sta $42
F65D: 85 43    sta $43
F65F: 85 44    sta $44
F661: 85 45    sta $45
F663: A9 00    lda #$00
F665: 85 36    sta $36
F667: A5 35    lda nb_credits_0035
F669: F0 03    beq $f66e
F66B: 20 F5 EF jsr $eff5
F66E: 4C 53 EF jmp $ef53
F671: A5 37    lda $37
F673: 8D 16 04 sta $0416
F676: 38       sec
F677: E5 35    sbc nb_credits_0035
F679: 8D 17 04 sta $0417
F67C: A0 13    ldy #$13
F67E: A2 04    ldx #$04
F680: A5 35    lda nb_credits_0035
F682: CD 16 04 cmp $0416
F685: B0 0B    bcs $f692
F687: A0 0B    ldy #$0b
F689: CA       dex
F68A: AD 17 04 lda $0417
F68D: C9 02    cmp #$02
F68F: 90 01    bcc $f692
F691: C8       iny
F692: 8A       txa
F693: 48       pha
F694: 98       tya
F695: 20 7F DA jsr $da7f
F698: 68       pla
F699: 20 A6 D9 jsr $d9a6
F69C: A9 0A    lda #$0a
F69E: 20 7F DA jsr $da7f
F6A1: E6 54    inc $54
F6A3: A5 54    lda $54
F6A5: C9 1F    cmp #$1f
F6A7: 90 12    bcc $f6bb
F6A9: A9 00    lda #$00
F6AB: 85 54    sta $54
F6AD: A5 55    lda $55
F6AF: F8       sed
F6B0: 38       sec
F6B1: E9 01    sbc #$01
F6B3: 85 55    sta $55
F6B5: D8       cld
F6B6: 10 03    bpl $f6bb
F6B8: 4C 10 F6 jmp $f610
F6BB: A9 01    lda #$01
F6BD: 20 A6 D9 jsr $d9a6
F6C0: A9 02    lda #$02
F6C2: 20 A6 D9 jsr $d9a6
F6C5: A5 35    lda nb_credits_0035
F6C7: CD 16 04 cmp $0416
F6CA: 90 46    bcc $f712
F6CC: 20 EF D8 jsr $d8ef
F6CF: AE 16 04 ldx $0416
F6D2: BD 2D 02 lda bankswitch_copy_022d, x
F6D5: 10 3B    bpl $f712
F6D7: A5 35    lda nb_credits_0035
F6D9: F8       sed
F6DA: 38       sec
F6DB: ED 16 04 sbc $0416
F6DE: 85 35    sta nb_credits_0035
F6E0: D8       cld
F6E1: A9 01    lda #$01
F6E3: 8D DB 07 sta $07db
F6E6: A5 46    lda $46
F6E8: 29 BF    and #$bf
F6EA: 85 46    sta $46
F6EC: 20 9D EC jsr $ec9d
F6EF: 20 C8 F7 jsr $f7c8
F6F2: 20 16 F3 jsr $f316
F6F5: 20 D3 E6 jsr $e6d3
F6F8: AD E4 07 lda $07e4
F6FB: 29 0F    and #$0f
F6FD: A8       tay
F6FE: B9 6A F3 lda $f36a, y
F701: A4 57    ldy $57
F703: C0 08    cpy #$08
F705: B0 06    bcs $f70d
F707: A4 58    ldy $58
F709: C0 08    cpy #$08
F70B: 90 02    bcc $f70f
F70D: A9 03    lda #$03
F70F: 20 B8 D7 jsr $d7b8
F712: 4C E2 F4 jmp $f4e2
F715: A5 32    lda $32
F717: D0 19    bne $f732
F719: A5 3B    lda $3b
F71B: F0 04    beq $f721
F71D: C6 3B    dec $3b
F71F: D0 10    bne $f731
F721: AD 02 10 lda system_1002
F724: 49 FF    eor #$ff
F726: 29 07    and #$07
F728: F0 07    beq $f731
F72A: 85 32    sta $32
F72C: A9 00    lda #$00
F72E: 8D F7 07 sta $07f7
F731: 60       rts
F732: A5 32    lda $32
F734: 29 04    and #$04
F736: F0 0E    beq $f746
F738: AD 02 10 lda system_1002
F73B: 49 FF    eor #$ff
F73D: 29 04    and #$04
F73F: D0 F0    bne $f731
F741: A0 00    ldy #$00
F743: 4C 93 F7 jmp $f793
F746: AD 02 10 lda system_1002
F749: 49 FF    eor #$ff
F74B: 29 07    and #$07
F74D: C5 32    cmp $32
F74F: D0 0B    bne $f75c
F751: AD F7 07 lda $07f7
F754: C9 FF    cmp #$ff
F756: F0 03    beq $f75b
F758: EE F7 07 inc $07f7
F75B: 60       rts
F75C: AD F7 07 lda $07f7
F75F: C9 04    cmp #$04
F761: 90 47    bcc $f7aa
F763: A2 00    ldx #$00
F765: A5 32    lda $32
F767: C9 01    cmp #$01
F769: F0 01    beq $f76c
F76B: E8       inx
F76C: AD 04 10 lda dsw2_1004
F76F: 49 FF    eor #$ff
F771: 29 3F    and #$3f
F773: E0 00    cpx #$00
F775: F0 03    beq $f77a
F777: 4A       lsr a
F778: 4A       lsr a
F779: 4A       lsr a
F77A: 29 07    and #$07
F77C: A8       tay
F77D: C9 05    cmp #$05
F77F: 90 12    bcc $f793
F781: E9 05    sbc #$05
F783: A8       tay
F784: F6 33    inc $33, x
F786: B5 33    lda $33, x
F788: D9 AF F7 cmp $f7af, y
F78B: 90 1D    bcc $f7aa
F78D: A9 00    lda #$00
F78F: 95 33    sta $33, x
F791: A0 00    ldy #$00
F793: A5 35    lda nb_credits_0035
F795: F8       sed
F796: 18       clc
F797: 79 B2 F7 adc $f7b2, y
F79A: D8       cld
F79B: 90 02    bcc $f79f
F79D: A9 99    lda #$99
F79F: 85 35    sta nb_credits_0035
F7A1: A9 34    lda #$34
F7A3: 8D 0D 10 sta sound_100d
F7A6: A9 04    lda #$04
F7A8: 85 3B    sta $3b
F7AA: A9 00    lda #$00
F7AC: 85 32    sta $32
F7AE: 60       rts

F7B7: AD 03 10 lda dsw1_1003
F7BA: 10 05    bpl $f7c1
F7BC: A5 4C    lda $4c
F7BE: 4A       lsr a
F7BF: A8       tay
F7C0: 60       rts
F7C1: A4 4C    ldy $4c
F7C3: B9 42 00 lda $0042, y
F7C6: A8       tay
F7C7: 60       rts
F7C8: 20 2F EC jsr $ec2f
F7CB: 48       pha
F7CC: 18       clc
F7CD: 69 1B    adc #$1b
F7CF: 20 80 EE jsr $ee80
F7D2: 68       pla
F7D3: C9 04    cmp #$04
F7D5: D0 14    bne $f7eb
F7D7: A9 0F    lda #$0f
F7D9: 20 DC ED jsr $eddc
F7DC: A9 10    lda #$10
F7DE: 20 DC ED jsr $eddc
F7E1: A9 11    lda #$11
F7E3: 20 DC ED jsr $eddc
F7E6: A9 12    lda #$12
F7E8: 20 DC ED jsr $eddc
F7EB: 60       rts
F7EC: A0 03    ldy #$03
F7EE: AD 03 10 lda dsw1_1003
F7F1: 10 02    bpl $f7f5
F7F3: A0 01    ldy #$01
F7F5: B9 2E 02 lda $022e, y
F7F8: 88       dey
F7F9: 39 2E 02 and $022e, y
F7FC: 88       dey
F7FD: 10 FA    bpl $f7f9
F7FF: 29 F0    and #$f0
F801: 48       pha
F802: AD 03 10 lda dsw1_1003
F805: 49 FF    eor #$ff
F807: 4A       lsr a
F808: 4A       lsr a
F809: 4A       lsr a
F80A: 4A       lsr a
F80B: 29 03    and #$03
F80D: A8       tay
F80E: 68       pla
F80F: 39 13 F8 and $f813, y
F812: 60       rts


table_5d2d:
	dc.w	$5d41	; $5d2d
	dc.w	$5d41	; $5d2f
	dc.w	$5d65	; $5d31
	dc.w	$5d72	; $5d33
	dc.w	$5d72	; $5d35
	dc.w	$5d7a	; $5d37
	dc.w	$5de3	; $5d39
	dc.w	$5e07	; $5d3b
	dc.w	$5e1a	; $5d3d
	dc.w	$5e2d	; $5d3f
	dc.w	$6820	; $5d41
table_5eb0:
	dc.w	$5ee4	; $5eb0
	dc.w	$5ee4	; $5eb2
	dc.w	$5ee4	; $5eb4
	dc.w	$5ee4	; $5eb6
	dc.w	$5ed0	; $5eb8
	dc.w	$5ed0	; $5eba
	dc.w	$5e5c	; $5ebc
	dc.w	$5eda	; $5ebe
	dc.w	$5ee9	; $5ec0
	dc.w	$5eda	; $5ec2
	dc.w	$5ead	; $5ec4
	dc.w	$5efd	; $5ec6
	dc.w	$5f19	; $5ec8
	dc.w	$5eda	; $5eca
	dc.w	$5f32	; $5ecc
	dc.w	$5eda	; $5ece
table_633a:
	dc.w	$6362	; $633a
	dc.w	$6381	; $633c
	dc.w	$6388	; $633e
	dc.w	$638f	; $6340
	dc.w	$6396	; $6342
	dc.w	$639d	; $6344
	dc.w	$63b3	; $6346
	dc.w	$63c5	; $6348
	dc.w	$63d4	; $634a
	dc.w	$63fe	; $634c
	dc.w	$6337	; $634e
	dc.w	$6422	; $6350
	dc.w	$6453	; $6352
	dc.w	$647d	; $6354
	dc.w	$63d4	; $6356
	dc.w	$63fe	; $6358
	dc.w	$6498	; $635a
	dc.w	$649f	; $635c
	dc.w	$64a6	; $635e
	dc.w	$64ad	; $6360
table_66ee:
	dc.w	$67d9	; $66ee
	dc.w	$67c7	; $66f0
	dc.w	$67b4	; $66f2
	dc.w	$6775	; $66f4
	dc.w	$6775	; $66f6
	dc.w	$67c7	; $66f8
	dc.w	$688f	; $66fa
	dc.w	$6809	; $66fc
	dc.w	$6809	; $66fe
	dc.w	$67c7	; $6700
	dc.w	$6809	; $6702
	dc.w	$6809	; $6704
	dc.w	$67c7	; $6706
	dc.w	$67c7	; $6708
	dc.w	$67c7	; $670a
	dc.w	$6727	; $670c
	dc.w	$6727	; $670e
	dc.w	$67c7	; $6710
	dc.w	$67c7	; $6712
	dc.w	$67c7	; $6714
table_6a05:
	dc.w	$6a18	; $6a05
	dc.w	$6af8	; $6a07
	dc.w	$6a11	; $6a09
	dc.w	$6a11	; $6a0b
	dc.w	$6a11	; $6a0d
	dc.w	$6a2b	; $6a0f
table_6bba:
	dc.w	$6bb7	; $6bba
	dc.w	$6bb7	; $6bbc
	dc.w	$6bfe	; $6bbe
	dc.w	$6d7d	; $6bc0
	dc.w	$6bfe	; $6bc2
	dc.w	$6c19	; $6bc4
	dc.w	$6c4f	; $6bc6
	dc.w	$6bae	; $6bc8
	dc.w	$6bb7	; $6bca
	dc.w	$6bb7	; $6bcc
	dc.w	$6bfe	; $6bce
	dc.w	$6bfe	; $6bd0
	dc.w	$6bfe	; $6bd2
	dc.w	$6bb7	; $6bd4
	dc.w	$6bb7	; $6bd6
	dc.w	$6bb7	; $6bd8
	dc.w	$6bb7	; $6bda
	dc.w	$6bb7	; $6bdc
	dc.w	$6bb7	; $6bde
	dc.w	$6e23	; $6be0
	dc.w	$6e23	; $6be2
	dc.w	$6d7d	; $6be4
	dc.w	$6da0	; $6be6
	dc.w	$6bb7	; $6be8
	dc.w	$6bb7	; $6bea
	dc.w	$6c93	; $6bec
	dc.w	$6c93	; $6bee
	dc.w	$6e23	; $6bf0
	dc.w	$6e23	; $6bf2
	dc.w	$6e23	; $6bf4
	dc.w	$6bb7	; $6bf6
	dc.w	$6bb7	; $6bf8
	dc.w	$6bb7	; $6bfa
	dc.w	$6bb7	; $6bfc
table_707a:
	dc.w	$70a6	; $707a
	dc.w	$70a6	; $707c
	dc.w	$70cb	; $707e
	dc.w	$7178	; $7080
	dc.w	$7209	; $7082
	dc.w	$7289	; $7084
	dc.w	$7322	; $7086
	dc.w	$740a	; $7088
	dc.w	$7547	; $708a
	dc.w	$76b0	; $708c
	dc.w	$786d	; $708e
	dc.w	$786d	; $7090
	dc.w	$79b2	; $7092
	dc.w	$79b2	; $7094
	dc.w	$79b2	; $7096
	dc.w	$7d60	; $7098
	dc.w	$7df1	; $709a
	dc.w	$7eeb	; $709c
	dc.w	$7eff	; $709e
	dc.w	$7f13	; $70a0
table_7345:
	dc.w	table_7345	; $7345
	dc.w	$738c	; $7347
	dc.w	$7391	; $7349
	dc.w	$7396	; $734b
table_7430:
	dc.w	table_7430	; $7430
	dc.w	$7444	; $7432
	dc.w	$74a2	; $7434
	dc.w	$74a7	; $7436
	dc.w	$74ae	; $7438
table_756d:
	dc.w	table_756d	; $756d
	dc.w	$75a6	; $756f
	dc.w	$75ab	; $7571
	dc.w	$75fa	; $7573
	dc.w	$75ff	; $7575
	dc.w	$760b	; $7577
table_76d6:
	dc.w	table_76d6	; $76d6
	dc.w	$7727	; $76d8
	dc.w	$772c	; $76da
	dc.w	$7785	; $76dc
	dc.w	$778a	; $76de
	dc.w	$778f	; $76e0
	dc.w	$7840	; $76e2
table_788d:
	dc.w	table_788d	; $788d
	dc.w	$78e4	; $788f
	dc.w	$78e4	; $7891
	dc.w	$7909	; $7893
	dc.w	$7909	; $7895
table_79da:
	dc.w	table_79da	; $79da
	dc.w	$7ae5	; $79dc
	dc.w	$7b16	; $79de
	dc.w	$7b23	; $79e0
	dc.w	$7b35	; $79e2
	dc.w	$7b42	; $79e4
	dc.w	$7aae	; $79e6
	dc.w	$7aae	; $79e8
	dc.w	$7d45	; $79ea
table_7f44:
	dc.w	table_7f44	; $7f44
	dc.w	$7f66	; $7f46
	dc.w	$7f75	; $7f48
	dc.w	$7f85	; $7f4a
table_871d:
	dc.w	$873d	; $871d
	dc.w	$876c	; $871f
	dc.w	$87a6	; $8721
	dc.w	$873d	; $8723
	dc.w	$876c	; $8725
	dc.w	$87a6	; $8727
	dc.w	$873d	; $8729
	dc.w	$876c	; $872b
	dc.w	$87a6	; $872d
	dc.w	$87d5	; $872f
	dc.w	$87d5	; $8731
	dc.w	$87d5	; $8733
	dc.w	$87d5	; $8735
	dc.w	$87d5	; $8737
	dc.w	$87d5	; $8739
	dc.w	$87d5	; $873b
table_918a:
	dc.w	$9210	; $918a
	dc.w	$9210	; $918c
	dc.w	$9210	; $918e
	dc.w	$9256	; $9190
	dc.w	$9256	; $9192
	dc.w	$9256	; $9194
	dc.w	$9286	; $9196
	dc.w	$9286	; $9198
	dc.w	$9286	; $919a
	dc.w	$9337	; $919c
	dc.w	$93a2	; $919e
	dc.w	$93a2	; $91a0
	dc.w	$94f5	; $91a2
	dc.w	$953b	; $91a4
	dc.w	$955a	; $91a6
	dc.w	$960f	; $91a8
	dc.w	$964a	; $91aa
	dc.w	$96e9	; $91ac
	dc.w	$984e	; $91ae
	dc.w	$9872	; $91b0
	dc.w	$9872	; $91b2
	dc.w	$9970	; $91b4
	dc.w	$9970	; $91b6
	dc.w	$998a	; $91b8
	dc.w	$99ab	; $91ba
	dc.w	$99df	; $91bc
	dc.w	$9a22	; $91be
	dc.w	$9a22	; $91c0
	dc.w	$9a22	; $91c2
	dc.w	$9a58	; $91c4
	dc.w	$9ac6	; $91c6
	dc.w	$9ad4	; $91c8
	dc.w	$9ae5	; $91ca
	dc.w	$9afe	; $91cc
	dc.w	$9b0f	; $91ce
	dc.w	$9bb2	; $91d0
	dc.w	$9bda	; $91d2
table_92ea:
	dc.w	$92f0	; $92ea
	dc.w	$930e	; $92ec
	dc.w	$932e	; $92ee
table_a30e:
	dc.w	$a328	; $a30e
	dc.w	$a328	; $a310
	dc.w	$a328	; $a312
	dc.w	$a328	; $a314
	dc.w	$a328	; $a316
	dc.w	$a328	; $a318
	dc.w	$a328	; $a31a
	dc.w	$a4b2	; $a31c
	dc.w	$a4b2	; $a31e
	dc.w	$a514	; $a320
	dc.w	$a591	; $a322
	dc.w	$a591	; $a324
	dc.w	$a591	; $a326
table_a3d3:
	dc.w	$a3e1	; $a3d3
	dc.w	$a3ee	; $a3d5
	dc.w	$a3fd	; $a3d7
	dc.w	$a400	; $a3d9
	dc.w	$a403	; $a3db
	dc.w	$a406	; $a3dd
	dc.w	$a415	; $a3df
table_a65e:
	dc.w	$a668	; $a65e
	dc.w	$a6a8	; $a660
	dc.w	$a6a8	; $a662
	dc.w	$a6a8	; $a664
	dc.w	$a6a8	; $a666
table_a749:
	dc.w	$a751	; $a749
	dc.w	$a791	; $a74b
	dc.w	$a7b8	; $a74d
	dc.w	$a816	; $a74f
table_b7a7:
	dc.w	$b7b9	; $b7a7
	dc.w	$b7b9	; $b7a9
	dc.w	$b7e7	; $b7ab
	dc.w	$b7e7	; $b7ad
	dc.w	$b7e7	; $b7af
	dc.w	$b7b7	; $b7b1
	dc.w	$b7b7	; $b7b3
	dc.w	$b884	; $b7b5
table_ba8c:
	dc.w	$baae	; $ba8c
	dc.w	$baae	; $ba8e
	dc.w	$baae	; $ba90
	dc.w	$baae	; $ba92
	dc.w	$baae	; $ba94
	dc.w	$baae	; $ba96
	dc.w	$baae	; $ba98
	dc.w	$baae	; $ba9a
	dc.w	$baae	; $ba9c
	dc.w	$baae	; $ba9e
	dc.w	$bbf5	; $baa0
	dc.w	$bbf5	; $baa2
	dc.w	$baae	; $baa4
	dc.w	$baae	; $baa6
	dc.w	$baae	; $baa8
	dc.w	$bc11	; $baaa
	dc.w	$bc97	; $baac
	dc.w	$e0ad	; $baae
	dc.w	$c903	; $bab0
table_be61:
	dc.w	$c50e	; $be61
	dc.w	$c466	; $be63
	dc.w	$be8a	; $be65
	dc.w	$c05c	; $be67
	dc.w	$c05c	; $be69
	dc.w	$c05c	; $be6b
	dc.w	$c05c	; $be6d
	dc.w	$c05c	; $be6f
	dc.w	$c05c	; $be71
	dc.w	$c05c	; $be73
	dc.w	$c05c	; $be75
	dc.w	$c05c	; $be77
	dc.w	$c05c	; $be79
	dc.w	$c4dd	; $be7b
	dc.w	$bf15	; $be7d
	dc.w	$be83	; $be7f
	dc.w	$be8a	; $be81
