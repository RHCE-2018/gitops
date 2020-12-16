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
#    '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev \
#    libclang-6.0-dev llvm-6.0 \
#    libgles2-mesa libgles2-mesa-dev \

# 解压安装包
tar -xvJf qt-everywhere-opensource-src-5.9.9.tar.xz
cd qt-everywhere-opensource-src-5.9.9

# 不可用
# ./configure -opensource -confirm-license -verbose -platform linux-g++-64 -debug \
#     -prefix /opt/qt5 -egl -no-eglfs -no-linuxfb \
#     -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus \
#     -nomake tests -nomake examples \
#     -plugin-sql-mysql -I /usr/include/mysql -L /usr/lib/x86_64-linux-gnu

# 可用
./configure -opensource -confirm-license -verbose -platform linux-g++-64 -debug \
    -prefix /opt/qt5 -egl -no-eglfs -no-linuxfb \
    -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus \
    -nomake tests -nomake examples \
    -opengl desktop -no-sql-mysql

#待测试1
./configure -opensource -confirm-license -verbose -platform linux-g++-64 -debug \
    -prefix /opt/qt5 -nomake examples -nomake tests -no-icu -no-openssl  -no-iconv -no-qml-debug -skip qtactiveqt 
    -skip qtconnectivity -skip qtdeclarative -skip qtdoc -skip qtenginio -skip qtgraphicaleffects 
    -skip qtimageformats -skip qtlocation -skip qtmultimedia -skip qtquick1 -skip qtquickcontrols 
    -skip qtscript -skip qtsensors -skip qtserialport -skip qtsvg -skip qttools -skip qttranslations 
    -skip qtwebchannel -skip qtwebengine -skip qtwebkit -skip qtwebkit-examples -skip qtwebsockets -skip qtxmlpatterns
    
#待测试2
./configure -opensource -confirm-license -verbose -platform linux-g++-64 -release \
    -prefix /opt/qt5/release/ -egl -no-eglfs -no-linuxfb \
    -skip qtdoc -skip qtwinextras -skip qtmacextras -skip qtandroidextras -skip qtserialbus \
    -nomake tests -nomake examples \
    -opengl desktop -no-sql-mysql

make -j$(nproc)
make install

# qt文件夹打包
tar cvf /opt/qt-opensource-ubuntu1804-x64-5.9.9.tar /opt/qt5
xz -z /opt/qt-opensource-ubuntu1804-x64-5.9.9.tar

# opt/qt5目录上传到H5AI
#scp -r local_dir username@servername:remote_dir

# 生成镜像(ubuntu:bionic)，上传镜像 


# Tips:

# 文件目录结构示意图
# archives/
#     /qt5
#         /5.9
#             /5.9.9
#                 /qt-opensource-windows-x86-5.9.9.exe
#                 /qt-opensource-linux-x64-5.9.9.run
#                 /qt-opensource-ubuntu1804-x64-5.9.9.tar
#                 # /qt-opensource-kylinV7-mips64el-5.9.9.tar
#                 # /qt-opensource-kylinV4-arm64-5.9.9.tar
#                 # /qt-opensource-kylinV10-arm64-5.9.9.tar
#                 /qt-everywhere-opensource-src-5.9.9.zip
#         /5.12
#             ...
#         /5.15
#             ...


# /xxx/xxx/xx/page/

# 5.9.9编译canbus时，需要Linux内核版本<5.2，否则install时报错error: ‘SIOCGSTAMP’ was not declared in this scope; did you mean ‘SIOCSARP’?

# 检测当前gcc编译器版本>= 4.9.x
# 检测脚本输入，取5.9.x中修订版本最大号