FROM  ubuntu:16.04
USER  root
WORKDIR /root
MAINTAINER ck.sinux.com wufei@sinux.com
ENV  TZ=Asia/Shanghai
RUN  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN  apt-get update  && apt-get upgrade -y &&  apt-get install -y git perl python \
    libxcb-xinerama0-dev build-essential \
    libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev \
    flex bison gperf libicu-dev libxslt-dev ruby \
    libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libdbus-1-dev libfontconfig1-dev libcap-dev libxtst-dev libpulse-dev libudev-dev libpci-dev libnss3-dev libasound2-dev libxss-dev libegl1-mesa-dev gperf bison \
    libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    libmysqlclient-dev
RUN  curl -O http://mirrors.ustc.edu.cn/qtproject/archive/qt/5.9/5.9.5/single/qt-everywhere-opensource-src-5.9.5.tar.xz &&  tar -xvJf qt-everywhere-opensource-src-5.9.5.tar.xz && cd qt-everywhere-opensource-src-5.9.5 && ./configure -opensource -confirm-license -verbose -platform linux-g++-64 -release \
    -prefix /opt/qt5/release/ -egl -no-eglfs -no-linuxfb \
    -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus \
    -nomake tests -nomake examples \
    -opengl desktop -plugin-sql-mysql \
    -no-qml-debug -skip qtquick1 -skip qtquickcontrols -skip qtsensors && make -j$(nproc) && make install &&  rm -rf /root/qt-everywhere-opensource-src-5.9.5*
RUN  ln -s /opt/qt5/release/bin/qmake /usr/bin/

