# 更新软件包管理器源
apt-get update && apt -y install curl

curl -O http://mirrors.ustc.edu.cn/qtproject/archive/qt/5.9/5.9.9/single/qt-everywhere-opensource-src-5.9.9.tar.xz

# 安装编译依赖
apt-get install -y git perl python libxcb-xinerama0-dev build-essential libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev flex bison gperf libicu-dev libxslt-dev ruby libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libdbus-1-dev libfontconfig1-dev libcap-dev libxtst-dev libpulse-dev libudev-dev libpci-dev libnss3-dev libasound2-dev libxss-dev libegl1-mesa-dev gperf bison libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libmysqlclient-dev zlib1g-dev libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools  '^libxcb.*-dev'
# 解压安装包
tar -xvJf qt-everywhere-opensource-src-5.9.9.tar.xz && cd qt-everywhere-opensource-src-5.9.9

# 不可用/Release
./configure -opensource -confirm-license -verbose -release -platform linux-g++ -prefix /opt/qt5/release/ -egl -eglfs -no-linuxfb -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus -xcb -nomake tests -nomake examples -plugin-sql-mysql -skip qtquick1 -skip qtquickcontrols -skip qtsensors -skip qtwebengine

make -j$(nproc)
make install

rm -rf /usr/bin/qmake
ln -s /opt/qt5/release/bin/qmake /usr/bin/

# qt文件夹打包
tar jcvf /opt/qt-opensource-ubuntu1804-x64-5.9.9.tar.xz /opt/qt5
