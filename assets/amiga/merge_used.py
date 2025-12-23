import os,pathlib,shutil,json,itertools

from shared import *

# for all levels, sprites that should be the same in all cluts
# avoids missing some sprite logging
same_sprites_clut = {"level_1":{2,3},"level_2":{0:1},"level_3":{0:1},"level_4":{0:1,1:3},"level_5":{0:1,2:3}}

sprite_names = get_sprite_names()

def merge(context_name,used_name,nb_items,nb_cluts,overwrite,sprites=False,ignore_input=False):
    merged_path_file = used_graphics_dir / context_name
    merged_path_file.mkdir(exist_ok=True)
    bin_file = merged_path_file / used_name

    # merge sprites with existing file + moves from level 1
    used_dump = data_dir / "aga_64" / used_name
    if ignore_input:
        new_contents = bytearray(nb_cluts*nb_items)
    else:
        with open(used_dump,"rb") as f:
            new_contents = f.read()


    old_used = merged_path_file / used_name
    if not overwrite and old_used.exists():
        with open(old_used,"rb") as f:
            old_contents = f.read()
    else:
        old_contents = bytearray(nb_cluts*nb_items)

    contents = bytearray([a|b for a,b in itertools.zip_longest(new_contents,old_contents,fillvalue=0)])

    for i,(a,b) in enumerate(itertools.zip_longest(old_contents,contents,fillvalue=0)):
        code,clut = divmod(i,nb_cluts)  # code: result, clut: remainder
        if sprites and b:
            # check if we should propagate to other cluts
            ssc = same_sprites_clut.get(context_name)
            if ssc:
                if clut not in ssc:
                    # try inverse mapping
                    ssc = {v:k for k,v in ssc.items()}
                if clut in ssc:
                    other_clut = ssc[clut]
                    offset = code*nb_cluts+other_clut
                    # do not propagate color for referee, it's wasteful
                    if contents[offset]==0 and sprite_names.get(code) != "referee":
                        print(f"{used_name}: New (propagate): code={code:02x}, clut={other_clut:02x}, size={b}")
                        contents[offset] = b

        if a!=b:
            print(f"{used_name}: New: code={code:02x}, clut={clut:02x}, size={b}")

        if b==3:
            # should not happen
            print(f"*** warning ***: simple & double height found for sprite {code:02x}")

    if old_contents == contents:
        print(f"Nothing new for {used_name}")
    else:
        with open(bin_file,"wb") as f:
            f.write(contents)


context = "level_3"
overwrite = False


#merge(context,"used_tiles",0x4000,nb_cluts = 8,overwrite=overwrite)
merge(context,"used_sprites",0x800,nb_cluts=8,overwrite=overwrite,sprites=True)
