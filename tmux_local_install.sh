#!/bin/bash
# Source: https://gist.github.com/ryin/3106801
# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=2.1
LIBEVENT_VERSION=2.0.22
NCURSES_VERSION=6.0

TMUX_ARCHIVE=tmux-${TMUX_VERSION}.tar.gz
LIBEVENT_ARCHIVE=libevent-${LIBEVENT_VERSION}-stable.tar.gz
NCURSES_ARCHIVE=ncurses-${NCURSES_VERSION}.tar.gz

TEMP_DIR=/tmp

# create our directories
mkdir -p $HOME/local ${TEMP_DIR}
cd ${TEMP_DIR}

# download source files for tmux, libevent, and ncurses

wget -O ${TMUX_ARCHIVE} --no-check-certificate https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/${TMUX_ARCHIVE}
wget -O ${LIBEVENT_ARCHIVE} --no-check-certificate https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}-stable/${LIBEVENT_ARCHIVE}
wget -O ${NCURSES_ARCHIVE} ftp://ftp.gnu.org/gnu/ncurses/${NCURSES_ARCHIVE}



# extract files, configure, and compile

############
# libevent #
############
tar xvzf ${LIBEVENT_ARCHIVE}
cd libevent-${LIBEVENT_VERSION}-stable
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..

############
# ncurses  #
############
tar xvzf ${NCURSES_ARCHIVE}
cd ncurses-${NCURSES_VERSION}
./configure --prefix=$HOME/local
make
make install
cd ..

############
# tmux     #
############
tar xvzf ${TMUX_ARCHIVE}
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
cp tmux $HOME/local/bin
cd ..

# cleanup
rm -rf ${TEMP_DIR}

echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH."
