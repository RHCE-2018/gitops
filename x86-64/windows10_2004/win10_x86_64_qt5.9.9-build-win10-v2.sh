#安装Windows下包管理器chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#安装mingw、python、perl、7zip
choco install -y mingw
choco install -y python2
choco install -y StrawberryPerl
choco install -y 7zip
#下载qt源码
python -c "import urllib; urllib.urlretrieve('http://iso.mirrors.ustc.edu.cn/qtproject/archive/qt/5.9/5.9.9/single/qt-everywhere-opensource-src-5.9.9.zip', 'qt-everywhere-opensource-src-5.9.9.zip');"

#重启以完成安装及环境变量配置
docker restart f12

#解压qt源码
7z x qt-everywhere-opensource-src-5.9.9.zip
cd qt-everywhere-opensource-src-5.9.9

# 可用/Release
cmd
configure -opensource -confirm-license -verbose -release -prefix C:\qt\qt5.9.9_x64 -platform win32-g++ -opengl desktop -no-angle -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus -nomake tests -nomake examples -no-qml-debug -skip qtquick1 -skip qtquickcontrols -skip qtsensors -qt-zlib

#编译
mingw32-make -j4
#安装
mingw32-make install

#设置环境变量
set path=%path%;C:\qt\qt5.9.9_x64\bin

harbor.sinux.com/opck/x86_64-windows-2004-qt5.9.9:1.0

#qmake -project QT+=widgets QT+=gui QT+=core QT+=charts
#qmake
#mingw32-make
#cd release
#用命令行编译只能用命令行运行，双击运行会报缺少dll的错误
#chartthemes.exe