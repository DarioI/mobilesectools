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
cd ../

# Install JTool
echo "###### INSTALLING JTOOL ######"
mkdir -p jtool
cd jtool
echo "Downloading jtool ..."
curl -LOk http://www.newosxbook.com/tools/jtool.tar
echo "Installing jtool ..."
tar -xvf jtool.tar
cp jtool /usr/local/bin
chmod +x /usr/local/bin/jtool
cd ../

# Install peda-gdb
echo "###### INSTALLING PEDA GDB ######"
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit


# Install APKid
echo "###### INSTALLING APKiD ######"
git clone https://github.com/rednaga/yara-python
cd yara-python
python setup.py install
pip install apkid
cd ../

# Install mitmproxy
echo "###### Installing mitmproxy ######"
pip install mitmproxy

# Install Voltron
echo "###### Installing Voltron ######"
git clone https://github.com/snare/voltron
cd voltron
./install.sh
cd ../

# Install pwndbg
echo "###### Installing pwndbg"
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
