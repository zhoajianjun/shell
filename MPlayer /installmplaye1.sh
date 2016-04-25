#!/bin/bash
dir_tmp="/root/installmplayer"
if [!-d"$dir_tmp"]; then
mkdir "$dir_tmp"
fi
cp -rf mplayerpackager.tar.gz $dir_tmp
cd $dir_tmp
tar -zxvf mplayerpackager.tar.gz
cd mplayerpackager
tar -zxvf yasm-1.2.0.tar.gz
cd  yasm-1.2.0
./configure
make
make install
cd $dir_tmp
cd mplayerpackager
tar -zxvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure
make
make install
cd $dir_tmp
cd mplayerpackager
tar -zxvf ffmpeg-1.2.12.tar.gz
cd ffmpeg-1.2.12
./configure
make
make install
cd /usr/local/lib/
codecs1="/usr/local/lib/codecs"
if [!-d"$codecs1"]; then
mkdir "$codecs1"
fi
cd $dir_tmp
cd mplayerpackager
tar -jxvf all-20110131.tar.bz2
cp -rf all-20110131/* /usr/local/lib/codecs
cd $dir_tmp
cd mplayerpackager
 tar -zxvf MPlayer-1.1.1.tar.gz
cd MPlayer-1.1.1
./configure --enable-gui --codecsdir=/usr/local/lib/codecs --enable-menu --prefix=/usr --language=all
make
make install

cd /usr/share/mplayer/skins/
default1="/usr/share/mplayer/skins/default"
if [!-d"$default1"];then
mkdir "$default"
fi
cd $dir_tmp
cd mplayerpackager
tar -jxvf Corelian-1.2.tar.bz2
cp Corelian/* /usr/share/mplayer/skins/default

