#!/bin/bash
# Some tools need sudo rights to install
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Install Nathan
echo "###### INSTALLING NATHAN ######"
echo "Downloading Nathan ..."
git clone https://github.com/mseclab/nathan/
cd nathan
echo "Installing Nathan ..."
./nathan.py init
cd ../

# Install APKTool
echo "###### INSTALLING APKTOOL ######"
mkdir -p apktool
cd apktool
echo "Downloading APKTool ..."
$(curl -O https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool)
$(curl -LOk https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.2.1.jar)
echo "Installing APKTool in /usr/local/bin ..."
mv apktool_2.2.1.jar apktool.jar
cp apktool.jar /usr/local/bin
cp apktool /usr/local/bin
chmod +x /usr/local/bin/apktool.jar
chmod +x /usr/local/bin/apktool
cd ../

# Install baksmali
echo "###### INSTALLING BYTECODEVIEWER ######"
mkdir -p bytecodeviewer
cd bytecodeviewer
echo "Downloading Bytecodeviewer ..."
$(curl -LOk https://github.com/Konloch/bytecode-viewer/releases/download/v2.9.8/BytecodeViewer.2.9.8.zip)
echo "Installing Bytecodeviewer ..."
$(unzip *.zip) 
$(find . -type f -not -name '*jar' -print0 | xargs -0 rm --)

