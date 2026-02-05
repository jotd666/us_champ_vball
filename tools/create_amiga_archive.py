import subprocess,os,glob,shutil,pathlib,sys

progdir = pathlib.Path(os.path.abspath(os.path.join(os.path.dirname(__file__),os.pardir)))

assets_dir = progdir / "assets/amiga"

sys.path.append(str(assets_dir))
import convert_graphics,convert_sounds

skip_data_files = False

# generate graphics
if not skip_data_files:
    convert_graphics.doit()
    convert_sounds.doit()

gamename = "us_champ_vball"
# JOTD path for cranker, adapt to wh :)
# os.environ["PATH"] += os.pathsep+r"K:\progs\cli"

cmd_prefix = ["make","-f",os.path.join(progdir,"makefile.am")]

subprocess.check_call(cmd_prefix+["clean"],cwd=os.path.join(progdir,"src"))


subprocess.check_call(cmd_prefix+["RELEASE_BUILD=1"],cwd=os.path.join(progdir,"src"))
# create archive

def distribute(suffix):
    outdir = progdir / f"{gamename}_{suffix}_HD"
    print(f"Creating {outdir}...")
    chipset = "ecs" if suffix == "ecs" else "aga"

    if not skip_data_files:
        if outdir.exists():
            shutil.rmtree(outdir)
    outdir.mkdir(exist_ok=True)
    datadir = outdir / "data"
    datadir.mkdir(exist_ok=True)

    for file in ["readme.md",f"{gamename}_{chipset}.slave"]:
        shutil.copy(os.path.join(progdir,file),outdir)

    shutil.copy(os.path.join(progdir,"assets","amiga",f"USChampionshipVball{chipset.upper()}.info"),outdir)
    datain = progdir/"data"/suffix

    for suffix in ["000"]: #,"020"]:
        # pack the file for floppy
        exename = f"{gamename}_{suffix}"
        subprocess.check_output(["cranker_windows.exe","-f",str(datain/exename),"-o",str(progdir/f"{exename}.rnc")])

    pack_data = True

    files = ["us_champ_vball_*"]
    if not skip_data_files:
        files += ["bobs_*","tiles_*","palette_*","net_*"]

    for p in files:
        for sourcefile in datain.glob(p):
        # -= RNC ProPackED v1.8 [by Lab 313] (01/26/2021) =-
            destfile = datadir / sourcefile.name
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
    # copy modules (no packing required)
    for p in (assets_dir.parent / "sounds").glob("*.mod"):
        print(f"copying module {p}")
        destfile = datadir / p.name
        shutil.copy(p,destfile)

for v in ["ecs","aga_64","aga_128"]:
    distribute(v)


subprocess.check_call(cmd_prefix+["clean"],cwd=progdir/"src")

