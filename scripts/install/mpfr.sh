#!/bin/bash

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

echo 'INSTALL: mpfr ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/include
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/include/mpfr.h $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/include/mpfr.h
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/libmpfr.a $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/libmpfr.a

#############################################################################

