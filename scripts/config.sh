#############################################################################

BASE=`pwd`

#############################################################################

CORES=2

#CORES=`grep physical, /proc/cpuinfo | wc -l`

hypnos_miror="http://public.hypnos3d.com/toolchain/1.0"

#############################################################################

bash_ext=tar.gz
sed_ext=tar.gz
grep_ext=tar.gz
make_ext=tar.gz
flex_ext=tar.gz
byacc_ext=tar.gz
coreutils_ext=tar.gz

gmp_ext=tar.gz
mpfr_ext=tar.gz
mpc_ext=tar.gz

llvm_ext=tar.gz

binutils_ext=tar.gz
gcc_ext=tar.gz

#############################################################################

bash_version=4.2
sed_version=4.2
grep_version=2.9
make_version=3.82
flex_version=2.5.35
byacc_version=1.9
coreutils_version=8.13

gmp_version=5.0.2
mpfr_version=3.1.0
mpc_version=0.9

llvm_version=3.0

binutils_version=2.22
gcc_version=4.6.2

#############################################################################

bash_tarball=bash-$bash_version.$bash_ext
sed_tarball=sed-$sed_version.$sed_ext
grep_tarball=grep-$grep_version.$grep_ext
make_tarball=make-$make_version.$make_ext
flex_tarball=flex-$flex_version.$flex_ext
byacc_tarball=byacc-$byacc_version.$byacc_ext
coreutils_tarball=coreutils-$coreutils_version.$coreutils_ext

gmp_tarball=gmp-$gmp_version.$gmp_ext
mpfr_tarball=mpfr-$mpfr_version.$mpfr_ext
mpc_tarball=mpc-$mpc_version.$mpc_ext

llvm_tarball=llvm-$llvm_version.$llvm_ext

binutils_tarball=binutils-$binutils_version.$binutils_ext
gcc_core_tarball=gcc-core-$gcc_version.$gcc_ext
gcc_gpp_tarball=gcc-g++-$gcc_version.$gcc_ext
gcc_objc_tarball=gcc-objc-$gcc_version.$gcc_ext

#############################################################################

bash_miror="$hypnos_miror/$bash_tarball"
sed_miror="$hypnos_miror/$sed_tarball"
grep_miror="$hypnos_miror/$grep_tarball"
make_miror="$hypnos_miror/$make_tarball"
flex_miror="$hypnos_miror/$flex_tarball"
byacc_miror="$hypnos_miror/$byacc_tarball"
coreutils_miror="$hypnos_miror/$coreutils_tarball"

gmp_miror="$hypnos_miror/$gmp_tarball"
mpfr_mirror="$hypnos_miror/$mpfr_tarball"
mpc_miror="$hypnos_miror/$mpc_tarball"

llvm_miror="$hypnos_miror/$llvm_tarball"

binutils_miror="$hypnos_miror/$binutils_tarball"
gcc_core_miror="$hypnos_miror/$gcc_core_tarball"
gcc_gpp_miror="$hypnos_miror/$gcc_gpp_tarball"
gcc_objc_miror="$hypnos_miror/$gcc_objc_tarball"

#############################################################################

