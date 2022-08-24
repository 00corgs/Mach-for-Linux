#!/bin/bash
#If you changed the installation directory, change here.
uninstall="/usr/local/include/"

echo "Installed directory is $uninstall"
echo "If you changed install directory, edit this file."
echo "Are you continue?(y|n)"
read -r yn
case "$yn" in
    [yY]*) echo "Removing..." ;;
    *) echo "Abort"
    exit 1 ;;
esac

sudo rm -rf "$uninstall"/mach/
sudo rm -rf "$uninstall"/mach-o/

echo "Done"