#安装mingw、python、perl

# 可用/Release
configure -opensource -confirm-license -verbose -release -prefix C:\qt\qt5.9.9_x64 -platform win32-g++ -opengl desktop -no-angle -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus -nomake tests -nomake examples -no-qml-debug -skip qtquick1 -skip qtquickcontrols -skip qtsensors -qt-zlib

#编译
mingw32-make -j4
#安装
mingw32-make install

#设置环境变量
set path=%path%;C:\qt\qt5.9.9_x64\bin

#qmake -project QT+=widgets QT+=gui QT+=core QT+=charts
#qmake
#mingw32-make
#cd chartthemes
#用命令行编译只能用命令行运行，双击运行会报缺少dll的错误
#chartthemes.exe