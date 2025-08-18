# this script was used once to
# - tag the jump/jsr calls
# - name the jump tables and dump their contents as words in the end of the file

import pathlib,re

fake = {0x56a5}

def process(asm_file,rom_file,banked_rom,offset,end_address):
    with open(asm_file) as f:
        asm_lines = f.readlines()

    with open(rom_file,"rb") as f:
        rom = f.read()
    with open(banked_rom,"rb") as f:
        brom = f.read()


    size = 0x100

    known_tables = set()

    # first pass: add "jump_table" tag
    for i,line in enumerate(asm_lines):
        if ("jmp" in line or "jsr" in line) and "(" in line:
            if "[indirect_jump]" in line:
                pass
            else:
                line = line.strip() + "        ; [indirect_jump]\n"
                asm_lines[i] = line
        if re.match("^\w*table_\w+:",line):
            known_tables.add(line.strip().strip(":"))

    # second pass: find tag, then previous LDx instruction to get table address
    # create a label for table at the previous LDx instruction that matches the
    # index register (X,Y). Widely used in a lot of games, Konami but not just them.
    for i,line in enumerate(asm_lines):
        if "[indirect_jump]" in line:

            dest = None
            for j in range(i-1,i-10,-1):
                other_line = asm_lines[j]
                if "jump_table" in other_line or "lda table" in other_line:
                    toks = other_line.split(",")
                    dest = toks[0][-5:].strip("_")
                    break
            if dest:
                if dest in known_tables:
                    continue   # already declared

                if "table_" in dest:
                    # already processed, re-process
                    dest = dest.replace("table_","")
                try:
                    table_address = int(dest.strip('$'),16)
                except ValueError:
                    print(f"no table {i}")
                    raise
                if table_address > 0x8000:
                    data = rom
                    sub = offset
                    end = end_address

                else:
                    data = brom
                    sub = 0x4000
                    end = end_address

                block = data[table_address-sub:table_address-sub+size]
                label = f"table_{table_address:04x}"
                asm_lines[j] = asm_lines[j].replace(dest,label).replace("table_table","table")

                asm_lines.append(f"{label}:\n")
                for i in range(0,len(block),2):
                    a = block[i] + block[i+1]*256   # little endian!
                    if sub > a or a >= end:
                        break
                    asm_lines.append(f"\tdc.w\t${a:04x}\t; ${table_address:04x}\n")
                    table_address += 2
            else:
                print(f"Could not find matching {line}")

    with open(asm_file.stem + "_new.asm","w") as f:
        f.writelines(asm_lines)

process(pathlib.Path("../src/us_champ_vball_6502.asm"),"../assets/mame/rom.bin","../assets/mame/bank0.bin",offset=0x8000,end_address=0x10000)
