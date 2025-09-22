from tools_shared import *

# post-conversion automatic patches, allowing not to change the asm file by hand
# when everything is stable, I use to stop using 6502 source as source, and work on the 68k file
# directly (to remove PUSH_SR...) but not too soon. It allows to change generation type, fix conversion bugs
# until only the optimizations remain (the non-optimized code generated from 6502+post processing is still correct)

# there are theoretical carry issues in B76D B7C8 B801 but the error compensates thanks to the subsequent adds
# that reset X flag, so atm no need to fix anything there.

routines_to_check_for_carry = set()

input_read_dict = {
"p1_1000":"read_p1_inputs",
"p2_1001":"read_p2_inputs",
"p3_1005":"",
"p4_1006":"",   # no P3 and P4
"system_1002":"read_system",
"dsw1_1003":"read_dsw1",
"dsw2_1004":"read_dsw2",

}

input_write_dict = {
"irq_ack_100a":"",
"irq_ack_100b":"",
"p1_1000":"",
"p2_1001":"",
"p3_1005":"",
"p4_1006":"",   # no P3 and P4
"sound_100d":"sound_start",   # sound_start
"bankswitch_1009":"set_bank",
"scrollx_lo_100c":"set_scrollx_lo",
"scrolly_lo_100e":"set_scrolly_lo",
"scrollx_hi_1008":"set_scrollx_hi",
}
routines_returning_carry = {
            0x5f68,   # very simple
            0x5f73,   # 4x fixed as there's 2 rts that rely on cmp result (uninverted!)
            0x6274,   # very simple
            0x6037,   # very simple
            0x60be,   # inverted flags in the end
            0x6280,   # inverted flags in the end
            0x6268,   # very simple
            0x60f5,   # very simple
            0x60fe,   # very simple
            0x610f,   # inverted flags in the end
            0x618f,   # very simple
            0x61be,   # inverted flags in the end
            0x625d,   # very simple
            0x8229,   # complex but explict C flag set/clr in the end
            0x827d,   # very simple
            0x8289,   # very simple
            0x8296,   # complex but explict C flag set/clr in the end
            0x82ea,   # very simple
            0x82f9,   # very simple
            0x8323,   # very simple
            0x832f,   # very simple
            0x8350,  # very simple
            0x835e,  # very simple
            0x8369,  # very simple
            0x83a0,  # big but explict C flag set/clr in the end
            0x83e0,  # simple
            0x83fa,  # complex but ok
            0x8429,  # very simple
            0x843e,  # big but one exit with SET/CLR
            0x846b,  # big but one exit with SET/CLR
            0x90b0,  # simple
            0x90c9,  # complex but ok
            0x90f3,  # simple
            0x91d8,  # fixed to de-optimize clc+bcc
            0xa0e4,  # fixed to de-optimize sec+bcs
            0xa215,  # complex but ok
            0xb17c,  # complex but ok
            0xb2ed,  # very complex with jump to b1e8 but OK
            0xb394,  # complex with a jump to b1e8 but OK
            0xb40f,  # fixed to clear carry after cmp + rts in b429
            0xb42a,  # fixed to de-optimize sec+bcs
            }

def get_line_address(line):
    try:
        toks = line.split("|")
        address = toks[1].strip(" [$").split(":")[0]
        return int(address,16)
    except (ValueError,IndexError):
        return None

nb_errors = 0

# if code is generated without optimizations, turn this off!!
optimizer_on = True

# various dirty but at least automatic patches applying on the specific track and field code
with open(source_dir / "conv.s") as f:
    lines = list(f)
    i = 0

    while i < len(lines):
        line = lines[i]
        line_address = get_line_address(line)

        if " = " in line:
            equates.append(line.replace("$","0x"))
            line = ""

        if optimizer_on and "optimized clc+bcc" in line:
            # de-optimize clc+bcc as C is tested on return!
            line = "\tCLR_XC_FLAGS   | needed when returning\n"
        if optimizer_on and "optimized sec+bcs" in line:
            # de-optimize sec+bcs as C is tested on return!
            line = "\tSET_XC_FLAGS   | needed when returning\n"

        if "[jump_to_callback]" in line:
            line = change_instruction("jra\tcallback_0000",lines,i)

        if re.search("GET_ADDRESS\t\w*jump_table",line):
            index = "X" if ", x" in line or ",x" in line else "Y"
            line = line.replace("GET_ADDRESS",f"PUSH_TABLE_{index}_ADDRESS")
            lines[i+1] = ""

        if optimizer_on and line_address == 0xbdd5:
            line = "\tSET_X_FROM_CLEARED_C\n"+line

        if line_address in {0x6582,0Xbde4}:
            line = "\tSET_C_FROM_X\n"+line
            lines[i+1] = remove_error(lines[i+1])

        if line_address == 0xd020:
            # in random generator (so no biggie but...)
            # avoid dey to change X flag
            line = "\tPUSH_SR  | preserve X\n"+line+"\tPOP_SR  | restore X\n\ttst.b\td2   | check Z\n"
        if line_address == 0xe1f7:
            # addq will trash carry: swap independent instructions that will work too
            line,lines[i-1] = lines[i-1],line

        #########################################
        # this part is tricky as the tests rely on carry
        # but after that the ROL instructions also rely on carry
        #########################################
        if line_address in {0xd04b,0xd0a9}:
            lines[i-3] = "\tscs\td6\n"+lines[i-3]
        if line_address in {0xd04e,0xd0ac}:
            line = "\tCLR_XC_FLAGS\n\ttst.b\td6  | clear carry/x then test 'carry'\n"+line.replace("cc\tl","eq\tl")
        if optimizer_on and line_address in {0xd059,0xd0b7}:
            # carry clear tested above, just branch
            # but before, set carry/X again

            line = "\tSET_XC_FLAGS   | re-set carry/X then unconditional branch\n"+line.replace("cs\tl","ra\tl")
            lines[i+1] = remove_error(lines[i+1])
        #################################################

        if line_address in [0xd92b,0xd939]:
            # disable port 3/4, put zero
            line = change_instruction("clr.b\td0",lines,i)

        if line_address in [0x916d,0xbdda]:
            # jumping to bank 1!
            line = line.replace("l_7","b1_7")

        if line_address == 0xf6db:
            # credit decrease uses decimal mode too. We're going to decrease 1 credit
            # so nevermind the value of coin per credit
            lines[i-2] = remove_error(lines[i-2])
            lines[i-1] = change_instruction("moveq\t#1,d4",lines,i-1)
            line = change_instruction("sbcd\td4,d0",lines,i)

        if line_address == 0xf155:
            # remove set carry as it's BCD
            line = remove_instruction(lines,i)

        # time decrease (tricky because of bcd shit)
        if line_address == 0xe703:
            line = remove_error(line)
        elif line_address == 0xe704:
            line = remove_instruction(lines,i)
        elif line_address == 0xe707:
            # decimal mode still active from somewhere, converter didn't see it
            # so timer goes berzerk
            line = "\tmoveq\t#1,d4\n"+change_instruction("sbcd\td4,d0",lines,i)
        elif line_address == 0xe70c:
            # plus condition => carry as sbcd goes from 00 to 99 without negative
            # (negative is not defined in sbcd)
            line = change_instruction("jcc\tl_e71c",lines,i)

        if line_address == 0xf6b6:
            # plus condition => carry as sbcd goes from 00 to 99 without negative
            # (negative is not defined in sbcd)
            line = change_instruction("jcc\tl_f6bb",lines,i)

        ######################################################
        # those 2 changes are designed to save overflow flag after a bit instruction
        # as the overflow is checked not immediately after the bit instruction
        if line_address in [0xe06d,0xe0b1,0xe287,0xe2ca]:
            line = "\tPUSH_SR   | save overflow flag\n"+line

        if line_address in [0xe074,0xe0d1,0xe28e,0xe2e7]:
            line = "\tPOP_SR   | from bit, for bvc\n"+line
            lines[i+1] = remove_error(lines[i+1])
        ######################################################

        if line.startswith("l_7ff0:") or line.startswith("l_7ff3:"):
            # remove those confusing labels
            line = ""

        if optimizer_on and line_address in {0xeb09,0x88ac,0x8f51,0xac9a,0xbb78,0xbca3,0xbcbc,0xc6a9,0xe3f3,0xea98}:
            # restore SBC
            line = change_instruction("SET_XC_FLAGS",lines,i)
            lines[i+1] = lines[i+1].replace("sub.b\t#","SBC_IMM\t").replace(",d0","").rstrip()+" [do not optimize sub!]\n"

        if line_address == 0xeed1:
            line = change_instruction("jbsr\tescape_from_irq",lines,i)
            # remove rest of escape interrupt code, return to normal irq return
            for j in range(i+1,len(lines)):
                if lines[j].startswith("l_eedb:"):
                    break
                lines[j] = remove_instruction(lines,j)
                if "_SR" in lines[j]:
                    lines[j]=""

        if line.startswith("pseudo_random_d00a:"):
            line += """\t.ifne\tOPT_FIXED_RANDOM\n
\tmove.b #OPT_FIXED_RANDOM_VALUE,d0
\trts
\t.endif
"""
        if optimizer_on and line_address in {0x603e,0x606f,0x618e,0x60f4,0x61de,0x60ea,0x62a3}:
            # cmp + rts
            line = "\tINVERT_XC_FLAGS\n"+line
            lines[i+1] = remove_error(lines[i+1])
        if line_address in {0xf79b}:
            # remove ERROR directive, false alarm
            lines[i+1] = remove_error(lines[i+1])

        if line_address == 0xd88f:
            # disable flip screen code
            line = change_instruction("rts",lines,i)

        if optimizer_on and line_address in {0x5f78,0x5f7f,0x600b,0x6034}:  # line of bcc
            # invert flags in l_5f73 as C is used in function return
            lines[i-1] = ""   # remove comment
            line = "\tINVERT_XC_FLAGS\n"+line.replace("bcs","bcc").replace("jcs","jcc")


        if optimizer_on and line_address in {0xe66b,0xe64a,0xe9c3}:
            # we changed addx to add, no need for clc aka CLEAR_XC_FLAGS
            line = remove_instruction(lines,i)

        ##################################################
        # sed removed and addx=>abcd
        if line_address in {0xf5f6}:
            line = line.replace("addx.b","abcd")
        if line_address in {0xf5ee}:
            line = remove_error(line)
        #################################################

        if line_address == 0x6f2c:
            # addx should be add, even if carry is probably out
            lines[i+2] = lines[i+2].replace("addx.b","add.b")

        if line_address in {0xe64d,0xe66e}:
            # just in case X is set by addq above
            lines[i+2] = lines[i+2].replace("addx","add")

        if line_address in {0xeefe,0xeef9,0xeefc,0xeea4}:
            line = remove_instruction(lines,i)
        if line_address == 0xf12d:
            lines[i-2] = remove_error(lines[i-2])
            line = change_instruction("moveq\t#1,d4",lines,i)
            lines[i+1] = change_instruction("sbcd\td4,d0",lines,i+1)

        if line_address in {0xc8bf,0xc8ca,0Xcab9,0xe964,0xe9d6,
        0xec00,0xb0cd,0xb3c3,0xec52,0xecc5,0xed23,0xee01,0xf773}:
            # remove ERROR directive just after a tst
            lines[i-1] = remove_error(lines[i-1])

        if optimizer_on and line_address in {0xb914,0x8f6f}:
            # useless cmp #0 => tst
            lines[i-1] = remove_error(lines[i-1])
            line = remove_instruction(lines,i)

##        if "insert SET_X_FROM_CLEARED_C" in line:
##            line = "\tSET_X_FROM_CLEARED_C\n"

        # cheat: left side wins the current match whatever the outcome on the ball
        if line_address == 0xf3b3:
            line = """\ttst.b\tleft_team_wins_now_flag
\tjeq\t0f
\tclr.b\tleft_team_wins_now_flag
\tmoveq\t#0,d0
\tmoveq\t#0,d1
\tOP_W_ON_ZP_ADDRESS\tmove,game_state_bits_46,d0
\tmove.b\t#MAX_SCORE,d0
0:
""" + line
        # cheat: start level
        if line_address == 0xeff9:
            line = change_instruction("move.b\tstart_level_flag,d0",lines,i)

        if line_address in {0xb4fd,0xd9ea,0xdaf9,0x8b7d,0x9903,0xa129,0x9689,0Xb4e8,0xd817,0x9767}:
            # X is valid from previous add/sub,asl..: copy X to C just before bcc/bcs
            line = "\tSET_C_FROM_X\n"+line
            lines[i+1] = remove_error(lines[i+1])

        # fix the error: cmp+bcxx (inverted condition) followed by sbc or adc (relying on carry!)
        if optimizer_on and line_address in {0x6dd0,0x6ef8,0x6f26,0x8b4a,0X8b7f,0xb86c,0xd117,0xda2a,0xf606,0xf781}:
            if "addx" not in line:
                # addx comes in 2 instructions, the second one should not invert flags!
                line = "\tINVERT_XC_FLAGS   | cmp optimization above inverted flags\n"+line
            lines[i+1] = remove_error(lines[i+1])

        if optimizer_on and line_address == 0xb429:
            # force clear C flag (cmp+rts)
            line = "\tCLR_XC_FLAGS\n"+line

##        if line_address == 0xEA74:
##            # reset scrolling
##            # probably useless / redundant in most cases
##            # but more importantly messes with map (Hawaii, Air Base)
##            # (not on real HW but on amiga with different screen update sync it does)
##            line = remove_instruction(lines,i)

        if line_address in {0xeedf,0xef0c}:
            # rti => rts
            line = change_instruction("rts",lines,i)

        if optimizer_on and line_address in {0x5f88,0x5f96,0x6199,0x6263}:
            # cmp + clc => no need for error
            lines[i-1] = remove_error(lines[i-1])

        if optimizer_on and line_address in {0xbe25,0xec48}:
            # cmp+push_sr + pop_sr+bne: ok!
            lines[i-1] = remove_error(lines[i-1])

        if optimizer_on and line_address in {0x6565,0x8b7b}:
            # store C in X
            lines[i-1] = "\tSET_X_FROM_CLEARED_C  | store flag for later\n"

        if optimizer_on and "stray bc" in line and "jbsr" in lines[i-2]:
            # the previous call sets carry, the bcc/bcs is not a problem
            # (well, it was on 9144 when clc+bcc was optimized to bra WITHOUT clc!!)
            toks = lines[i-2].split()
            addr = int(toks[1].split("_")[-1],16)
            # if routine is checked manually / fixed then remove error
            if addr in routines_returning_carry:
                line = remove_error(line)
            else:
                routines_to_check_for_carry.add(addr)

        if "unsupported transfer to stack register" in line:
            line = remove_error(line)

        if "indirect jmp" in line:
            line = ""
            lines[i+1] = change_instruction("rts",lines,i+1)  # proper address already on stack


        if "[disable]" in line:
            line = remove_instruction(lines,i)

        if "nop" in line.split():
            line = remove_instruction(lines,i)

##        elif "stray b" in line:
##            line = ""       # when disabling this, make sure that false alarms have been reviewed


##        if "unsupported return from interrupt" in line:
##            line = change_instruction("rts",lines,i)


        # pre-add video_address tag if we find a store instruction to an explicit 3000-3FFF address
        if store_to_video.search(line):
            line = line.rstrip() + " [video_address]\n"
        # pre-add bank_address tag if we find a read instruction to an explicit 4000-7FFF address
        if access_bank.search(line):
            line = line.rstrip() + " [bank_address]\n"


        if "[unchecked_address" in line:
            # give me the original instruction
            line = line.replace("_ADDRESS","_UNCHECKED_ADDRESS")
        if "[bank_address" in line:
            # give me the original instruction
            line = line.replace("_ADDRESS","_BANK_ADDRESS")
            line = line.replace("SBC_Y","SBC_Y_BANK")
        if "[video_address" in line:
            # give me the original instruction
            line = line.replace("_ADDRESS","_UNCHECKED_ADDRESS")

            vbd_macro =  "MAYBE_VIDEO_BYTE_DIRTY" if "[video_address_maybe]" in line else "VIDEO_BYTE_DIRTY"

            # if it's a write, insert a "VIDEO_DIRTY" macro after the write
            for j in range(i+1,len(lines)):
                next_line = lines[j]
                if "[...]" not in next_line:
                    break
                if ",(a0)" in next_line or "clr" in next_line:
                    lines[j] = next_line+f"\t{vbd_macro} | [...]\n"
                    break
                elif ",(a0,d2.w)" in next_line:
                    lines[j] = next_line+f"\tadd.w\td2,a0 | [...]\n\t{vbd_macro} | [...]\n"
                    break
                elif ",(a0,d1.w)" in next_line:
                    lines[j] = next_line+f"\tadd.w\td1,a0 | [...]\n\t{vbd_macro} | [...]\n"
                    break


        if line_address in [0xd854,0xf272,0xf29e]:
            # remove p3/p4 I/O
            for j in range(i,i+4):
                lines[j] = remove_instruction(lines,j)
            line = lines[i]

        if line_address in [0xd84c]:
            # and p1 / p2
            line = change_instruction("jbsr\tosd_read_p1_inputs",lines,i,False)
            lines[i-1] += "\tmove.b\td0,d4\n"
            lines[i+1] = change_instruction("and.b\td4,d0",lines,i+1,False)

        if line_address in [0xf26a,0xf296]:
            # and p1 / p2
            line = change_instruction("jbsr\tosd_read_p2_inputs",lines,i,False)
            lines[i-1] += "\tmove.b\td0,d4\n"
            lines[i+1] = change_instruction("and.b\td4,d0",lines,i+1,False)

        line = re.sub(tablere,subt,line)


        if "GET_ADDRESS" in line:
            val = line.split()[1]
            toks = line.split()
            if '|' in toks:
                original_inst = toks[toks.index('|')+2]
                input_dict = input_read_dict if original_inst in ["lda","bit"] else input_write_dict
                osd_call = input_dict.get(val)
                if osd_call is not None:
                    if input_dict == input_write_dict and original_inst != "sta":
                        print(f"Unsupported {original_inst} for I/O address: {line.strip()}")
                        i += 1
                        continue
                    if osd_call:
                        line = change_instruction(f"jbsr\tosd_{osd_call}",lines,i)
                        if original_inst == "bit":
                            # bit for those special locations doesn't require d0 to be changed
                            # it even requires it NOT to be changed by the syscall
                            # here we "cheat" by copying the result of the syscall in RAM, it works because
                            # ram is mapped here, since 0x1xxx is between RAM/sprite RAM and video ram but in
                            # some smaller memory models it would not work!
                            line = f"""\tmove.w\td0,-(a7)   | save d0
\tGET_ADDRESS\t{val}
"""+line+"""\tmove.b\td0,(a0)   | update in ram so we can use BIT
\tBIT\t(a0)
\tmovem.w\t(a7)+,d0   | restore d0, preserving BIT status flags
"""
                    else:
                        line = remove_instruction(lines,i)
                    lines[i+1] = remove_instruction(lines,i+1)
                    if "stx" in line:
                        line = f"\texg\td0,d1\n{line}\texg\td0,d1\n"
                    if "sty" in line:
                        line = f"\texg\td0,d2\n{line}\texg\td0,d2\n"
                if "read_dsw1" in line and "sta" in line.split():
                    line = remove_instruction(lines,i)
                if "read_dsw2" in line and "sta" in line.split():
                    line = change_instruction("jbsr\tosd_video_control",lines,i)

        elif "unsupported instruction rti" in line:
            line = change_instruction("rts",lines,i)
##        elif "unsupported instruction andcc" in line:
##            line = change_instruction("CLR_XC_FLAGS",lines,i)
        elif "jump_table" in line:
            m = jmpre.search(line)
            if m:
                ireg = m.group(2).upper()  # A or B
                inst = m.group(1).upper()
                reg = {"x":"A2","y":"A3"}[m.group(3)]
                rest = re.sub(".*\"","",line)
                line = f"\t{inst}_{ireg}_INDEXED\t{reg}{rest}"
        lines[i] = line
        i+=1

# merge/split lines so numbers match
lines = "".join(lines).splitlines(True)

header = """\t.include "data.inc"
\t.include "breakpoint.inc"
\t.global\tnmi_ee9e
\t.global\treset_eea1
\t.global\tirq_eea4
* game performs indirect jump to 0000
* sometimes it's a jump table, but sometimes it's
* an address that was set by the game as return callback
* there are 2 known addresses: callback_9280 and

    .macro  CB_CASE  msb,lsb
    cmp.w    #0x\lsb\msb,(a6)
    jne        0f
    clr.w     (a6)   | "ack" callback
    jra        callback_\msb\lsb
0:
    .endm
invalid_0000:
    BREAKPOINT  "invalid jump table entry"
    illegal

callback_0000:
    CB_CASE     93,e7
    CB_CASE     92,d1
    CB_CASE     9a,3d
    CB_CASE     99,f2
    CB_CASE     99,9d
    CB_CASE     92,80
    CB_CASE     92,37
    CB_CASE     95,15
    CB_CASE     95,8e
    CB_CASE     99,9d
    CB_CASE     99,be
    CB_CASE     9c,16
    BREAKPOINT    "callback 0000 unknown"
    rts

escape_from_irq:
    move.l #jump_eff5,d0
    jbra osd_set_irq_return_address

jump_eff5:
    lea stack_top,a7
    jra l_eff5
"""

for i,line in enumerate(lines,header.count("\n")):
    if "ERROR" in line:
        nb_errors += 1
        print(i+1,line,end="")

print(f"nb_errors: {nb_errors}")

if routines_to_check_for_carry:
    print(f"Check {len(routines_to_check_for_carry)} routines for proper C return code")
    for x in sorted(routines_to_check_for_carry):
        print(f"{x:04x}")

with open(source_dir / "data.inc","w") as fw:
    fw.writelines(equates)

with open(source_dir / "us_champ_vball.68k","w") as fw:
    fw.write(header)
    fw.writelines(lines)
    # add the bank 1 small code part
    fw.write('\n\t.include\t"us_champ_vball_bank1.68k"\n\n')