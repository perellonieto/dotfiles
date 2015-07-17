#!/bin/bash

INDIR=$1
OUTDIR=$2

echo "Cloning leveldb in ${INDIR} to ${OUTDIR}"

INPATH=`pwd -P ${INDIR}`

mkdir -p ${OUTDIR}
ln -s ${INPATH}/*.sst ${OUTDIR}/
cp ${INPATH}/{CURRENT,LOCK,LOG,MANIFEST-*} ${OUTDIR}/
