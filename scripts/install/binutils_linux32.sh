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

echo 'INSTALL: binutils_linux32 ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/lib

# bin

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-addr2line $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-addr2line
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-ar        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-ar
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-as        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-as
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-c++filt   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-c++filt
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-elfedit   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-elfedit
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-gprof     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-gprof
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-ld        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-ld
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-ld.bfd    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-ld.bfd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-nm        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-nm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-objcopy   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-objcopy
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-objdump   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-objdump
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-ranlib    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-ranlib
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-readelf   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-readelf
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-size      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-size
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-strings   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-strings
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux32-strip     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-strip

strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-addr2line
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-ar
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-as
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-c++filt
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-elfedit
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-gprof
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-ld
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-ld.bfd
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-nm
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-objcopy
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-objdump
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-ranlib
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-readelf
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-size
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-strings
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux32-strip

# lib

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/libiberty.a $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/libiberty.a

# x86_64-linux-gnu

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/ar      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/ar
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/as      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/as
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/ld      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/ld
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/ld.bfd  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/ld.bfd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/nm      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/nm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/objcopy $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/objcopy
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/objdump $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/objdump
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/ranlib  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/ranlib
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/bin/strip   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/strip

strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/ar
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/as
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/ld
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/ld.bfd
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/nm
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/objcopy
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/objdump
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/ranlib
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/bin/strip

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-linux-gnu/lib/ldscripts $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-linux-gnu/lib

#############################################################################

