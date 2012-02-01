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

echo 'INSTALL: binutils_linux64 ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/include
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/lib

# bin

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-addr2line $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-addr2line
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-ar        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-ar
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-as        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-as
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-c++filt   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-c++filt
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-elfedit   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-elfedit
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-gprof     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-gprof
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-ld        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-ld
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-ld.bfd    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-ld.bfd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-nm        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-nm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-objcopy   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-objcopy
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-objdump   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-objdump
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-ranlib    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-ranlib
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-readelf   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-readelf
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-size      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-size
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-strings   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-strings
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-linux64-strip     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-strip

strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-addr2line
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-ar
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-as
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-c++filt
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-elfedit
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-gprof
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-ld
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-ld.bfd
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-nm
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-objcopy
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-objdump
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-ranlib
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-readelf
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-size
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-strings
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-linux64-strip

#include

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/include/ansidecl.h $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/include/ansedecl.h
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/include/bfd.h      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/include/bfd.h
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/include/bfdlink.h  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/include/bfdlink.h
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/include/dis-asm.h  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/include/dis-asm.h
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/include/symcat.h   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/include/symcat.h

# lib

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/libbfd.a $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/libbfd.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/libiberty.a $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/libiberty.a
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/libopcodes.a $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/libopcodes.a

# x86_64-linux-gnu

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/ar      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/ar
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/as      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/as
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/ld      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/ld
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/ld.bfd  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/ld.bfd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/nm      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/nm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/objcopy $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/objcopy
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/objdump $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/objdump
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/ranlib  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/ranlib
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/bin/strip   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/strip

strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/ar
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/as
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/ld
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/ld.bfd
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/nm
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/objcopy
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/objdump
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/ranlib
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/bin/strip

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/x86_64-linux-gnu/lib/ldscripts $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/x86_64-linux-gnu/lib

#############################################################################

