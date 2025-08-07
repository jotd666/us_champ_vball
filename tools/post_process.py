from shared import *

# post-conversion automatic patches, allowing not to change the asm file by hand



input_read_dict = {
"player_1_controls_9000":"read_inputs",
"dsw1_8000":"read_dsw1",
"dsw2_8001":"read_dsw2",
"system_9002":"read_system"
}

input_write_dict = {
"player_1_controls_9000":"",
"dsw1_8000":"",
"dsw2_8001":"",    # video control is useless here
"system_9002":"sound_start",   # sound_start
"charbank_8003":"set_charbank",  # inc charbank
}

def get_line_address(line):
    toks = line.split("|")
    address = toks[1].strip(" [$").split(":")[0]
    return int(address,16)


# various dirty but at least automatic patches applying on the specific track and field code
with open(source_dir / "conv.s") as f:
    lines = list(f)
    i = 0

    while i < len(lines):
        line = lines[i]
        if " = " in line:
            equates.append(line.replace("$","0x"))
            line = ""

        if re.search("GET_ADDRESS\t\w*table",line):
            index = "X" if ",x" in line else "Y"
            line = line.replace("GET_ADDRESS",f"PUSH_TABLE_{index}_ADDRESS")
            line_address = get_line_address(line)
            if line_address in {0xBE09,0xBA7F,0xB781,0xA73B,0XA650,0X8710,0x917c}:
                lines[i+1] = "\trts   | rest of the code is useless, just jump\n\n"
            else:
                lines[i+1] = ""

        if "unsupported transfer to stack register" in line:
            line = ""

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
        if "ERROR" in line:
            print(line,end="")
        lines[i] = line
        i+=1




with open(source_dir / "data.inc","w") as fw:
    fw.writelines(equates)

with open(source_dir / "us_champ_vball.68k","w") as fw:
    fw.write("""\t.include "us_champ_vball.inc"
*\t.include "data.inc"
*\t.global\tinsert_coin_irq_f000
*\t.global\treset_f003
""")
    fw.writelines(lines)