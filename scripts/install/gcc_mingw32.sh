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

echo 'INSTALL: gcc_mingw32 ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/gcc/i686-mingw32/$gcc_version
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version

# bin

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-c++ $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-c++
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-cpp $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-cpp
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-g++ $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-g++
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-gcc $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-gcc

strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-c++
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-cpp
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-g++
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-gcc

# lib

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/gcc/i686-mingw32/$gcc_version/* $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/gcc/i686-mingw32/$gcc_version

# i686-mingw32

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/libgcc_s.a         $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib/libgcc_s.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/libgcc_s_dw2-1.dll $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib/libgcc_s_dw2-1.dll
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/libobjc-3.dll      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib/libobjc-3.dll
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/libobjc.a          $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib/libobjc.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/libobjc.dll.a      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib/libobjc.dll.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/libquadmath-0.dll  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib/libquadmath-0.dll
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/libquadmath.a      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib/libquadmath.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/libquadmath.dll.a  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib/libquadmath.dll.a

# libexec

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/* $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version

strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/cc1
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/cc1obj
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/cc1objplus
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/cc1plus
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/collect2
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/install-tools/fixincl
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/lto1
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/gcc/i686-mingw32/$gcc_version/lto-wrapper

#############################################################################

