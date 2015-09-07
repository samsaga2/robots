from PIL import Image
import sys
from lz77 import compress

if len(sys.argv) < 3:
    sys.exit('Usage: %s <image.png> <output>' % sys.argv[0])

img = Image.open(sys.argv[1])

if (256,192) != img.size:
    sys.exit('256x192 image size expected')

if img.palette == None:
    sys.exit('indexed image expected')

def getRow(img, x, y):
    row = [img.getpixel((x+i,y)) for i in range(8)]
    colors = list(sorted(set(row)))
    if len(colors) > 2:
        sys.exit("too many colors from {0}x{1} to {2}x{1}".format(x,y,x+7))
    bg_color = colors[0]
    fg_color = colors[1] if len(colors) > 1 else -1
    bits = ['1' if row[i]==fg_color else '0' for i in range(8)]
    return (int("".join(bits),2), bg_color+(fg_color if fg_color!=-1 else 0)*16)

def getTile(img, x, y):
    row = [getRow(img, x, y+i) for i in range(8)]
    return ([i[0] for i in row], [i[1] for i in row])

def convert(img):
    patterns = []
    colors = []
    for y in range(0,24):
        for x in range(0,32):
            pattern, color = getTile(img, x*8, y*8)
            patterns.extend(pattern)
            colors.extend(color)
    return patterns, colors

def save(lst, fname):
    with open(fname, 'wb') as f:
        f.write(bytes(lst))

pattern, color = convert(img)
save(compress(pattern), sys.argv[2]+'.pat')
save(compress(color), sys.argv[2]+'.col')
