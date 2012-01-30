#!/bin/bash

#############################################################################

source $HYPNOS_TOOLCHAIN/scripts/config.sh

PROGRAM_PREFIX=hypnos-linux64-

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

    SYSROOT=$PREFIX/sysroot/linux64

    TOOLCHAIN_BUILD=x86_64-linux-gnu
    ;;

  2*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 2

    PREFIX=$HYPNOS_TOOLCHAIN/install/linux32/.HypnosToolchain

    SYSROOT=$PREFIX/sysroot/linux64

    TOOLCHAIN_BUILD=i686-linux-gnu
    ;;

  3*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 3

    PREFIX=$HYPNOS_TOOLCHAIN/install/osx/.HypnosToolchain

    SYSROOT=$PREFIX/sysroot/linux64

    TOOLCHAIN_BUILD=x86_64-apple-darwin11.2.0
    ;;

  5*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 5

    PREFIX=$HYPNOS_TOOLCHAIN/install/mingw32/.HypnosToolchain

    SYSROOT=$PREFIX/sysroot/linux64

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

rm -fr gcc-$gcc_version
rm -fr gcc-build

tar xf $HYPNOS_TOOLCHAIN/srcs/$gcc_core_tarball
tar xf $HYPNOS_TOOLCHAIN/srcs/$gcc_gpp_tarball
tar xf $HYPNOS_TOOLCHAIN/srcs/$gcc_objc_tarball
mkdir gcc-build

install -d $SYSROOT
cp -r $HYPNOS_TOOLCHAIN/sysroot/linux64/* $SYSROOT

#############################################################################
# http://gcc.gnu.org/install/configure.html				    #
#############################################################################

echo '#############################################################################'
echo '# GCC LINUX64                                                               #'
echo '#############################################################################'

cd $HYPNOS_TOOLCHAIN/builds/gcc-build

../gcc-$gcc_version/configure \
--prefix=$PREFIX \
--program-prefix=$PROGRAM_PREFIX \
--build=$TOOLCHAIN_BUILD \
--target=x86_64-linux-gnu \
--with-gnu-as \
--with-gnu-ld \
--with-gmp=$PREFIX \
--with-mpfr=$PREFIX \
--with-mpc=$PREFIX \
--with-sysroot=$SYSROOT \
--enable-shared \
--enable-threads \
--enable-languages=c,c++,objc,obj-c++ \
--disable-tls \
--disable-nls \
--disable-multilib \
--disable-win32-registry \
--disable-libgomp \
--disable-libmudflap \
--disable-libssp \
--disable-libstdc__-v3 \
--disable-sjlj-exceptions \
--with-tune=generic

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

