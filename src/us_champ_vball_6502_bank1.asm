79B9: B5 65    lda $65, x
79BB: 0A       asl a
79BC: A8       tay
79BD: B9 2C 7D lda $7d2c, y
79C0: 85 1B    sta $1b
79C2: B9 2D 7D lda $7d2d, y
79C5: 85 1C    sta $1c
79C7: B5 73    lda $73, x
79C9: 29 7F    and #$7f
79CB: 0A       asl a
79CC: A8       tay
79CD: B1 1B    lda ($1b), y
79CF: 85 10    sta $10
79D1: C8       iny
79D2: B1 1B    lda ($1b), y
79D4: 85 11    sta $11
79D6: 20 DD 79 jsr $79dd
79D9: 20 5C 7A jsr $7a5c
79DC: 60       rts
79DD: B5 9D    lda $9d, x
79DF: 85 04    sta $04
79E1: B5 8F    lda $8f, x
79E3: 48       pha
79E4: B5 73    lda $73, x
79E6: 30 0D    bmi $79f5
79E8: A0 03    ldy #$03
79EA: 68       pla
79EB: 38       sec
79EC: F1 10    sbc ($10), y
79EE: 48       pha
79EF: A5 04    lda $04
79F1: E9 00    sbc #$00
79F3: 85 04    sta $04
79F5: 68       pla
79F6: 85 03    sta $03
79F8: A0 00    ldy #$00
79FA: B1 10    lda ($10), y
79FC: 48       pha
79FD: B5 73    lda $73, x
79FF: 30 09    bmi $7a0a
7A01: 68       pla
7A02: 49 FF    eor #$ff
7A04: 18       clc
7A05: 69 01    adc #$01
7A07: 4C 0B 7A jmp $7a0b
7A0A: 68       pla
7A0B: 29 FF    and #$ff
7A0D: 18       clc
7A0E: 08       php
7A0F: 65 03    adc $03
7A11: 85 03    sta $03
7A13: A5 04    lda $04
7A15: 69 00    adc #$00
7A17: 28       plp
7A18: 10 03    bpl $7a1d
7A1A: 18       clc
7A1B: 69 FF    adc #$ff
7A1D: 85 04    sta $04
7A1F: A0 01    ldy #$01
7A21: B1 10    lda ($10), y
7A23: 18       clc
7A24: 08       php
7A25: 75 B9    adc $b9, x
7A27: 85 05    sta $05
7A29: B5 C7    lda $c7, x
7A2B: 69 00    adc #$00
7A2D: 28       plp
7A2E: 10 03    bpl $7a33
7A30: 18       clc
7A31: 69 FF    adc #$ff
7A33: 85 06    sta $06
7A35: A0 02    ldy #$02
7A37: B1 10    lda ($10), y
7A39: 18       clc
7A3A: 08       php
7A3B: 75 E3    adc $e3, x
7A3D: 85 07    sta $07
7A3F: B5 F1    lda $f1, x
7A41: 69 00    adc #$00
7A43: 28       plp
7A44: 10 03    bpl $7a49
7A46: 18       clc
7A47: 69 FF    adc #$ff
7A49: 85 08    sta $08
7A4B: A0 03    ldy #$03
7A4D: B1 10    lda ($10), y
7A4F: 85 00    sta $00
7A51: C8       iny
7A52: B1 10    lda ($10), y
7A54: 85 01    sta $01
7A56: C8       iny
7A57: B1 10    lda ($10), y
7A59: 85 02    sta $02
7A5B: 60       rts
7A5C: A5 93    lda $93
7A5E: 38       sec
7A5F: E5 03    sbc $03
7A61: AA       tax
7A62: A5 A1    lda $a1
7A64: E5 04    sbc $04
7A66: 90 43    bcc $7aab
7A68: 8A       txa
7A69: A0 03    ldy #$03
7A6B: D1 10    cmp ($10), y
7A6D: B0 3C    bcs $7aab
7A6F: A5 06    lda $06
7A71: 10 10    bpl $7a83
7A73: A5 05    lda $05
7A75: 18       clc
7A76: 65 01    adc $01
7A78: 85 1B    sta $1b
7A7A: A5 BD    lda $bd
7A7C: C5 1B    cmp $1b
7A7E: B0 2B    bcs $7aab
7A80: 4C 96 7A jmp $7a96
7A83: A5 BD    lda $bd
7A85: 38       sec
7A86: E5 05    sbc $05
7A88: AA       tax
7A89: A5 CB    lda $cb
7A8B: E5 06    sbc $06
7A8D: 90 1C    bcc $7aab
7A8F: 8A       txa
7A90: A0 04    ldy #$04
7A92: D1 10    cmp ($10), y
7A94: B0 15    bcs $7aab
7A96: A5 E7    lda $e7
7A98: 38       sec
7A99: E5 07    sbc $07
7A9B: AA       tax
7A9C: A5 F5    lda $f5
7A9E: E5 08    sbc $08
7AA0: 90 09    bcc $7aab
7AA2: 8A       txa
7AA3: A0 05    ldy #$05
7AA5: D1 10    cmp ($10), y
7AA7: B0 02    bcs $7aab
7AA9: 38       sec
7AAA: 60       rts
7AAB: 18       clc
7AAC: 60       rts

7AAD: 8A       txa
7AAE: 48       pha
7AAF: 98       tya
7AB0: 48       pha
7AB1: BD 3F 03 lda $033f, x
7AB4: C9 10    cmp #$10
7AB6: 90 03    bcc $7abb
7AB8: 4C 3C 7B jmp $7b3c
7ABB: B5 65    lda $65, x
7ABD: 0A       asl a
7ABE: A8       tay
7ABF: B9 70 7E lda $7e70, y
7AC2: 85 1B    sta $1b
7AC4: B9 71 7E lda $7e71, y
7AC7: 85 1C    sta $1c
7AC9: B5 73    lda $73, x
7ACB: 29 7F    and #$7f
7ACD: 0A       asl a
7ACE: A8       tay
7ACF: B1 1B    lda ($1b), y
7AD1: 85 10    sta $10
7AD3: C8       iny
7AD4: B1 1B    lda ($1b), y
7AD6: 85 11    sta $11
7AD8: 20 41 7B jsr $7b41
7ADB: A5 00    lda $00
7ADD: 48       pha
7ADE: A5 02    lda $02
7AE0: 48       pha
7AE1: A5 03    lda $03
7AE3: 48       pha
7AE4: A5 04    lda $04
7AE6: 48       pha
7AE7: A5 07    lda $07
7AE9: 48       pha
7AEA: A5 08    lda $08
7AEC: 48       pha
7AED: A2 04    ldx #$04
7AEF: A9 16    lda #$16
7AF1: 0A       asl a
7AF2: A8       tay
7AF3: B9 70 7E lda $7e70, y
7AF6: 85 1B    sta $1b
7AF8: B9 71 7E lda $7e71, y
7AFB: 85 1C    sta $1c
7AFD: B5 73    lda $73, x
7AFF: 29 7F    and #$7f
7B01: 0A       asl a
7B02: A8       tay
7B03: B1 1B    lda ($1b), y
7B05: 85 10    sta $10
7B07: C8       iny
7B08: B1 1B    lda ($1b), y
7B0A: 85 11    sta $11
7B0C: 20 41 7B jsr $7b41
7B0F: A5 00    lda $00
7B11: 85 0A    sta $0a
7B13: A5 02    lda $02
7B15: 85 0B    sta $0b
7B17: A5 03    lda $03
7B19: 85 0C    sta $0c
7B1B: A5 04    lda $04
7B1D: 85 0D    sta $0d
7B1F: A5 07    lda $07
7B21: 85 0E    sta $0e
7B23: A5 08    lda $08
7B25: 85 0F    sta $0f
7B27: A0 05    ldy #$05
7B29: 68       pla
7B2A: 99 04 00 sta $0004, y
7B2D: 88       dey
7B2E: 10 F9    bpl $7b29
7B30: A6 4C    ldx $4c
7B32: 20 A5 7B jsr $7ba5
7B35: 90 05    bcc $7b3c
7B37: A6 4C    ldx $4c
7B39: 20 F3 7B jsr $7bf3
7B3C: 68       pla
7B3D: A8       tay
7B3E: 68       pla
7B3F: AA       tax
7B40: 60       rts
7B41: B5 9D    lda $9d, x
7B43: 85 04    sta $04
7B45: B5 8F    lda $8f, x
7B47: 48       pha
7B48: B5 73    lda $73, x
7B4A: 30 0D    bmi $7b59
7B4C: A0 02    ldy #$02
7B4E: 68       pla
7B4F: 38       sec
7B50: F1 10    sbc ($10), y
7B52: 48       pha
7B53: A5 04    lda $04
7B55: E9 00    sbc #$00
7B57: 85 04    sta $04
7B59: 68       pla
7B5A: 85 03    sta $03
7B5C: A0 00    ldy #$00
7B5E: B1 10    lda ($10), y
7B60: 48       pha
7B61: B5 73    lda $73, x
7B63: 30 09    bmi $7b6e
7B65: 68       pla
7B66: 49 FF    eor #$ff
7B68: 18       clc
7B69: 69 01    adc #$01
7B6B: 4C 6F 7B jmp $7b6f
7B6E: 68       pla
7B6F: 29 FF    and #$ff
7B71: 18       clc
7B72: 08       php
7B73: 65 03    adc $03
7B75: 85 03    sta $03
7B77: A5 04    lda $04
7B79: 69 00    adc #$00
7B7B: 28       plp
7B7C: 10 03    bpl $7b81
7B7E: 18       clc
7B7F: 69 FF    adc #$ff
7B81: 85 04    sta $04
7B83: A0 01    ldy #$01
7B85: B1 10    lda ($10), y
7B87: 18       clc
7B88: 08       php
7B89: 75 E3    adc $e3, x
7B8B: 85 07    sta $07
7B8D: B5 F1    lda $f1, x
7B8F: 69 00    adc #$00
7B91: 28       plp
7B92: 10 03    bpl $7b97
7B94: 18       clc
7B95: 69 FF    adc #$ff
7B97: 85 08    sta $08
7B99: A0 02    ldy #$02
7B9B: B1 10    lda ($10), y
7B9D: 85 00    sta $00
7B9F: C8       iny
7BA0: B1 10    lda ($10), y
7BA2: 85 02    sta $02
7BA4: 60       rts
7BA5: A0 00    ldy #$00
7BA7: A2 00    ldx #$00
7BA9: B5 0C    lda $0c, x
7BAB: 38       sec
7BAC: F5 06    sbc $06, x
7BAE: 85 02    sta $02
7BB0: B5 0D    lda $0d, x
7BB2: F5 07    sbc $07, x
7BB4: 85 03    sta $03
7BB6: 10 1C    bpl $7bd4
7BB8: 98       tya
7BB9: 18       clc
7BBA: 69 06    adc #$06
7BBC: A8       tay
7BBD: A5 02    lda $02
7BBF: 49 FF    eor #$ff
7BC1: 18       clc
7BC2: 69 01    adc #$01
7BC4: 85 02    sta $02
7BC6: 08       php
7BC7: A5 03    lda $03
7BC9: 49 FF    eor #$ff
7BCB: 85 03    sta $03
7BCD: 28       plp
7BCE: A5 03    lda $03
7BD0: 69 00    adc #$00
7BD2: 85 03    sta $03
7BD4: A5 02    lda $02
7BD6: 38       sec
7BD7: F9 04 00 sbc $0004, y
7BDA: 85 02    sta $02
7BDC: A5 03    lda $03
7BDE: E9 00    sbc #$00
7BE0: 10 0F    bpl $7bf1
7BE2: E8       inx
7BE3: E8       inx
7BE4: 98       tya
7BE5: 29 01    and #$01
7BE7: 18       clc
7BE8: 69 01    adc #$01
7BEA: A8       tay
7BEB: 29 01    and #$01
7BED: D0 BA    bne $7ba9
7BEF: 38       sec
7BF0: 60       rts
7BF1: 18       clc
7BF2: 60       rts
7BF3: AD E0 03 lda $03e0
7BF6: 0A       asl a
7BF7: 0A       asl a
7BF8: A8       tay
7BF9: B9 E8 7C lda $7ce8, y
7BFC: C9 FF    cmp #$ff
7BFE: D0 03    bne $7c03
7C00: 4C E7 7C jmp $7ce7
7C03: 48       pha
7C04: BD 1A 03 lda $031a, x
7C07: 29 7F    and #$7f
7C09: 9D 2F 03 sta $032f, x
7C0C: 68       pla
7C0D: 9D 1A 03 sta $031a, x
7C10: BD 0E 03 lda $030e, x
7C13: 09 40    ora #$40
7C15: 9D 0E 03 sta $030e, x
7C18: E6 53    inc $53
7C1A: A5 4C    lda $4c
7C1C: 8D 11 04 sta $0411
7C1F: 4A       lsr a
7C20: AA       tax
7C21: A5 4C    lda $4c
7C23: 49 01    eor #$01
7C25: 95 51    sta $51, x
7C27: A6 4C    ldx $4c
7C29: A9 30    lda #$30
7C2B: 20 83 FF jsr $ff83
7C2E: B9 E9 7C lda $7ce9, y
7C31: 9D 33 03 sta $0333, x
7C34: 8A       txa
7C35: 48       pha
7C36: A2 04    ldx #$04
7C38: 86 4C    stx $4c
7C3A: B9 EA 7C lda $7cea, y
7C3D: 20 80 FF jsr $ff80
7C40: 68       pla
7C41: 85 4C    sta $4c
7C43: AA       tax
7C44: B9 EB 7C lda $7ceb, y
7C47: 20 83 FF jsr $ff83
7C4A: AD 58 02 lda $0258
7C4D: 9D 54 02 sta $0254, x
7C50: A9 23    lda #$23
7C52: 85 56    sta $56
7C54: A5 4C    lda $4c
7C56: 29 02    and #$02
7C58: 0A       asl a
7C59: 0A       asl a
7C5A: 0A       asl a
7C5B: 05 56    ora $56
7C5D: 85 56    sta $56
7C5F: A9 40    lda #$40
7C61: 8D CD 02 sta $02cd
7C64: A9 00    lda #$00
7C66: 8D C0 02 sta $02c0
7C69: AD 72 02 lda $0272
7C6C: 49 FF    eor #$ff
7C6E: 18       clc
7C6F: 69 01    adc #$01
7C71: 8D 72 02 sta $0272
7C74: 08       php
7C75: AD 7F 02 lda $027f
7C78: 49 FF    eor #$ff
7C7A: 8D 7F 02 sta $027f
7C7D: 28       plp
7C7E: AD 7F 02 lda $027f
7C81: 69 00    adc #$00
7C83: 8D 7F 02 sta $027f
7C86: 18       clc
7C87: AD 7F 02 lda $027f
7C8A: 10 01    bpl $7c8d
7C8C: 38       sec
7C8D: 6E 7F 02 ror $027f
7C90: 6E 72 02 ror $0272
7C93: AD 8C 02 lda $028c
7C96: 49 FF    eor #$ff
7C98: 18       clc
7C99: 69 01    adc #$01
7C9B: 8D 8C 02 sta $028c
7C9E: 08       php
7C9F: AD 99 02 lda $0299
7CA2: 49 FF    eor #$ff
7CA4: 8D 99 02 sta $0299
7CA7: 28       plp
7CA8: AD 99 02 lda $0299
7CAB: 69 00    adc #$00
7CAD: 8D 99 02 sta $0299
7CB0: 18       clc
7CB1: AD 99 02 lda $0299
7CB4: 10 01    bpl $7cb7
7CB6: 38       sec
7CB7: 6E 99 02 ror $0299
7CBA: 6E 8C 02 ror $028c
7CBD: AD A6 02 lda $02a6
7CC0: 49 FF    eor #$ff
7CC2: 18       clc
7CC3: 69 01    adc #$01
7CC5: 8D A6 02 sta $02a6
7CC8: 08       php
7CC9: AD B3 02 lda $02b3
7CCC: 49 FF    eor #$ff
7CCE: 8D B3 02 sta $02b3
7CD1: 28       plp
7CD2: AD B3 02 lda $02b3
7CD5: 69 00    adc #$00
7CD7: 8D B3 02 sta $02b3
7CDA: 18       clc
7CDB: AD B3 02 lda $02b3
7CDE: 10 01    bpl $7ce1
7CE0: 38       sec
7CE1: 6E B3 02 ror $02b3
7CE4: 6E A6 02 ror $02a6
7CE7: 60       rts

; entrypoints to bank 1 code
7FF0: 4C B9 79 jmp $79b9
7FF3: 4C AD 7A jmp $7aad

