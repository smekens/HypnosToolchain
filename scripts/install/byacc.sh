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

echo 'INSTALL: byacc ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/yacc $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/yacc

strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/yacc

cd $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin

ln -s yacc bison

cd $BASE

#############################################################################

