#!/bin/bash

#
# Build script for Linux x64
# Usage: Run from Moai SDK's root directory:
#
# build-linux-glut.sh
#
# You can change the CMake options using -DOPTION=VALUE
# Check moai-dev/cmake/CMakeLists.txt for all the available options.
#

cd `dirname $0`/..
cd cmake
rm -rf build
mkdir build
cd build
cmake \
-DBUILD_LINUX=TRUE \
-DMOAI_BOX2D=TRUE \
-DMOAI_CHIPMUNK=TRUE \
-DMOAI_CURL=TRUE \
-DMOAI_CRYPTO=TRUE \
-DMOAI_EXPAT=TRUE \
-DMOAI_FREETYPE=TRUE \
-DMOAI_JSON=TRUE \
-DMOAI_JPG=TRUE \
-DMOAI_MONGOOSE=TRUE \
-DMOAI_OGG=TRUE \
-DMOAI_OPENSSL=TRUE \
-DMOAI_SQLITE3=TRUE \
-DMOAI_TINYXML=TRUE \
-DMOAI_PNG=TRUE \
-DMOAI_SFMT=TRUE \
-DMOAI_VORBIS=TRUE \
-DMOAI_UNTZ=TRUE \
-DMOAI_LUAJIT=TRUE \
-DCMAKE_BUILD_TYPE=Release \
../

VERBOSE=1 make -j6
if [[ $? -ne 0 ]]; then
    exit 1
fi

#
# Copy libs to lib
#
rm -rf ../../release/linux/host-glut/x64/
mkdir -p ../../release/linux/host-glut/x64/lib/
mkdir -p ../../release/linux/host-glut/x64/bin/
for i in * ; do
  if [ -d "$i" ]; then
    if [ -f $i/lib$i.a ]; then
      echo "Copying $i/lib$i.a to release/linux/host-glut/x64/lib"
      cp $i/lib$i.a ../../release/linux/host-glut/x64/lib/
    fi
  fi
done
pwd
cp host-glut/moai ../../release/linux/host-glut/x64/bin/
