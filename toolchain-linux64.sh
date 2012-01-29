#!/bin/bash

#############################################################################

source ./config.sh

SYSROOT=$HYPNOS_TOOLCHAIN/targets/linux64/sysroot

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

    PREFIX=$HYPNOS_TOOLCHAIN/targets/linux64

    TOOLCHAIN_BUILD=x86_64-linux-gnu
    ;;

  2*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 2

    PREFIX=$HYPNOS_TOOLCHAIN/targets/linux32

    TOOLCHAIN_BUILD=i686-linux-gnu
    ;;

  3*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 3

    PREFIX=$HYPNOS_TOOLCHAIN/targets/osx

    TOOLCHAIN_BUILD=x86_64-apple-darwin11.2.0
    ;;

  5*)
    source $HYPNOS_TOOLCHAIN/SetCompiler.sh 5

    PREFIX=$HYPNOS_TOOLCHAIN/targets/mingw32

    TOOLCHAIN_BUILD=i686-mingw32
    ;;

  *)
    echo "Unsuperted target $TYPE"
    exit 1
    ;;
esac

#############################################################################

install -d $BUILDS
cd $BUILDS

#rm -fr llvm-$llvm_version
#rm -fr llvm

rm -fr gmp-$gmp_version
rm -fr gmp-build

rm -fr mpfr-$mpfr_version
rm -fr mpfr-build

rm -fr mpc-$mpc_version
rm -fr mpc-build

rm -fr binutils-$binutils_version
rm -fr binutils-build

rm -fr gcc-$gcc_version
rm -fr gcc-build

#tar xf $SRCS/$llvm_tarball
#mv llvm-$llvm_version.src llvm-$llvm_version
#mkdir llvm-build

tar xf $SRCS/$gmp_tarball
mkdir gmp-build

tar xf $SRCS/$mpfr_tarball
mkdir mpfr-build

tar xf $SRCS/$mpc_tarball
mkdir mpc-build

tar xf $SRCS/$binutils_tarball
mkdir binutils-build

tar xf $SRCS/$gcc_core_tarball
tar xf $SRCS/$gcc_gpp_tarball
tar xf $SRCS/$gcc_objc_tarball
mkdir gcc-build

#############################################################################

#echo '#############################################################################'
#echo '# LLVM                                                                      #'
#echo '#############################################################################'
#
#cd $BUILDS/llvm-build
#
#../llvm-$llvm_version/configure \
#--prefix=$PREFIX \
#--build=$TOOLCHAIN_BUILD \
#--target=i686-mingw32 \
#--enable-optimized \
#--program-transform-name='s,^,hypnos-mingw32-,'
#
#if [ $? != 0 ] ; then
#    echo "Error while trying to configure toolchain build."
#    exit 1
#fi
#
#make -j$CORES
#
#if [ $? != 0 ] ; then
#    echo "Error while trying to configure toolchain build."
#    exit 1
#fi
#
#make install
#
#cd $BASE

#############################################################################

echo '#############################################################################'
echo '# GMP                                                                       #'
echo '#############################################################################'

cd $BUILDS/gmp-build

../gmp-$gmp_version/configure \
--prefix=$PREFIX \
--program-prefix=$PROGRAM_PREFIX \
--build=$TOOLCHAIN_BUILD \
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

echo '#############################################################################'
echo '# MPFR                                                                      #'
echo '#############################################################################'

cd $BUILDS/mpfr-build

../mpfr-$mpfr_version/configure \
--prefix=$PREFIX \
--program-prefix=$PROGRAM_PREFIX \
--build=$TOOLCHAIN_BUILD \
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

echo '#############################################################################'
echo '# MPC                                                                       #'
echo '#############################################################################'

cd $BUILDS/mpc-build

../mpc-$mpc_version/configure \
--prefix=$PREFIX \
--program-prefix=$PROGRAM_PREFIX \
--build=$TOOLCHAIN_BUILD \
--with-gmp=$PREFIX \
--with-mpfr=$PREFIX \
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

echo '#############################################################################'
echo '# BINUTILS                                                                  #'
echo '#############################################################################'

cd $BUILDS/binutils-build

../binutils-$binutils_version/configure \
--prefix=$PREFIX \
--program-prefix=$PROGRAM_PREFIX \
--build=$TOOLCHAIN_BUILD \
--target=x86_64-linux-gnu \
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
# http://gcc.gnu.org/install/configure.html				    #
#############################################################################

echo '#############################################################################'
echo '# GCC                                                                       #'
echo '#############################################################################'

cd $BUILDS/gcc-build

../gcc-$gcc_version/configure \
--prefix=$PREFIX \
--program-prefix=$PROGRAM_PREFIX \
--build=$TOOLCHAIN_BUILD \
--target=x86_64-linux-gnu \
--with-gnu-as \
--with-gnu-ld \
--with-gmp=$PREFIX \
--with-mpc=$PREFIX \
--with-mpfr=$PREFIX \
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

