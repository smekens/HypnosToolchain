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

echo 'INSTALL: binutils_android ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/lib

# bin

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-addr2line $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-addr2line
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-ar        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-ar
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-as        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-as
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-c++filt   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-c++filt
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-elfedit   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-elfedit
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-gprof     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-gprof
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-ld        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-ld
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-ld.bfd    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-ld.bfd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-nm        $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-nm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-objcopy   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-objcopy
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-objdump   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-objdump
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-ranlib    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-ranlib
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-readelf   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-readelf
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-size      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-size
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-strings   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-strings
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/hypnos-android-strip     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-strip

strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-addr2line
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-ar
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-as
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-c++filt
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-elfedit
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-gprof
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-ld
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-ld.bfd
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-nm
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-objcopy
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-objdump
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-ranlib
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-readelf
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-size
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-strings
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/hypnos-android-strip

# x86_64-linux-gnu

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/ar      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/ar
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/as      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/as
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/ld      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/ld
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/ld.bfd  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/ld.bfd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/nm      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/nm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/objcopy $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/objcopy
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/objdump $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/objdump
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/ranlib  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/ranlib
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/bin/strip   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/strip

strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/ar
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/as
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/ld
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/ld.bfd
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/nm
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/objcopy
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/objdump
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/ranlib
strip $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/bin/strip

cp -r $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/arm-linux-androideabi/lib/ldscripts $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/arm-linux-androideabi/lib

#############################################################################

