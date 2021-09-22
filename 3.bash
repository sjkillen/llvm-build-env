#!/usr/bin/env sh
# Build LLVM. Called by 2.bash from inside docker container

mkdir /volume/llvm-project/llvm/build
cd /volume/llvm-project/llvm/build

cmake .. \
-GNinja \
-DLLVM_ENABLE_PROJECTS="llvm;clang"\
-DLLVM_TARGETS_TO_BUILD="X86"\
-DCMAKE_BUILD_TYPE="Release"\
-DCMAKE_INSTALL_PREFIX="/volume/llvm-install"\
-DLLVMPARALLEL_LINK_JOBS=12\
-DLLVM_OPTIMIZED_TABLEGEN=ON\
-DBUILD_SHARED_LIBS=ON\
-DLLVM_USE_NEWPM=ON\
-DLLVM_INCLUDE_BENCHMARKS=OFF\
-DLLVM_INCLUDE_EXAMPLES=OFF\
-DLLVM_INCLUDE_TESTS=OFF

ninja -j12
