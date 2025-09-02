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


for suffix in ["000"]: #,"020"]:
    # pack the file for floppy
    exename = f"{gamename}_{suffix}"
    subprocess.check_output(["cranker_windows.exe","-f",str(progdir/"data"/exename),"-o",str(progdir/f"{exename}.rnc")])

for p in ["bobs_*","tiles_*","palette_*","us_champ_vball_*"]:
    for datafile in (progdir/"data").glob(p):
        print(datafile)
        shutil.copy(datafile,datadir)

subprocess.check_call(cmd_prefix+["clean"],cwd=progdir/"src")

