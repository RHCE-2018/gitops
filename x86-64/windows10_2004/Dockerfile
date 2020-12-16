FROM mcr.microsoft.com/windows/servercore:2004
LABEL Description="Windows Server Core development environment Qt, Chocolatey control"

#安装chocolatey包管理器
RUN powershell -NoProfile -ExecutionPolicy Bypass -Command \
    $Env:chocolateyVersion = '0.10.8' ; \
    $Env:chocolateyUseWindowsCompression = 'false' ; \
    "[Net.ServicePointManager]::SecurityProtocol = \"tls12, tls11, tls\"; iex ((New-Object System.Net.WebClient).DownloadString('http://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

#安装依赖软件
RUN  choco install -y mingw &&  choco install -y python2 &&  choco install -y StrawberryPerl &&  choco install -y 7zip

#重启以完成安装及环境变量配置
#RUN docker restart f12

#下载qt源码、解压qt源码、切换至cmd、可用/Release、编译、安装、删除
RUN python -c "import urllib; urllib.urlretrieve('http://iso.mirrors.ustc.edu.cn/qtproject/archive/qt/5.9/5.9.9/single/qt-everywhere-opensource-src-5.9.9.zip', 'qt-everywhere-opensource-src-5.9.9.zip');" &&  7z x qt-everywhere-opensource-src-5.9.9.zip &&  cd qt-everywhere-opensource-src-5.9.9 && cmd &&  configure -opensource -confirm-license -verbose -release -prefix C:\qt\qt5.9.9_x64 -platform win32-g++ -opengl desktop -no-angle -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus -nomake tests -nomake examples -no-qml-debug -skip qtquick1 -skip qtquickcontrols -skip qtsensors -qt-zlib &&  mingw32-make -j4 &&  mingw32-make install
 && del/s/q C:\qt-everywhere-opensource-src-5.9.9\*.* && rd/s/q C:\qt-everywhere-opensource-src-5.9.9 && qt-everywhere-opensource-src-5.9.9.zip
#设置环境变量
RUN set path=%path%;C:\qt\qt5.9.9_x64\bin

