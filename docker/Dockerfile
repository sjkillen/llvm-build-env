FROM ubuntu

ENV LLVM_PROJECT_BRANCH=release/13.x

RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y clang git ninja-build cmake

