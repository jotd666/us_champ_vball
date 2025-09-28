import re
src = "../src/us_champ_vball.68k"
nb = 0
prev_loaded = None
with open(src) as f:
    lines = list(f)

def remcomments(line):
    return re.sub("[\|\*].*","",line)

for i,line in enumerate(lines):
    line = remcomments(line)  # remove comments
    toks = line.split()
    if "GET_ADDRESS" in toks or "GET_UNCHECKED_ADDRESS" in toks:
        value = toks[1]
        if prev_loaded == value and i-prev_line < 6:
            print(f"Prev loaded: {prev_loaded} line {i+1} loaded at line {prev_line+1}")
            nb += 1
        prev_line = i
        prev_loaded = value
    if any(x in toks for x in ["NEW_ADDRESS","SBC_X","SBC_Y","SBC_IMM","rts","jmp","jra","jbsr"]) or "GET_INDIRECT_" in line:
        prev_loaded = None
    if re.match("\w+:",line):
        prev_loaded = None

nb2=0
for i,line in enumerate(lines):
    line = remcomments(line)  # remove comments
    toks = line.split()
    if toks and toks[0]=="OP_W_ON_ZP_ADDRESS":
        next_line = remcomments(lines[i-2])
        nltoks = next_line.split()
        if nltoks and nltoks[0] == "OP_R_ON_ZP_ADDRESS" and toks[1:]==nltoks[1:]:
            # possibly a in-place operation on 68000
            middleline = remcomments(lines[i-1])
            mtoks = middleline.split()
            if mtoks and mtoks[0].endswith(".b"):
                inst = mtoks[0].replace(".b","")
                if inst not in ["asl","asr","rol","ror","lsr","lsl"]:
                    print(f"***** at line {i+1}")
                    print(lines[i-2],end="")
                    print(lines[i-1],end="")
                    print(lines[i],end="")
                    addr = nltoks[1].split(",")[1]
                    op = mtoks[1].split(",")[0]
                    print("--> replace by:")
                    if inst == "not":
                        print(f"\tOP_NOT_ON_ZP_ADDRESS\t{inst},{addr}")
                    else:
                        print(f"\tOP_W_ON_ZP_ADDRESS\t{inst},{addr},{op}")
                    nb2+=1

print(f"found {nb} GET_ADDRESS useless occs, {nb2} ON_R/ON_W couples")