from PIL import Image
import collections
from shared import *

def doit(img_name):
    img = Image.open(sheets_path / img_name)
    img = img.convert("RGB")

    color_y_max = collections.defaultdict(int)
    color_y_min = collections.defaultdict(lambda : img.size[1])  # min initialized to max

    used_colors = set()

    for x in range(img.size[0]):
        for y in range(img.size[1]):
            col = img.getpixel((x,y))
            used_colors.add(col)

            y_max = color_y_max[col]
            y_min = color_y_min[col]
            if y_max < y:
                color_y_max[col] = y
            if y_min > y:
                color_y_min[col] = y

    # now merge both dicts
    colors_minmax = {col:(color_y_min[col],color_y_max[col]) for col in used_colors}

    # brutal lookup
    associated = set()
    for c1,(ymin,ymax) in colors_minmax.items():
        maxdiff = 48
        res = None
        for c2,(ymin2,ymax2) in colors_minmax.items():
            diff = ymin2-ymax
            if diff > maxdiff and c2 not in associated:
                maxdiff = diff
                res = c1,c2,ymin2,ymax,diff
        if res:
            print(res)
            associated.add(res[1])

    return colors_minmax
a = doit("level_1.png")