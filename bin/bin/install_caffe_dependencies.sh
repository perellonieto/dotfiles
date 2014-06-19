#!/usr/bin/env bash

set -o pipefail
set -o errexit
# set -o xtrace

__DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"

PREFIX="${1:-Undefined}"

[ $# -eq 0 ] && { echo "Usage: $0 installation_dir" ; exit 1; }

# set -o nounset

INITIAL_PWD=${PWD}
LEVELDB=true
PROTOBUF=true
GLOG=true
SNAPPY=true

mkdir -p ${PREFIX}

#========================================#
# LEVELDB
#========================================#
cd ${INITIAL_PWD}
if [ ${LEVELDB} ]; then
    PROGRAM=leveldb
    LINK=https://leveldb.googlecode.com/files/leveldb-1.15.0.tar.gz
    FILENAME=${LINK##*/}
    FOLDER=leveldb-1.15.0

    wget ${LINK}
    tar -xvzf ${FILENAME}
    ln -s ${FOLDER} ${PROGRAM}
    cd ${PROGRAM}

    make
    cp ./libleveldb.so* ${PREFIX}/lib/
    cp -r include/leveldb ${PREFIX}/include/
fi

#========================================#
# PROTOBUF
#========================================#
cd ${INITIAL_PWD}
if [ ${PROTOBUF} ]; then
    PROGRAM=protobuf
    LINK=https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.bz2
    FILENAME=${LINK##*/}
    FOLDER=protobuf-2.5.0

    wget ${LINK}
    tar -xvf ${FILENAME}
    ln -s ${FOLDER} ${PROGRAM}
    cd ${PROGRAM}
    ./configure --prefix=${PREFIX}
    make
    make check
    make install
fi

#========================================#
# GOOGLE-GLOG
#========================================#
cd ${INITIAL_PWD}
if [ ${GLOG} ]; then
    PROGRAM=glog
    LINK=https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz
    FILENAME=${LINK##*/}
    FOLDER=glog-0.3.3

    wget ${LINK}
    tar -xvzf ${FILENAME}
    ln -s ${FOLDER} ${PROGRAM}
    cd ${PROGRAM}
    ./configure --prefix=${PREFIX}
    make
    make install
fi

#========================================#
# SNAPPY
#========================================#
cd ${INITIAL_PWD}
if [ ${SNAPPY} ]; then
    PROGRAM=snappy
    LINK=https://snappy.googlecode.com/files/snappy-1.1.1.tar.gz
    FILENAME=${LINK##*/}
    FOLDER=snappy-1.1.1

    wget ${LINK}
    tar -xvzf ${FILENAME}
    ln -s ${FOLDER} ${PROGRAM}
    cd ${PROGRAM}
    ./configure --prefix=${PREFIX}
    make
    make install
fi
