#!/bin/sh

#############################################################################

if [[ $# == 0 ]]
then
  echo "Build for target:"
#  echo "    Linux 64     : 1"
  echo "    Linux 32     : 2"
  echo "    Mac OSX      : 3"
#  echo "    MinGW 64     : 4"
  echo "    MinGW 32     : 5"
  echo "    Android      : 6"
#  echo "    IOS          :7
  read TYPE
else
  TYPE=$1
fi

#############################################################################

case $TYPE
in
  1*)
    export GCC=gcc
    export GXX=g++
    export ACC=gcc
    export AXX=g++

    export AR=ar
    export RANLIB=ranlib

    export HYPNOS_TARGET=linux64
    export HYPNOS_TARGET_BUILD=linux64
    ;;

  2*)
    export GCC=gcc
    export GXX=g++
    export ACC=gcc
    export AXX=g++

    export AR=ar
    export RANLIB=ranlib

    export HYPNOS_TARGET=linux32
    export HYPNOS_TARGET_BUILD=linux32
    ;;

  3*)
    export GCC=gcc
    export GXX=g++
    export ACC=gcc
    export AXX=g++

    export AR=ar
    export RANLIB=ranlib

    export HYPNOS_TARGET=osx
    export HYPNOS_TARGET_BUILD=osx
    ;;

  4*)
    export GCC=gcc
    export GXX=g++
    export ACC=gcc
    export AXX=g++

    export AR=ar
    export RANLIB=ranlib

    export HYPNOS_TARGET=mingw64
    export HYPNOS_TARGET_BUILD=mingw64
    ;;

  5*)
    export GCC=gcc
    export GXX=g++
    export ACC=gcc
    export AXX=g++

    export AR=ar
    export RANLIB=ranlib

    export HYPNOS_TARGET=mingw32
    export HYPNOS_TARGET_BUILD=mingw32
    ;;

  6*)
    export GCC=gcc
    export GXX=g++
    export ACC=gcc
    export AXX=g++

    export AR=ar
    export RANLIB=ranlib

    export HYPNOS_TARGET=android
    export HYPNOS_TARGET_BUILD=android
    ;;

  7*)
    export GCC=gcc
    export GXX=g++
    export ACC=gcc
    export AXX=g++

    export AR=ar
    export RANLIB=ranlib

    export HYPNOS_TARGET=ios_sim
    export HYPNOS_TARGET_BUILD=ios
    ;;

  *)
    echo "Unsuperted target $TYPE"
    exit 1
    ;;
esac

#############################################################################

export CC=$GCC
export CXX=$GXX

#############################################################################

