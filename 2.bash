#!/usr/bin/env sh
# Start the build container and run 003.bash inside it

mkdir -p llvm-install
sudo docker run -t --rm -v $PWD:/volume llvm-build-env "/volume/3.bash"
