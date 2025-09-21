from PIL import Image
import collections
from shared import *

def doit(img_name,avoid_colors=set(),debug_out=None):
    img = Image.open(sheets_path / img_name)
    img = img.convert("RGB")

    color_y_max = collections.defaultdict(int)
    color_y_min = collections.defaultdict(lambda : img.size[1])  # min initialized to max

    used_colors = set()

    for x in range(img.size[0]):
        for y in range(img.size[1]):
            col = img.getpixel((x,y))
            if col not in avoid_colors:
                used_colors.add(col)

                y_max = color_y_max[col]
                y_min = color_y_min[col]
                if y_max < y:
                    color_y_max[col] = y
                if y_min > y:
                    color_y_min[col] = y

    # now merge both dicts
    # dict contains color => min Y where this color is seen, max Y where this color is seen
    colors_minmax = {col:(color_y_min[col],color_y_max[col]) for col in used_colors}

    # brutal lookup sorry it sucks

    max_associated = 0

    for tried_y in range(260,320,5):
        associated = dict()
        for c1,(ymin,ymax) in colors_minmax.items():
            if ymin < tried_y and ymax > tried_y:
                maxdiff = 8
                res = None
                for c2,(ymin2,ymax2) in colors_minmax.items():
                    diff = ymin2-ymax
                    if diff > maxdiff and c2 not in associated:
                        # c2 y min color is below c1 y max color: match
                        maxdiff = diff
                        res = {"up_color":c1,"down_color":c2,"y_up_max":ymin2,"y_down_min":ymax,"diff":diff}
                if res:
                    associated[res["down_color"]] = res["up_color"]

        if len(associated)>max_associated:
            best_associated = associated
            max_associated = len(associated)
            best_y = tried_y

    if debug_out:
        print(best_y,best_associated)
        img2 = Image.new("RGB",img.size)
        img2.paste(img.crop((0,0,img.size[0],best_y)))

        for x in range(img.size[0]):
            img2.putpixel((x,best_y),(255,0,0))
            img2.putpixel((x,best_y+1),(255,0,0))

        for y in range(best_y+2,img.size[1]):
            for x in range(img.size[0]):
                p = img.getpixel((x,y))
                p = associated.get(p,p)
                img2.putpixel((x,y),p)

        img2.save(debug_out)

    return best_y,associated

if __name__ == "__main__":
    a = doit("level_1.png",debug_out="out_1.png")
