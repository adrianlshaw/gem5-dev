# Building: docker build -t gem5 .
# Running:  docker run -v $PWD:/opt -ti gem5
# Debug:    docker run -v $PWD:/opt -ti --entrypoint="/bin/bash" gem5

FROM ubuntu:16.04
WORKDIR /dist/m5/system
RUN apt-get update
RUN apt-get install -y wget g++ m4 mercurial scons protobuf-compiler python-dev \
zlib1g-dev crossbuild-essential-arm64 libc6-dev-arm64-cross libgoogle-perftools-dev
WORKDIR /opt
ENTRYPOINT ["/bin/bash", "-c", "scons -j3 build/ARM/gem5.opt && build/ARM/gem5.opt configs/example/se.py -c tests/test-progs/hello/bin/arm/linux/hello"]
