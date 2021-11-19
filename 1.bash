#!/usr/bin/env sh
# Builds docker image and clones the LLVM repo
# Only needs to be run once

LLVM_PROJECT_BRANCH=release/13.x

if ! [ $(which docker) ]; then
    echo "Requires docker to be installed, exiting..."
    exit 1
fi
if ! [ $(which git) ]; then
    echo "Requires git to be installed, exiting..."
    exit 1
fi

git clone --depth=1 -b $LLVM_PROJECT_BRANCH https://github.com/llvm/llvm-project

sudo docker build --tag sjkillen/llvm-build-env ./docker
