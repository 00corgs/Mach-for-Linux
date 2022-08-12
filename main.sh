#/bin/bash

echo "This shell script downloads files from https://opensource.apple.com and places them in /use/local/include/."
echo "Are you continue? (y|n)"
read yn
case "$yn" in
    [yY]*) echo "downloading..."
    ;;
    *) echo "Exiting..."
    exit 1
    ;;
esac
mkdir .tmp-mach-for-linux
mkdir .tmp-mach-for-linux/mach/
mkdir .tmp-mach-for-linux/mach-o/

curl -OL -o ./.tmp-mach-for-linux/mach/ https://opensource.apple.com/source/xnu/xnu-4570.41.2/osfmk/mach/machine.h
curl -OL -o ./.tmp-mach-for-linux/mach/ https://opensource.apple.com/source/xnu/xnu-4570.41.2/osfmk/mach/vm_prot.h
curl -OL -o ./.tmp-mach-for-linux/mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/fat.h
curl -OL -o ./.tmp-mach-for-linux/mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/loader.h
curl -OL -o ./.tmp-mach-for-linux/mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/nlist.h
curl -OL -o ./.tmp-mach-for-linux/mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/reloc.h
curl -OL -o ./.tmp-mach-for-linux/mach-o/ https://opensource.apple.com/source/xnu/xnu-4570.71.2/EXTERNAL_HEADERS/mach-o/stab.h

sudo mv ./.tmp-mach-for-linux/mach /usr/local/include/
sudo mv ./.tmp-mach-for-linux/mach-o /usr/local/include/
sudo rm -rf ./.tmp-mach-for-linux
echo "Done."
