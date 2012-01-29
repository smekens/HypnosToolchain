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
    # OK
    ;;

  2*)
    # OK
    ;;

  3*)
    # OK
    ;;

  5*)
    # OK
    ;;

  *)
    echo "Unsuperted target $TYPE"
    exit 1
    ;;
esac

#############################################################################

build/bash.sh $TYPE
#build/sed.sh $TYPE
#build/grep.sh $TYPE
#build/make.sh $TYPE
#build/flex.sh $TYPE
#build/byacc.sh $TYPR
#build/coreutils.sh $TYPE
#
#build/gmp.sh $TYPE
#build/mpfr.sh $TYPE
#build/mpc.sh $TYPE
# 
#build/binutils_linux64.sh $TYPE
#build/binutils_linux32.sh $TYPE
#build/binutils_mingw32.sh $TYPE
#build/binutils_android.sh $TYPE
#
#build/gcc_linux64.sh $TYPE
#build/gcc_linux32.sh $TYPE
#build/gcc_mingw32.sh $TYPE
#build/gcc_android.sh $TYPE

#############################################################################

