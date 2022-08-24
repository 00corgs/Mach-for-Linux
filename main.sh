#!/bin/bash

#If you want to change the installation directory, change here.
install="/usr/local/include/"

echo "This shell script downloads files from https://opensource.apple.com and places them in $install."
echo "If you want to change the installation directory, edit this file."
echo "Are you continue? (y|n)"
read -r yn
case "$yn" in
    [yY]*) echo "downloading..."
    ;;
    *) echo "Exiting..."
    exit 1
    ;;
esac

mkdir mach/
mkdir mach-o/

curl -OL -o mach/ https://opensource.apple.com/source/xnu/xnu-4570.41.2/osfmk/mach/machine.h
curl -OL -o mach/ https://opensource.apple.com/source/xnu/xnu-4570.41.2/osfmk/mach/vm_prot.h
curl -OL -o mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/fat.h
curl -OL -o mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/loader.h
curl -OL -o mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/nlist.h
curl -OL -o mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/reloc.h
curl -OL -o mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/stab.h

sudo mv ./mach "$install"
sudo mv ./mach-o "$install"

echo "Done."
