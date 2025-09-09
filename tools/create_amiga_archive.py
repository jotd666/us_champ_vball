import subprocess,os,glob,shutil,pathlib

progdir = pathlib.Path(os.path.abspath(os.path.join(os.path.dirname(__file__),os.pardir)))

gamename = "us_champ_vball"
# JOTD path for cranker, adapt to wh :)
os.environ["PATH"] += os.pathsep+r"K:\progs\cli"

cmd_prefix = ["make","-f",os.path.join(progdir,"makefile.am")]

subprocess.check_call(cmd_prefix+["clean"],cwd=os.path.join(progdir,"src"))

##for s in ["convert_sounds.py","convert_graphics.py"]:
##    subprocess.check_call(["cmd","/c",s],cwd=os.path.join(progdir,"assets","amiga"))

subprocess.check_call(cmd_prefix+["RELEASE_BUILD=1"],cwd=os.path.join(progdir,"src"))
# create archive

outdir = progdir / f"{gamename}_HD"

if outdir.exists():
    shutil.rmtree(outdir)
outdir.mkdir(exist_ok=True)
datadir = outdir / "data"
datadir.mkdir()

for file in ["readme.md",f"{gamename}.slave"]:
    shutil.copy(os.path.join(progdir,file),outdir)

#shutil.copy(os.path.join(progdir,"assets","amiga",f"Lock'N'Chase.info"),outdir)
datain = progdir/"data"

for suffix in ["000"]: #,"020"]:
    # pack the file for floppy
    exename = f"{gamename}_{suffix}"
    subprocess.check_output(["cranker_windows.exe","-f",str(datain/exename),"-o",str(progdir/f"{exename}.rnc")])

pack_data = True

for p in ["bobs_*","tiles_*","palette_*","net_*","us_champ_vball_*"]:
    for sourcefile in datain.glob(p):
    # -= RNC ProPackED v1.8 [by Lab 313] (01/26/2021) =-
        destfile = outdir / "data" / sourcefile.name
        with open(sourcefile,"rb") as f:
            header = f.read(3).decode(errors="ignore")
        if header=="RNC" or not pack_data or sourcefile.name.startswith("palette_"):
            # already packed/do not pack
            print(f"Copying {destfile}...")
            shutil.copy(sourcefile,destfile)
        else:
            cmd = ["propack","p",str(sourcefile),str(destfile)]
            print(f"Packing {destfile}...")
            p = subprocess.run(cmd,check=False,stdout=subprocess.DEVNULL)
            if p.returncode:
                print(f"failed packing {destfile}")
                shutil.copy(sourcefile,destfile)

subprocess.check_call(cmd_prefix+["clean"],cwd=progdir/"src")

