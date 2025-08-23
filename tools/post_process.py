from shared import *

# post-conversion automatic patches, allowing not to change the asm file by hand
# when everything is stable, I use to stop using 6502 source as source, and work on the 68k file
# directly (to remove PUSH_SR...) but not too soon. It allows to change generation type, fix conversion bugs
# until only the optimizations remain (the non-optimized code generated from 6502+post processing is still correct)


input_read_dict = {
"p1_1000":"read_p1_inputs",
"p2_1001":"read_p2_inputs",
"system_1002":"read_system",
"dsw1_1003":"read_dsw1",
"dsw2_1004":"read_dsw2",

}

input_write_dict = {
"irq_ack_100a":"",
"irq_ack_100b":"",
"sound_100d":"sound_start",   # sound_start
"bankswitch_1009":"set_bank",
"scrollx_lo_100c":"set_scrollx_lo",
"scrolly_lo_100e":"set_scrolly_lo",
"scrollx_hi_1008":"set_scrollx_hi",
}

def get_line_address(line):
    try:
        toks = line.split("|")
        address = toks[1].strip(" [$").split(":")[0]
        return int(address,16)
    except (ValueError,IndexError):
        return None

nb_errors = 0
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

        if "[jump_to_callback]" in line:
            line = change_instruction("jbsr\tcallback_0000",lines,i)

        if re.search("GET_ADDRESS\t\w*jump_table",line):
            index = "X" if ",x" in line else "Y"
            line = line.replace("GET_ADDRESS",f"PUSH_TABLE_{index}_ADDRESS")

            if line_address in {0xBE09,0xBA7F,0xB781,0xA73B,0XA650,0X8710,0x917c}:
                lines[i+1] = "\trts   | rest of the code is useless, just jump\n\n"
            else:
                lines[i+1] = ""

        if line_address == 0xbdd5:
            line = "\tSET_X_FROM_CLEARED_C\n"+line

        if line_address in {0x6582,0Xbde4}:
            line = "\tSET_C_FROM_X\n"+line
            lines[i+1] = remove_error(lines[i+1])

        if line_address in {0xd04b,0xd0a9}:
            lines[i-3] = "\tscs\td6\n"+lines[i-3]
        if line_address in {0xd04e,0xd0ac}:
            line = "\ttst.b\td6\n"+line.replace("cc\tl","eq\tl")
        if line_address in {0xd059,0xd0b7}:
            # carry clear tested above, just branch
            line = line.replace("cs\tl","ra\tl")
            lines[i+1] = remove_error(lines[i+1])

        if line_address in [0x916d,0xbdda]:
            # jumping to bank 1!
            line = line.replace("l_7","b1_7")


        if line.startswith("l_7ff0:") or line.startswith("l_7ff3:"):
            # remove those confusing labels
            line = ""

        if line_address in {0xeb09,0x88ac,0x8f51,0xac9a,0xbb78,0xbca3,0xbcbc,0xc6a9,0xe3f3,0xea98}:
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
\tmoveq #0,d0
\trts
\t.endif
"""
        if line_address in {0x603e,0x606f,0x618e,0x60f4,0x61de,0x60ea,0x62a3}:
            # cmp + rts
            line = "\tINVERT_XC_FLAGS\n"+line
            lines[i+1] = remove_error(lines[i+1])
        if line_address in {0xf79b}:
            # remove ERROR directive, false alarm
            lines[i+1] = remove_error(lines[i+1])

        if line_address == 0xd88f:
            # disable flip screen code
            line = change_instruction("rts",lines,i)

        if line_address == 0xe707:
            line = change_instruction("subq.b\t#1,d0",lines,i)
            lines[i+1]=""
            lines[i+3]=""
            lines[i-3]=""
            lines[i-2] = remove_instruction(lines,i-2)

        if line_address in {0xe66b,0xe64a,0xe9c3}:
            # we changed addx to add, no need for clc aka CLEAR_XC_FLAGS
            line = remove_instruction(lines,i)

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

        if line_address in {0xb914,0x8f6f}:
            # useless cmp #0 => tst
            lines[i-1] = remove_error(lines[i-1])
            line = remove_instruction(lines,i)

        if "insert SET_X_FROM_CLEARED_C" in line:
            line = "\tSET_X_FROM_CLEARED_C\n"

        if line_address in {0xb4fd,0xd9ea,0xdaf9,0x8b7d,0x9903,0xa129,0x9689,0Xb4e8,0xd817,0x9767}:
            # X is valid from previous add/sub,asl..: copy X to C just before bcc/bcs
            line = "\tSET_C_FROM_X\n"+line
            lines[i+1] = remove_error(lines[i+1])

        if line_address in {0xeedf,0xef0c}:
            # rti => rts
            line = change_instruction("rts",lines,i)

        if "stray bc" in line and "jbsr" in lines[i-2]:
            # the previous call sets carry, the bcc/bcs is not a problem
            line = remove_error(line)

        if "unsupported transfer to stack register" in line:
            line = remove_error(line)

        if "indirect jmp" in line:
            line = ""
            lines[i+1] = change_instruction("rts",lines,i+1)  # proper address already on stack


        if "[disable]" in line:
            line = remove_instruction(lines,i)

        elif "nop" in line.split():
            line = remove_instruction(lines,i)

##        elif "stray b" in line:
##            line = ""       # when disabling this, make sure that false alarms have been reviewed


##        if "unsupported return from interrupt" in line:
##            line = change_instruction("rts",lines,i)


        # pre-add video_address tag if we find a store instruction to an explicit 3000-3FFF address
        if store_to_video.search(line):
            line = line.rstrip() + " [video_address]\n"


        if "[unchecked_address" in line:
            # give me the original instruction
            line = line.replace("_ADDRESS","_UNCHECKED_ADDRESS")
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




        line = re.sub(tablere,subt,line)


        if "GET_ADDRESS" in line:
            val = line.split()[1]
            toks = line.split()
            input_dict = input_read_dict if "lda" in toks else input_write_dict
            osd_call = input_dict.get(val)
            if osd_call is not None:
                if osd_call:
                    line = change_instruction(f"jbsr\tosd_{osd_call}",lines,i)
                else:
                    line = remove_instruction(lines,i)
                lines[i+1] = remove_instruction(lines,i+1)
                if "stx" in line:
                    line = f"\texg\td0,d1\n{line}\texg\td0,d1\n"
                if "sty" in line:
                    line = f"\texg\td0,d2\n{line}\texg\td0,d2\n"
            if "read_dsw1" in line and "sta" in line:
                line = remove_instruction(lines,i)
            if "read_dsw2" in line and "sta" in line:
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
    jra        callback_\msb\lsb
0:
    .endm

callback_0000:
    CB_CASE     92,80
    CB_CASE     92,37
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


with open(source_dir / "data.inc","w") as fw:
    fw.writelines(equates)

with open(source_dir / "us_champ_vball.68k","w") as fw:
    fw.write(header)
    fw.writelines(lines)
    # add the bank 1 small code part
    fw.write('\n\t.include\t"us_champ_vball_bank1.68k"\n\n')