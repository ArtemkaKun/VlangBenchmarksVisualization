FROM ubuntu:21.10

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive && \
apt-get -y --no-install-recommends install sudo build-essential libssl-dev libgc-dev unzip && \
apt-get clean && rm -rf /var/cache/apt/archives/* && \
rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/vlang
ADD https://github.com/vlang/v/releases/latest/download/v_linux.zip .
RUN unzip v_linux.zip
WORKDIR /usr/src/vlang/v
RUN sudo ./v symlink

WORKDIR /usr/src/app
COPY . .
EXPOSE 8080
CMD v -gc boehm -prod . && ./app
