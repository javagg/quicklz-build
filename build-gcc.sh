#!/bin/bash
VER=150
ARCH=$(uname -m)
if [ $ARCH == 'x86_64' ]; then
  ARCH="64"
else
  ARCH="32"
fi
COMPRESSION=3
BUFFER=0
SAFE=0
OUTPUT=libquicklz${VER}_${ARCH}_${COMPRESSION}
if [ $BUFFER != 0 ]; then
  OUTPUT=${OUTPUT}_${BUFFER}
fi
if [ $SAFE != 0 ]; then
  OUTPUT=${OUTPUT}_safe
fi
OUTPUT=${OUTPUT}.so
gcc -DQLZ_COMPRESSION_LEVEL=${COMPRESSION} -DQLZ_STREAMING_BUFFER=${BUFFER} -DQLZ_MEMORY_SAFE=${SAFE} quicklz.c -fPIC -shared -o ${OUTPUT}
