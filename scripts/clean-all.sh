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
    rm -fr $HYPNOS_TOOLCHAIN/install/linux64/.HypnosToolchain
    ;;

  2*)
    rm -fr $HYPNOS_TOOLCHAIN/install/linux32/.HypnosToolchain
    ;;

  3*)
    rm -fr $HYPNOS_TOOLCHAIN/install/osx/.HypnosToolchain
    ;;

  5*)
    rm -fr $HYPNOS_TOOLCHAIN/install/mingw32/.HypnosToolchain
    ;;

  *)
    echo "Unsuperted target $TYPE"
    exit 1
    ;;
esac

#############################################################################

