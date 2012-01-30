#!/bin/bash

#############################################################################

source ./config.sh

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

    PREFIX=$HYPNOS_TOOLCHAIN/install/linux64/.HypnosToolchain
    ;;

  2*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 2

    PREFIX=$HYPNOS_TOOLCHAIN/install/linux32/.HypnosToolchain
    ;;

  3*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 3

    PREFIX=$HYPNOS_TOOLCHAIN/install/osx/.HypnosToolchain
    ;;

  5*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 5

    PREFIX=$HYPNOS_TOOLCHAIN/install/mingw32/.HypnosToochain
    ;;

  *)
    echo "Unsuperted target $TYPE"
    exit 1
    ;;
esac

#############################################################################

install -d $HYPNOS_TOOLCHAIN/builds
cd $HYPNOS_TOOLCHAIN/builds

rm -fr mpfr-$mpfr_version
rm -fr mpfr-build

tar xf $HYPNOS_TOOLCHAIN/srcs/$mpfr_tarball
mkdir mpfr-build

#############################################################################

echo '#############################################################################'
echo '# MPFR                                                                      #'
echo '#############################################################################'

cd $HYPNOS_TOOLCHAIN/builds/mpfr-build

../mpfr-$mpfr_version/configure \
--prefix=$PREFIX \
--with-gmp=$PREFIX \
--disable-shared

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

