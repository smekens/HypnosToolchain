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
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 1

    PREFIX=$HYPNOS_TOOLCHAIN/targets/linux64
    ;;

  2*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 2

    PREFIX=$HYPNOS_TOOLCHAIN/targets/linux32
    ;;

  3*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 3

    PREFIX=$HYPNOS_TOOLCHAIN/targets/osx
    ;;

  5*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 5

    PREFIX=$HYPNOS_TOOLCHAIN/targets/mingw32
    ;;

  *)
    echo "Unsuperted target $TYPE"
    exit 1
    ;;
esac

#############################################################################

install -d $HYPNOS_TOOLCHAIN/builds
cd $HYPNOS_TOOLCHAIN/builds

rm -fr coreutils-$coreutils_version
rm -fr coreutils-build

tar xf $HYPNOS_TOOLCHAIN/srcs/$coreutils_tarball
mkdir coreutils-build

#############################################################################

echo '#############################################################################'
echo '# CORE UTILS                                                                #'
echo '#############################################################################'

cd $HYPNOS_TOOLCHAIN/builds/coreutils-build

../coreutils-$coreutils_version/configure \
--prefix=$PREFIX

if [ $? != 0 ] ; then
    echo "Error while trying to configure toolchain build."
    exit 1
fi

make -j$CORES

if [ $? != 0 ] ; then
    echo "Error while trying to configure toolchain build."
    exit 1
fi

make install

cd $BASE

#############################################################################

