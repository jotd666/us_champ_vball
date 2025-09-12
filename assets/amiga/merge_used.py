import os,pathlib,shutil,json,itertools

from shared import *




def merge(context_name,used_name,nb_items,nb_cluts,overwrite):
    merged_path_file = used_graphics_dir / context_name
    merged_path_file.mkdir(exist_ok=True)
    bin_file = merged_path_file / used_name

    # merge sprites with existing file + moves from level 1
    used_dump = data_dir / "aga_64" / used_name
    with open(used_dump,"rb") as f:
        new_contents = f.read()


    old_used = merged_path_file / used_name
    if not overwrite and old_used.exists():
        with open(old_used,"rb") as f:
            old_contents = f.read()
    else:
        old_contents = bytes(nb_cluts*nb_items)

    contents = bytes([a|b for a,b in itertools.zip_longest(new_contents,old_contents,fillvalue=0)])

    if old_contents == contents:
        print(f"Nothing new for {used_name}")
    else:
        for i,(a,b) in enumerate(itertools.zip_longest(old_contents,contents,fillvalue=0)):
            if a!=b:
                code,clut = divmod(i,nb_cluts)
                print(f"{used_name}: New: code={code:02x}, clut={clut:02x}, size={b}")
            if b==3:
                # should not happen
                print(f"*** warning ***: simple & double height found for sprite {code:02x}")

        with open(bin_file,"wb") as f:
            f.write(contents)


context = "level_5"
overwrite = False


merge(context,"used_tiles",0x4000,nb_cluts = 8,overwrite=overwrite)
merge(context,"used_sprites",0x800,nb_cluts=8,overwrite=overwrite)
