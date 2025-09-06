from PIL import Image,ImageOps
import pathlib

# MAME gfx save edition is cool but cannot differentiate background color from black.
# this is pretty f**ing annoying, fortunately, there's always a CLUT in the set which makes the difference
# here it's monochrome palette index 0xD that saves us.

this_dir = pathlib.Path(__file__).absolute().parent

magenta = (254,0,254)

def doit(sheet_subdir,fake_black):
    sheets_dir = this_dir.parent / "assets" / "sheets" / sheet_subdir
    src_sprite_dir = sheets_dir / "sprites_black"  # the original sprites ripped from MAME with black background
    dst_sprite_dir = sheets_dir / "sprites"

    dst_sprite_dir.mkdir(exist_ok=True)


    replacement_pixels = dict()

    yp = set()
    # accumulate list of positions where black is actually really black, not the background
    for i,fbl in fake_black.items():
        ref_image = Image.open(src_sprite_dir / f"pal_{i:02x}.png")

        for fb in fbl:
            # this palette has the nice property of having black not merged with background
            # black colors in other palettes are there yellow, so we can backport the black color in other palettes
            for x in range(ref_image.size[0]):
                for y in range(ref_image.size[1]):
                    p = ref_image.getpixel((x,y))
                    if p == fb:
                        yp.add((x,y))
        image_size = ref_image.size

    for i in range(8):
        imgname = f"pal_{i:02X}.png"
        src = src_sprite_dir / imgname
        dst = dst_sprite_dir / imgname

        src_image = Image.open(src)

        dst_image = Image.new("RGB",image_size)
        for x in range(image_size[0]):
            for y in range(image_size[1]):
                p = src_image.getpixel((x,y))
                if p == (0,0,0):
                    # black: what do do?
                    if (x,y) in yp:
                        pass
                    else:
                        p = magenta  # black => magenta but not full magenta to avoid conflicts
                dst_image.putpixel((x,y),p)

        dst_image.save(dst)

#doit("level_1",fake_black = {0:((0,204,0),),5:((255,0,0),),2:((119,119,0),)})
doit("level_3",fake_black = {0:((119,102,0),(0,204,0)),5:((255,0,0),),2:((238,238,68),(136,0,0))})
doit("level_2",fake_black = {0:((119,102,0),(0,204,0)),5:((255,0,0),(0,170,153)),3:((255,255,0),(221,153,0)),2:((238,238,68),)})
#doit("level_5",fake_black = {0:((119,102,0),(0,204,0)),5:((255,0,0),),2:((153,119,0),)})
