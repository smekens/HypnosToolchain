#!/bin/bash

#############################################################################

source $HYPNOS_TOOLCHAIN/scripts/config.sh

#############################################################################

if [[ $# == 0 ]]
then
  echo "Build for target:"
  echo "    Linux 64     : 1"
  echo "    Linux 32     : 2"
  echo "    Mac OSX      : 3"
#  echo "    MinGW 64     : 4"
  echo "    MinGW 32     : 5"

  read TYPE
else
  TYPE=$1
fi

#############################################################################

case $TYPE
in
  1*)
    TARGET=linux64
    ;;

  2*)
    TARGET=linux32
    ;;

  3*)
    TARGET=osx
    ;;

  5*)
    TARGET=mingw32
    ;;

  *)
    echo "Unsuperted target $TYPE"
    exit 1
    ;;
esac

#############################################################################

echo 'INSTALL: gcc_android ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/gcc/arm-linux-androideabi/$gcc_version
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/lib
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/sysroot

# bin

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-c++ $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-c++
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-cpp $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-cpp
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-g++ $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-g++
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-gcc $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-gcc

strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-c++
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-cpp
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-g++
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-gcc

# lib

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/gcc/arm-linux-androideabi/$gcc_version/* $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/gcc/arm-linux-androideabi/$gcc_version

# arm-linux-androideabi

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/lib/libgcc_s.so.1        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/lib/libgcc_s.so.1
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/lib/libobjc.a            $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/lib/libobjc.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/lib/libobjc.so.3.0.0     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/lib/libobjc.so.3.0.0

cd $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/lib

ln -s libgcc_s.so.1 libgcc_s.so
ln -s libobjc.so.3.0.0 libobjc.so
ln -s libobjc.so.3.0.0 libobjc.so.3

cd $BASE

# libexec

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/* $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version

strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/cc1
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/cc1obj
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/cc1objplus
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/cc1plus
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/collect2
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/install-tools/fixincl
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/lto1
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/arm-linux-androideabi/$gcc_version/lto-wrapper

# sysroot

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/sysroot/android $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/sysroot

#############################################################################

