#!/bin/bash

#############################################################################

source ./config.sh

#############################################################################

mkdir -p $HYPNOS_TOOLCHAIN/srcs

#############################################################################

cd $HYPNOS_TOOLCHAIN/srcs

curl -O $bash_miror
curl -O $sed_miror
curl -O $grep_miror
curl -O $make_miror
curl -O $flex_miror
curl -O $byacc_miror
curl -O $coreutils_miror

#curl -O $llvm_miror

curl -O $gmp_miror
curl -O $mpfr_mirror
curl -O $mpc_miror

curl -O $binutils_miror

curl -O $gcc_core_miror
curl -O $gcc_gpp_miror
curl -O $gcc_objc_miror

cd $BASE

#############################################################################

