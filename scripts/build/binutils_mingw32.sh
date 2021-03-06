#!/bin/bash

#############################################################################

source $HYPNOS_TOOLCHAIN/scripts/config.sh

SYSROOT=$HYPNOS_TOOLCHAIN/targets/mingw32/sysroot

PROGRAM_PREFIX=hypnos-mingw32-

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

    TOOLCHAIN_BUILD=x86_64-linux-gnu
    ;;

  2*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 2

    PREFIX=$HYPNOS_TOOLCHAIN/install/linux32/.HypnosToolchain

    TOOLCHAIN_BUILD=i686-linux-gnu
    ;;

  3*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 3

    PREFIX=$HYPNOS_TOOLCHAIN/install/osx/.HypnosToolchain

    TOOLCHAIN_BUILD=x86_64-apple-darwin11.2.0
    ;;

  5*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 5

    PREFIX=$HYPNOS_TOOLCHAIN/install/mingw32/.HypnosToolchain

    TOOLCHAIN_BUILD=i686-mingw32
    ;;

  *)
    echo "Unsuperted target $TYPE"
    exit 1
    ;;
esac

#############################################################################

install -d $HYPNOS_TOOLCHAIN/builds
cd $HYPNOS_TOOLCHAIN/builds

rm -fr binutils-$binutils_version
rm -fr binutils-build

tar xf $HYPNOS_TOOLCHAIN/srcs/$binutils_tarball
mkdir binutils-build

#############################################################################

echo '#############################################################################'
echo '# BINUTILS MING32                                                           #'
echo '#############################################################################'

cd $HYPNOS_TOOLCHAIN/builds/binutils-build

../binutils-$binutils_version/configure \
--prefix=$PREFIX \
--program-prefix=$PROGRAM_PREFIX \
--build=$TOOLCHAIN_BUILD \
--target=i686-mingw32 \
--with-sysroot=$SYSROOT \
--with-gmp=$PREFIX \
--with-mpfr=$PREFIX \
--with-mpc=$PREFIX \
--enable-initfini-array \
--disable-nls \
--disable-shared \
--disable-multilib

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

