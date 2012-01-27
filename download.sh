#!/bin/bash

#############################################################################

source ./config.sh

#############################################################################

mkdir -p $SRCS

#############################################################################

cd $SRCS

curl -O $llvm_miror
curl -O $binutils_miror
curl -O $gmp_miror
curl -O $mpfr_mirror
curl -O $mpc_miror
curl -O $gcc_core_miror
curl -O $gcc_gpp_miror
curl -O $gcc_objc_miror

cd $BASE

#############################################################################

