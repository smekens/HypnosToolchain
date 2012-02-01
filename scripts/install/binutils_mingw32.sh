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

echo 'INSTALL: binutils_mingw32 ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib

# bin

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-addr2line $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-addr2line
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-ar        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-ar
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-as        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-as
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-c++filt   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-c++filt
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-dlltool   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-dlltool
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-dllwrap   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-dllwrap
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-elfedit   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-elfedit
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-gprof     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-gprof
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-ld        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-ld
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-ld.bfd    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-ld.bfd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-nm        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-nm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-objcopy   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-objcopy
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-objdump   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-objdump
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-ranlib    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-ranlib
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-readelf   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-readelf
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-size      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-size
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-strings   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-strings
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-strip     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-strip
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-windmc    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-windmc
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-mingw32-windres   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-windres

strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-addr2line
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-ar
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-as
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-c++filt
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-dlltool
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-dllwrap
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-elfedit
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-gprof
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-ld
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-ld.bfd
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-nm
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-objcopy
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-objdump
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-ranlib
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-readelf
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-size
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-strings
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-strip
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-windmc
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-mingw32-windres

# lib

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/lib/libiberty.a $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/lib/libiberty.a

# x86_64-linux-gnu

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/ar      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/ar
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/as      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/as
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/ld      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/ld
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/ld.bfd  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/ld.bfd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/nm      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/nm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/objcopy $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/objcopy
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/objdump $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/objdump
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/ranlib  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/ranlib
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/bin/strip   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/strip

strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/ar
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/as
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/ld
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/ld.bfd
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/nm
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/objcopy
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/objdump
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/ranlib
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/bin/strip

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/i686-mingw32/lib/ldscripts $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/i686-mingw32/lib

#############################################################################

