from PIL import Image,ImageOps
import os,sys,bitplanelib,subprocess

from shared import *

sprite_names = {}

possible_hw_sprites = set()

def asm2bin(source,dest):
    subprocess.run(["vasmm68k_mot","-nosym","-pic","-Fbin",source,"-o",dest],check=True,stdout=subprocess.DEVNULL)

dump_it = True

if dump_it:
    if not os.path.exists(dump_dir):
        os.mkdir(dump_dir)
        with open(os.path.join(dump_dir,".gitignore"),"w") as f:
            f.write("*")


def dump_asm_bytes(*args,**kwargs):
    bitplanelib.dump_asm_bytes(*args,**kwargs,mit_format=False)


def ensure_empty(d):
    if os.path.exists(d):
        for f in os.listdir(d):
            os.remove(os.path.join(d,f))
    else:
        os.makedirs(d)

def load_tileset(image_name,palette_index,width,height,tileset_name,dumpdir,
dump=False,name_dict=None,cluts=None,tile_number=0,is_bob=False):

##    if isinstance(image_name,str):
##        full_image_path = os.path.join(this_dir,os.path.pardir,"sheets",
##                            tile_type,image_name)
##        tiles_1 = Image.open(full_image_path)
##    else:
    tiles_1 = image_name
    nb_rows = tiles_1.size[1] // height
    nb_cols = tiles_1.size[0] // width


    tileset_1 = []

    if dump:
        dump_subdir = os.path.join(dumpdir,tileset_name)
        if palette_index == 0 and tile_number == 0:
            ensure_empty(dump_subdir)

    palette = set()

    for j in range(nb_rows):
        for i in range(nb_cols):

            if cluts is not None and (tile_number not in cluts or palette_index not in cluts[tile_number]):
                # no clut declared for that tile
                tileset_1.append(None)
            else:

                img = Image.new("RGB",(width,height))
                img.paste(tiles_1,(-i*width,-j*height))

                # only consider colors of used tiles
                palette.update(set(bitplanelib.palette_extract(img)))


                tileset_1.append(img)
                # dump tiles
                if not is_bob and dump:
                    img = ImageOps.scale(img,5,resample=Image.Resampling.NEAREST)
                    if name_dict:
                        name = name_dict.get(tile_number,"unknown")
                    else:
                        name = "unknown"

                    img.save(os.path.join(dump_subdir,f"{name}_{tile_number:02x}_{palette_index:02x}.png"))
            tile_number += 1

    if is_bob:
        # rework & dump grouped / non grouped sprites
        # rework tiles which are grouped
        for tile_number,wtile in enumerate(tileset_1):

##            if wtile and tile_number in group_sprite_pairs:
##                # change wtile, fetch code +0x100
##                other_tile_index = tile_number+1
##                other_tile = tileset_1[other_tile_index]
##                if not other_tile:
##                    raise Exception(f"other tile index 0x{other_tile_index:02x} not found")
##                new_tile = Image.new("RGB",(wtile.size[0]*2,wtile.size[1]))
##
##                new_tile.paste(wtile)
##
##                new_tile.paste(other_tile,(wtile.size[0],0))
##                tileset_1[tile_number] = new_tile
##                tileset_1[tile_number+1] = None  # discatd
##                wtile = new_tile
            if dump_it and wtile:
                img = ImageOps.scale(wtile,5,resample=Image.Resampling.NEAREST)
                if sprite_names:
                    name = sprite_names.get(tile_number,"unknown")
                else:
                    name = "unknown"

                img.save(os.path.join(dump_subdir,f"{name}_{tile_number:02x}_{palette_index:02x}.png"))



    return sorted(set(palette)),tileset_1

all_tile_cluts = False


nb_planes = 8
nb_colors = 1<<nb_planes
nb_cluts = 8



def add_tile(table,index,cluts=[0]):
    if isinstance(index,range):
        pass
    elif not isinstance(index,(list,tuple)):
        index = [index]
    for idx in index:
        table[idx] = cluts


# now gather all cluts used by letter/digit tiles, logging probably
# missed some
#used_cluts = set()
##for atc in alphanum_tile_codes:
##    cluts = tile_cluts.get(atc)
##    if cluts:
##        used_cluts.update(cluts)
### now set cluts for all alphanum tiles
##for atc in alphanum_tile_codes:
##    tile_cluts[atc] = sorted(used_cluts)




def add_hw_sprite(index,name,cluts=[0]):
    if isinstance(index,range):
        pass
    elif not isinstance(index,(list,tuple)):
        index = [index]
    for idx in index:
        sprite_names[idx] = name
        hw_sprite_cluts[idx] = cluts



plane_orientations = [("standard",lambda x:x),
("flip",ImageOps.flip),
("mirror",ImageOps.mirror),
("flip_mirror",lambda x:ImageOps.flip(ImageOps.mirror(x)))]

def read_tileset(img_set_list,palette,plane_orientation_flags,cache,is_bob):
    next_cache_id = 1
    tile_table = []
    for n,img_set in enumerate(img_set_list):
        tile_entry = []
        for i,tile in enumerate(img_set):
            entry = dict()
            if tile:

                for b,(plane_name,plane_func) in zip(plane_orientation_flags,plane_orientations):
                    bitplane_sprite_data = None
                    if b:

                        actual_nb_planes = nb_planes


##                        if plane_func == ImageOps.mirror and i not in mirror_sprites:
##                            continue

                        wtile = plane_func(tile)

                        if is_bob:
                            actual_nb_planes += 1


                            # only 4 planes + mask => 5 planes
                            y_start,wtilec = bitplanelib.autocrop_y(wtile)
                            height = wtilec.size[1]
                            width = wtilec.size[0]//8 + 2
                            bitplane_data = bitplanelib.palette_image2raw(wtilec,None,palette,generate_mask=True)

                            # add sprite data if eligible: player frame, not mirrored
                            if i in possible_hw_sprites:
                                # using original, uncropped bitplane data
                                bitplane_sprite_data = bitplanelib.palette_image2attached_sprites(wtile,None,palette,
                                sprite_fmode=2,with_control_words=True)
                        else:
                            # no mask
                            height = 8
                            width = 1
                            y_start = 0
                            bitplane_data = bitplanelib.palette_image2raw(wtile,None,palette)

                        plane_size = len(bitplane_data) // actual_nb_planes
                        bitplane_plane_ids = []
                        for j in range(actual_nb_planes):
                            offset = j*plane_size
                            bitplane = bitplane_data[offset:offset+plane_size]

                            cache_id = cache.get(bitplane)
                            if cache_id is not None:
                                bitplane_plane_ids.append(cache_id)
                            else:
                                if any(bitplane):
                                    cache[bitplane] = next_cache_id
                                    bitplane_plane_ids.append(next_cache_id)
                                    next_cache_id += 1
                                else:
                                    bitplane_plane_ids.append(0)  # blank

                        entry[plane_name] = {"width":width,"height":height,"y_start":y_start,"bitplanes":bitplane_plane_ids}
                        if bitplane_sprite_data:
                            entry[plane_name]["sprdat"] = bitplane_sprite_data

            tile_entry.append(entry)

        tile_table.append(tile_entry)

    new_tile_table = [[[] for _ in range(nb_cluts)] for _ in range(len(tile_table[0]))]

    # reorder/transpose. We have 16 * 256 we need 256 * 16
    for i,u in enumerate(tile_table):
        for j,v in enumerate(u):
            new_tile_table[j][i] = v

    return new_tile_table


dump_it = True

def gen_context_files(context_name,with_sprites=True):
    tile_sheet_dict = {i:Image.open(sheets_path / context_name / "tiles" / f"pal_{i:02x}.png") for i in range(nb_cluts)}
    if with_sprites:
        sprite_sheet_dict = {i:Image.open(sheets_path / context_name / "sprites" / f"pal_{i:02x}.png") for i in range(nb_cluts)}
    else:
        sprite_sheet_dict = {}

    tile_palette = set()
    tile_set_list = []

    sdump_dir = dump_dir / context_name
    sdump_dir.mkdir(exist_ok=True)

    tile_cluts = {}
    try:
        with open(used_graphics_dir / context_name / "used_tiles","rb") as f:
            for index in range(NB_TILES):
                d = f.read(nb_cluts)
                cluts = [i for i,c in enumerate(d) if c]
                if cluts:
                    add_tile(tile_cluts,index,cluts=cluts)
    except OSError:
        pass

    sprite_cluts = {}


    try:
        with open(used_graphics_dir / context_name / "used_sprites","rb") as f:
            for index in range(NB_SPRITES):
                d = f.read(nb_cluts)   # lower part: no Y double size, upper part: Y double size
                cluts = [i for i,c in enumerate(d) if c]
                if cluts:
                    add_tile(sprite_cluts,index,cluts=cluts)
    except OSError:
        print("Cannot find used_sprites")



    if dump_it:
        with open(sdump_dir / "used_sprites.json","w") as f:
            sprite_cluts_dict = {hex(k):[hex(x) for x in v] for k,v in sprite_cluts.items() if v}
            json.dump(sprite_cluts_dict,f,indent=2)
        with open(sdump_dir / "used_tiles.json","w") as f:
            tile_cluts_dict = {hex(k):[hex(x) for x in v] for k,v in tile_cluts.items() if v}
            json.dump(tile_cluts_dict,f,indent=2)

    for i,tsd in tile_sheet_dict.items():
        print(f"loading {context_name}:{i}")
        tp,tile_set = load_tileset(tsd,i,8,8,"tiles",sdump_dir,dump=dump_it,
        cluts=tile_cluts,
        name_dict=None)
        tile_set_list.append(tile_set)
        tile_palette.update(tp)

    # pad
##    tile_palette = sorted(tile_palette)
##    tile_palette += (nb_colors//2-len(tile_palette)) * [(0x10,0x20,0x30)]

    sprite_palette = set(tile_palette)  # try to reuse tile palette
    sprite_set_list = [[] for _ in range(nb_cluts)]
    hw_sprite_set_list = []



    cluts = sprite_cluts
    sprite_dump_dir = sdump_dir / "sprites"

    for p in sprite_dump_dir.glob("*"):
        p.unlink()
    sprite_dump_dir.mkdir(exist_ok=True)

    for clut_index,tsd in sprite_sheet_dict.items():
        # BOBs

        sp,sprite_set = load_tileset(tsd,clut_index,16,16,"sprites",sdump_dir,dump=dump_it,
        name_dict=sprite_names,cluts=sprite_cluts,is_bob=True)
        sprite_set_list[clut_index] = sprite_set
        sprite_palette.update(sp)


    full_palette = sorted(sprite_palette)
    full_palette += (nb_colors-len(full_palette)) * [(0x10,0x20,0x30)]


    # sprite_set_list is now a 16x512 matrix of sprite tiles

        # Hardware sprites
    ##    cluts = hw_sprite_cluts
    ##    _,hw_sprite_set = load_tileset(tsd,i,16,"hw_sprites",dump_dir,dump=dump_it,name_dict=sprite_names,cluts=cluts)
    ##    hw_sprite_set_list.append(hw_sprite_set)


    tile_plane_cache = {}
    tile_table = read_tileset(tile_set_list,full_palette,[True,False,False,False],cache=tile_plane_cache, is_bob=False)

    bob_plane_cache = {}

    sprite_table = read_tileset(sprite_set_list,full_palette,[True,False,True,False],cache=bob_plane_cache, is_bob=True)




    def write_ptr(f,ptr_name):
        f.write(f"{decl_word}{ptr_name}-_base\n")

    out_asm_file = gen_dir / f"tiles_{context_name}.s"
    with open(out_asm_file,"w") as f:

##gs_array = [0]*0x100
##for i in group_sprite_pairs:
##    gs_array[i] = 1
##    gs_array[i+1] = 0xFF
##with open(os.path.join(src_dir,"sprite_groups.68k"),"w") as f:
##    f.write("* 1: do not display unless mirrored\n")
##    dump_asm_bytes(gs_array,f)



        f.write("tile_table:\n")

        for i,tile_entry in enumerate(tile_table):
            f.write(decl_ptr)
            if tile_entry and any(tile_entry):
                f.write(f"tile_{i:02x}-tile_table")
            else:
                f.write("0")
            f.write("\n")

        for i,tile_entry in enumerate(tile_table):
            if tile_entry and any(tile_entry):
                f.write(f"tile_{i:02x}:\n")
                for j,t in enumerate(tile_entry):
                    f.write(decl_ptr)
                    if t:
                        f.write(f"tile_{i:02x}_{j:02x}-tile_{i:02x}")
                    else:
                        f.write("0")
                    f.write("\n")

        # tiles
        for i,tile_entry in enumerate(tile_table):
            if tile_entry and any(tile_entry):
                for j,t in enumerate(tile_entry):
                    if t:
                        name = f"tile_{i:02x}_{j:02x}"

                        f.write(f"{name}:\n")
                        for orientation,_ in plane_orientations:
                            f.write("* orientation={}\n".format(orientation))
                            if orientation in t:
                                data = t[orientation]
                                for bitplane_id in data["bitplanes"]:
                                    f.write(decl_ptr)
                                    if bitplane_id:
                                        f.write(f"tile_plane_{bitplane_id:02d}-{name}")
                                    else:
                                        f.write("0")
                                    f.write("\n")
                                if len(t)==1:
                                    # optim: only standard
                                    break
                            else:
                                for _ in range(nb_planes):
                                    f.write(decl_ptr+"0\n")



        for k,v in tile_plane_cache.items():
            f.write(f"tile_plane_{v:02d}:")
            dump_asm_bytes(k,f)

    out_bin_file = data_dir / f"tiles_{context_name}"
    asm2bin(out_asm_file,out_bin_file)

    out_bin_file = data_dir / f"palette_{context_name}"
    out_asm_file = gen_dir / f"palette_{context_name}.s"
    with open(out_asm_file,"w") as f:
        bitplanelib.palette_dump(full_palette,f,bitplanelib.PALETTE_FORMAT_ASMMOT)
    asm2bin(out_asm_file,out_bin_file)

    out_asm_file = gen_dir / f"bobs_{context_name}.s"
    out_bin_file = data_dir / f"bobs_{context_name}"
    with open(out_asm_file,"w") as f:

        f.write("bob_table:\n")
        for i,tile_entry in enumerate(sprite_table):
            f.write(decl_ptr)
            if any(tile_entry):
                prefix = sprite_names.get(i,"bob")
                f.write(f"{prefix}_{i:02x}-bob_table")
            else:
                f.write("0")
            f.write("\n")

##        f.write("hws_table:\n")
##        for i,tile_entry in enumerate(sprite_table):
##            f.write(decl_ptr)
##            if any(t and "sprdat" in t['standard'] for t in tile_entry):
##                prefix = sprite_names.get(i,"bob")
##                prefix = f"hws_{prefix}_{i:02x}"
##                f.write(prefix)
##            else:
##                f.write("0")
##            f.write("\n")

##        # HW sprites clut declaration
##        for i,tile_entry in enumerate(sprite_table):
##            if any(t and "sprdat" in t['standard'] for t in tile_entry):
##                prefix = sprite_names.get(i,"bob")
##                f.write(f"hws_{prefix}_{i:02x}:\n")
##                for j,t in enumerate(tile_entry):
##                    f.write(decl_ptr)
##                    if t:
##                        z = f"hws_{prefix}_{i:02x}_{j:02x}"
##                        f.write(f"{z}_0,{z}_1")
##                    else:
##                        f.write("0,0")
##                    f.write("\n")


        # BObs clut declaration
        for i,tile_entry in enumerate(sprite_table):
            if any(tile_entry):
                prefix = sprite_names.get(i,"bob")
                p = f"{prefix}_{i:02x}"
                f.write(f"{p}:\n")
                for j,t in enumerate(tile_entry):
                    f.write(decl_ptr)
                    if t:
                        f.write(f"{p}_{j:02x}-{p}")
                    else:
                        f.write("0")
                    f.write("\n")


        for i,tile_entry in enumerate(sprite_table):
            if tile_entry:
                prefix = sprite_names.get(i,"bob")
                for j,t in enumerate(tile_entry):
                    if t:
                        name = f"{prefix}_{i:02x}_{j:02x}"

                        f.write(f"{name}:\n")
                        height = 0

                        offset = 0
                        for orientation,_ in plane_orientations:
                            if orientation in t:
                                width = t[orientation]["width"]
                                height = t[orientation]["height"]
                                offset = t[orientation]["y_start"]
                                break
                        else:
                            raise Exception(f"height not found for {name}!!")
                        for orientation,_ in plane_orientations:
                            if orientation in t:
                                f.write("* {}\n".format(orientation))
                                active_planes = 0
                                bitplanes = t[orientation]["bitplanes"]

                                for j,bitplane_id in enumerate(bitplanes):
                                    if bitplane_id:
                                        active_planes |= 1<<j

                                f.write(f"\t{decl_word}\t{height},{width},{offset},${active_planes:x}\n")
                                for bitplane_id in bitplanes:
                                    f.write(decl_ptr)
                                    if bitplane_id:
                                        f.write(f"bob_plane_{bitplane_id:02d}-{name}")
                                    else:
                                        f.write("0")
                                    f.write("\n")
                                if len(t)==1:
                                    # optim: only standard
                                    break


        for k,v in bob_plane_cache.items():
            f.write(f"bob_plane_{v:02d}:")
            dump_asm_bytes(k,f)

        # HW sprites bitplane data
        for i,tile_entry in enumerate(sprite_table):
            if any(t and "sprdat" in t['standard'] for t in tile_entry):
                prefix = sprite_names.get(i,"bob")
                for j,t in enumerate(tile_entry):

                    if t:
                        data = t["standard"]["sprdat"]
                        for k,d in enumerate(data):
                            f.write(f"hws_{prefix}_{i:02x}_{j:02x}_{k}:")
                            dump_asm_bytes(d,f)
                        f.write("\n")
    asm2bin(out_asm_file,out_bin_file)

#gen_context_files("intro",with_sprites=False)
gen_context_files("level_1")
#gen_context_files("select")
