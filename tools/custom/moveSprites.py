import re
import os
import shutil

side = "icon" #change this to front, back, or icon
if side == "front":
    sideDir = "Pokemon Front\\"
if side == "back" :
    sideDir = "Pokemon Back\\"
if side == "icon" :
    sideDir = "Pokemon Icon\\"
curDir = "C:\\Users\\User\\Documents\\GitHub\\celias-stupid-repository\\Misc Assets\\Sprites\\"+sideDir

namex = re.compile(r"_(?!.*_)([A-Z]|[a-z]|\(|\)|')+\.png")

for fileName in os.listdir(curDir):
    
    name = namex.search(fileName)
    if name:
        name = name.group()[1:-4]
        if name in open("C:\\Users\\User\\Documents\\GitHub\\celias-stupid-repository\\tools\\custom\\movList.txt").read():
            tarDir = "C:\\Users\\User\\Documents\\GitHub\\celias-stupid-repository\\graphics\\pokemon\\"+name.lower()+"\\"+side+".png"
            source = curDir+fileName
            shutil.copyfile(source,tarDir)
