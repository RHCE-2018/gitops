# 更新软件包管理器源
#mv /etc/apt/sources.list /etc/apt/sources.list.bak
#cp /root/aliyun.list /etc/apt/sources.list
apt-get update

curl -O http://mirrors.ustc.edu.cn/qtproject/archive/qt/5.9/5.9.9/single/qt-everywhere-opensource-src-5.9.9.tar.xz

# 安装编译依赖
apt-get install -y git perl python \
    libxcb-xinerama0-dev build-essential \
    libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev \
    flex bison gperf libicu-dev libxslt-dev ruby \
    libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libdbus-1-dev libfontconfig1-dev libcap-dev libxtst-dev libpulse-dev libudev-dev libpci-dev libnss3-dev libasound2-dev libxss-dev libegl1-mesa-dev gperf bison \
    libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \

# 解压安装包
tar -xvJf qt-everywhere-opensource-src-5.9.9.tar.xz
cd qt-everywhere-opensource-src-5.9.9


# 可用//359M//Release
./configure -opensource -confirm-license -verbose -platform linux-g++-64 -release \
    -prefix /opt/qt5/release/ -egl -no-eglfs -no-linuxfb \
    -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus \
    -nomake tests -nomake examples \
    -opengl desktop -no-sql-mysql

make -j$(nproc)
make install

ln -s /opt/qt5/release/bin/qmake /usr/bin/

# qt文件夹打包
tar jcvf /opt/qt-opensource-ubuntu1804-x64-5.9.9.tar.xz /opt/qt5
