# 更新软件包管理器源
apt-get update && apt -y install curl

curl -O http://mirrors.ustc.edu.cn/qtproject/archive/qt/5.9/5.9.9/single/qt-everywhere-opensource-src-5.9.9.tar.xz

# 安装编译依赖
apt-get install -y git perl python libxcb-xinerama0-dev build-essential libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev flex bison gperf libicu-dev libxslt-dev ruby libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libdbus-1-dev libfontconfig1-dev libcap-dev libxtst-dev libpulse-dev libudev-dev libpci-dev libnss3-dev libasound2-dev libxss-dev libegl1-mesa-dev gperf bison libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libmysqlclient-dev zlib1g-dev vim

# 解压安装包
tar -xvJf qt-everywhere-opensource-src-5.9.9.tar.xz && cd qt-everywhere-opensource-src-5.9.9

# 可用/Release
./configure -opensource -confirm-license -verbose -release -prefix /opt/qt5/release/ -egl -no-eglfs -no-linuxfb -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus -nomake tests -nomake examples -plugin-sql-mysql -no-qml-debug -skip qtquick1 -skip qtquickcontrols -skip qtsensors

make -j$(nproc)
make install

rm -rf qt-everywhere-opensource-src-5.9.9*
rm -rf /usr/bin/qmake
ln -s /opt/qt5/release/bin/qmake /usr/bin/

# qt文件夹打包
#tar jcvf /opt/qt-opensource-kylin-v10-aarch64-5.9.9.tar.xz /opt/qt5
