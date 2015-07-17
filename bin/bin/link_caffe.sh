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

mkdir -p ${PREFIX}/include
mkdir -p ${PREFIX}/lib

ln -s /share/imagedb/perellm1/caffe/caffe/build/lib/libcaffe.* ${PREFIX}/lib
ln -s /share/imagedb/perellm1/caffe/caffe/include/caffe ${PREFIX}/include/caffe
