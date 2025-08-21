from PIL import Image,ImageOps
import os,pathlib,struct

from shared import *


sprite_names = get_sprite_names()




def load_tileset(image_name,width,height,dump_prefix=""):
    full_image_path = sheets_path / "select" / "sprites" / image_name
    tiles_1 = Image.open(full_image_path)
    nb_rows = tiles_1.size[1] // height
    nb_cols = tiles_1.size[0] // width

    if dump_prefix:
        dumpdir = pathlib.Path("dumps")
        dumpdir.mkdir(exist_ok=True)

    tileset_1 = []
    k=0
    for j in range(nb_rows):
        for i in range(nb_cols):
            img = Image.new("RGB",(width,height))
            img.paste(tiles_1,(-i*width,-j*height))
            tileset_1.append(img)
            if dump_prefix:
                img = ImageOps.scale(img,5,resample=Image.Resampling.NEAREST)
                img.save(os.path.join(dumpdir,f"{dump_prefix}_{k:02x}.png"))
            k += 1

    return tileset_1

def loadtiles(i):
    return load_tileset(f"pal_{i:02x}.png",16,16)

tile_set = [loadtiles(i) for i in range(8)]


def process(the_dump,name_filter=None,hide_named_sprite=None):
    the_dump = pathlib.Path(the_dump)
    # in input, we use a MAME memory dump: save sprites,$A000,$400
    # (0x200 are read, but there's a kind of double buffering
    with open(the_dump,"rb") as f:
        mem_800 = bytearray(f.read())

    m_spriteram = mem_800

    result = Image.new("RGB",(256,256))

    print("*"*50)
    nb_active = 0



    for i in range(0,0x100,4):
        block = m_spriteram[i:i+4]
        if block == bytearray(b'\xf8\x00\x00\xf8'):
            continue


        attr = m_spriteram[i + 1];
        which = m_spriteram[i + 2]+ ((attr & 0x07) << 8);
        sx = ((m_spriteram[i + 3] + 8) & 0xff) - 7;
        sy = 240 - m_spriteram[i];
        size = (attr & 0x80) >> 7;
        color = (attr & 0x38) >> 3;
        flipx = ~attr & 0x40;
        flipy = 0;



        im = tile_set[color][which]

        if flipy:
            im = ImageOps.flip(im)
        if flipx:
            im = ImageOps.mirror(im)

        name = sprite_names.get(which,"unknown")

        if not size:
            print(f"offs:{i:02x}, name: {name}, size: {size}, code:{which:02x}, flipx: {flipx}, flipy: {flipy}, color:{color:02x}, X:{sx}, Y:{sy}")
            result.paste(im,(sx,sy))
        else:
            # double height: tile is drawn 16 pixels above, and next tile is drawn at the original y
            sy -= 16
            print(f"offs:{i:02x}, name: {name}, size: {size}, code:{which:02x}, flipx: {flipx}, flipy: {flipy}, color:{color:02x}, X:{sx}, Y:{sy}")
            result.paste(im,(sx,sy))
            sy += 16
            which += 1
            im = tile_set[color][which]
            name = sprite_names.get(which,"unknown")
            if flipy:
                im = ImageOps.flip(im)
            if flipx:
                im = ImageOps.mirror(im)

            print(f"following: offs:{i:02x}, name: {name}, size: {size}, code:{which:02x}, flipx: {flipx}, flipy: {flipy}, color:{color:02x}, X:{sx}, Y:{sy}")
            result.paste(im,(sx,sy))
        nb_active += 1

    result.save(f"{the_dump.stem}.png")
    print(f"nb active: {nb_active}")


process(r"sprites_mame")
process(r"sprites_amiga")

