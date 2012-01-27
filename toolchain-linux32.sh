#!/bin/bash

#############################################################################

source ./config.sh
PREFIX=$BASE/target/linux

#############################################################################

cd $BUILD

rm -fr binutils-$binutils_version
rm -fr binutils

rm -fr gmp-$gmp_version
rm -fr gmp

rm -fr mpfr-$mpfr_version
rm -fr mpfr

rm -fr mpc-$mpc_version
rm -fr mpc

rm -fr gcc-$gcc_version
rm -fr gcc

tar xf binutils-$binutils_version.tar.bz2
mkdir binutils

tar xf gmp-$gmp_version.tar.bz2
mkdir gmp

tar xf mpfr-$mpfr_version.tar.bz2
mkdir mpfr

tar xf mpc-$mpc_version.tar.gz
mkdir mpc

tar xf gcc-core-$gcc_version.tar.bz2
tar xf gcc-g++-$gcc_version.tar.bz2
tar xf gcc-objc-$gcc_version.tar.bz2
mkdir gcc

#############################################################################

echo '#############################################################################'
echo '# BINUTILS                                                                  #'
echo '#############################################################################'

cd $BUILD/binutils

../binutils-$binutils_version/configure \
--prefix=$PREFIX \
--host=x86_64-linux-gnu \
--build=x86_64-linux-gnu \
--target=x86_64-linux-gnu \
--with-sysroot=$PREFIX/sysroot \
--with-binutils-version=$binutils_version \
--with-gmp-version=$gmp_version \
--with-mpfr-version=$mpfr_version \
--with-mpc-version=$mpc_version \
--with-gcc-version=$gcc_version \
--disable-nls \
--disable-shared \
--disable-multilib \
--program-transform-name='s,^,bubble-linux-,'

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
echo '# GMP                                                                       #'
echo '#############################################################################'

cd $BUILD/gmp

../gmp-$gmp_version/configure \
--prefix=$PREFIX \
--host=x86_64-linux-gnu \
--build=x86_64-linux-gnu \
--disable-shared \
--program-transform-name='s,^,bubble-linux-,'

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

cd $BUILD/mpfr

../mpfr-$mpfr_version/configure \
--prefix=$PREFIX \
--host=x86_64-linux-gnu \
--build=x86_64-linux-gnu \
--with-gmp-version=$gmp_version \
--with-gmp=$PREFIX \
--disable-shared \
--program-transform-name='s,^,bubble-linux-,'

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

cd $BUILD/mpc

../mpc-$mpc_version/configure \
--prefix=$PREFIX \
--host=x86_64-linux-gnu \
--build=x86_64-linux-gnu \
--with-gmp-version=$gmp_version \
--with-gmp=$PREFIX \
--disable-shared \
--program-transform-name='s,^,bubble-linux-,'

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

cd $BUILD/gcc

../gcc-$gcc_version/configure \
--prefix=$PREFIX \
--host=x86_64-linux-gnu \
--build=x86_64-linux-gnu \
--target=x86_64-linux-gnu \
--with-gnu-as \
--with-gnu-ld \
--with-gmp=$PREFIX \
--with-mpc=$PREFIX \
--with-mpfr=$PREFIX \
--with-sysroot=$PREFIX/sysroot \
--with-binutils-version=$binutils_version \
--with-gmp-version=$gmp_version \
--with-mpfr-version=$mpfr_version \
--with-mpc-version=$mpc_version \
--with-gcc-version=$gcc_version \
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
--with-tune=generic \
--program-transform-name='s,^,bubble-linux-,'

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

