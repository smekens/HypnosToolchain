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

rm -fr $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain

#install/bash.sh $TYPE
#install/sed.sh $TYPE
#install/grep.sh $TYPE
#install/make.sh $TYPE
#install/flex.sh $TYPE
#install/byacc.sh $TYPE
#install/coreutils.sh $TYPE

install/gmp.sh $TYPE
install/mpfr.sh $TYPE
install/mpc.sh $TYPE

#install/binutils_linux64.sh $TYPE
#install/binutils_linux32.sh $TYPE
#install/binutils_mingw32.sh $TYPE
install/binutils_android.sh $TYPE

#install/gcc_linux64.sh $TYPE
#install/gcc_linux32.sh $TYPE
#install/gcc_mingw32.sh $TYPE
install/gcc_android.sh $TYPE

#############################################################################

