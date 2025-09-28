import re
src = "../src/us_champ_vball.68k"
nb = 0
prev_loaded = None
with open(src) as f:
    for i,line in enumerate(f):
        line = re.sub("[\|\*].*","",line)  # remove comments
        toks = line.split()
        if "GET_ADDRESS" in toks or "GET_UNCHECKED_ADDRESS" in toks:
            value = toks[1]
            if prev_loaded == value and i-prev_line < 6:
                print(f"Prev loaded: {prev_loaded} line {i} loaded at line {prev_line}")
                nb += 1
            prev_line = i
            prev_loaded = value
        if any(x in toks for x in ["NEW_ADDRESS","SBC_X","SBC_Y","SBC_IMM","rts","jmp","jra","jbsr"]) or "GET_INDIRECT_" in line:
            prev_loaded = None
        if re.match("\w+:",line):
            prev_loaded = None

print(f"found {nb} occs")