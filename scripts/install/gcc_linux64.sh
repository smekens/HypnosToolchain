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

echo 'INSTALL: gcc_linux64 ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/gcc/x86_64-linux-gnu/$gcc_version
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib64
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version

# bin

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-c++ $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-c++
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-cpp $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-cpp
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-g++ $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-g++
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-gcc $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-gcc

strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-c++
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-cpp
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-g++
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-gcc

# lib

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/gcc/x86_64-linux-gnu/$gcc_version/* $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/gcc/x86_64-linux-gnu/$gcc_version

# lib64

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib64/libgcc_s.so.1        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib64/libgcc_s.so.1
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib64/libobjc.a            $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib64/libobjc.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib64/libobjc.so.3.0.0     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib64/libobjc.so.3.0.0
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib64/libquadmath.a        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib64/libquadmath.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib64/libquadmath.so.0.0.0 $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib64/libquadmath.so.0.0.0

cd $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib64

ln -s libgcc_s.so.1 libgcc_s.so
ln -s libobjc.so.3.0.0 libobjc.so
ln -s libobjc.so.3.0.0 libobjc.so.3
ln -s libquadmath.so.0.0.0 libquadmath.so
ln -s libquadmath.so.0.0.0 libquadmath.so.0

cd $BASE

# libexec

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/* $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version

strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/cc1
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/cc1obj
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/cc1objplus
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/cc1plus
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/collect2
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/install-tools/fixincl
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/lto1
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/x86_64-linux-gnu/$gcc_version/lto-wrapper

#############################################################################

