#!/usr/bin/env sh
# Build LLVM. Called by 2.bash from inside docker container

mkdir /volume/llvm-project/build
cd /volume/llvm-project/build

CC=/usr/local/bin/clang CXX=/usr/local/bin/clang++ cmake ../llvm  -GNinja  -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_PROJECTS="clang;llvm;libcxx;libcxxabi;libclc;clang-tools-extra" -DLLVM_TARGETS_TO_BUILD="X86" -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_INSTALL_PREFIX="/volume/llvm-install" -DLLVMPARALLEL_LINK_JOBS=4 -DLLVM_OPTIMIZED_TABLEGEN=ON -DBUILD_SHARED_LIBS=ON -DLLVM_USE_NEWPM=ON -DLLVM_INCLUDE_BENCHMARKS=OFF -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_TESTS=OFF

sudo chown -R llvm-project
sudo ninja -j4
