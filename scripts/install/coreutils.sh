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

echo 'INSTALL: coreutils ...'

install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin
install -d $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/coreutils

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/basename $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/basename
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/cat      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/cat
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/chmod    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/chmod
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/cp       $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/cp
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/cut      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/cut
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/dirname  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/dirname
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/echo     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/echo
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/env      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/env
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/expr     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/expr
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/false    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/false
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/head     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/head
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/install  $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/install
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/ln       $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/ln
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/ls       $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/ls
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/mkdir    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/mkdir
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/mv       $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/mv
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/nproc    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/nproc
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/printf   $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/printf
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/pwd      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/pwd
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/rm       $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/rm
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/rmdir    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/rmdir
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/seq      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/seq
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/sleep    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/sleep
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/sort     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/sort
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/split    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/split
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/tail     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/tail
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/tee      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/tee
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/test     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/test
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/touch    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/touch
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/true     $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/true
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/uname    $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/uname
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/wc       $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/wc
cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/bin/yes      $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/yes

strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/basename
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/cat
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/chmod
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/cp
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/cut
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/dirname
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/echo
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/env
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/expr
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/false
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/head
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/install
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/ln
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/ls
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/mkdir
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/mv
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/nproc
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/printf
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/pwd
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/rm
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/rmdir
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/seq
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/sleep
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/sort
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/split
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/tail
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/tee
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/test
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/touch
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/true
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/uname
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/wc
strip -s $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/bin/yes

cp $HYPNOS_TOOLCHAIN/install/$TARGET/.HypnosToolchain/libexec/coreutils/libstdbuf.so $HYPNOS_TOOLCHAIN/install/$TARGET/HypnosToolchain/libexec/coreutils/libstdbuf.so

#############################################################################

