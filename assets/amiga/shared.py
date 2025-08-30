from PIL import Image,ImageOps
import os,sys,bitplanelib,subprocess,json,pathlib

this_dir = pathlib.Path(__file__).absolute().parent

data_dir = this_dir / ".." / ".." / "data"
src_dir = this_dir / ".." / ".." / "src" / "amiga"
gen_dir = src_dir / "gen"


sheets_path = this_dir / ".." / "sheets"
dump_dir = this_dir / "dumps"

used_sprite_cluts_file = this_dir / "used_sprite_cluts.json"
used_tile_cluts_file = this_dir / "used_tile_cluts.json"
used_graphics_dir = this_dir / "used_graphics"

NB_SPRITES = 0x800
NB_TILES = 0x4000

gen_dir.mkdir(exist_ok=True)


decl_ptr = "\tdc.l\t"
decl_word = "\tdc.w\t"

def palette_pad(palette,pad_nb):
    palette += (pad_nb-len(palette)) * [(0x10,0x20,0x30)]

def ensure_empty(d):
    if os.path.exists(d):
        for f in os.listdir(d):
            x = os.path.join(d,f)
            if os.path.isfile(x):
                os.remove(x)
    else:
        os.makedirs(d)

def ensure_exists(d):
    if os.path.exists(d):
        pass
    else:
        os.makedirs(d)

sr2 = lambda a,b : set(range(a,b,2))

def get_sprite_names():

    rval = {0x2D6:"P",
    0x2D7:"L",
    0x2D8:"A",
    0x2D9:"Y",
    0x2DA:"E",
    0x2DB:"R",
    0x2DC:"S",
    0x2DD:"C",
    0x2DE:"T",
    0x2E8:"pole",
    0x2E9:"pole",
    0x440:"net",
    0x442:"net",
    0x7e0:"player_head_1",
    0x7e1:"player_torso_1",
    0x7e2:"player_tigh_1",
    0x7e3:"player_calf",
    0x7e4:"player_head_2",
    0x7e5:"player_torso_2",
    0x7e6:"player_tigh_2",
    0x7e7:"player_leg",

    }

    for i in range(0x2EE,0x2F5):
        rval[i] = "ball"
    for i in range(0x2E2,0x2EE):
        rval[i] = "pole"

    return rval



if __name__ == "__main__":
    raise Exception("no main!")