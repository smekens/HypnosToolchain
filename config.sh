#############################################################################

BASE=`pwd`

SRCS=$BASE/srcs
BUILDS=$BASE/builds
PATCHES=$BASE/patches

#############################################################################

CORES=2

#CORES=`grep physical, /proc/cpuinfo | wc -l`

#############################################################################

llvm_ext=tar.gz
binutils_ext=tar.gz
gmp_ext=tar.gz
mpfr_ext=tar.gz
mpc_ext=tar.gz
gcc_ext=tar.gz

#############################################################################

llvm_version=3.0
binutils_version=2.22
gmp_version=5.0.2
mpfr_version=3.1.0
mpc_version=0.9
gcc_version=4.6.2

#############################################################################

llvm_tarball=llvm-$llvm_version.$llvm_ext
binutils_tarball=binutils-$binutils_version.$binutils_ext
gmp_tarball=gmp-$gmp_version.$gmp_ext
mpfr_tarball=mpfr-$mpfr_version.$mpfr_ext
mpc_tarball=mpc-$mpc_version.$mpc_ext
gcc_core_tarball=gcc-core-$gcc_version.$gcc_ext
gcc_gpp_tarball=gcc-g++-$gcc_version.$gcc_ext
gcc_objc_tarball=gcc-objc-$gcc_version.$gcc_ext

#############################################################################

llvm_miror="http://llvm.org/releases/$llvm_version/$llvm_tarball"
binutils_miror="http://ftp.gnu.org/gnu/binutils/$binutils_tarball"
gmp_miror="ftp://ftp.gmplib.org/pub/gmp-$gmp_version/$gmp_tarball"
mpfr_mirror="http://www.mpfr.org/mpfr-current/$mpfr_tarball"
mpc_miror="http://www.multiprecision.org/mpc/download/$mpc_tarball"
gcc_core_miror="ftp://ftp.irisa.fr/pub/mirrors/gcc.gnu.org/gcc/releases/gcc-$gcc_version/$gcc_core_tarball"
gcc_gpp_miror="ftp://ftp.irisa.fr/pub/mirrors/gcc.gnu.org/gcc/releases/gcc-$gcc_version/$gcc_gpp_tarball"
gcc_objc_miror="ftp://ftp.irisa.fr/pub/mirrors/gcc.gnu.org/gcc/releases/gcc-$gcc_version/$gcc_objc_tarball"

#############################################################################

