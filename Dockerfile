FROM ubuntu:21.10
RUN apt-get update && apt-get -y install sudo
RUN apt-get -y install build-essential libssl-dev unzip
WORKDIR /usr/src/vlang
ADD https://github.com/vlang/v/releases/latest/download/v_linux.zip .
RUN unzip v_linux.zip
WORKDIR /usr/src/vlang/v
RUN sudo ./v symlink
WORKDIR /usr/src/app
COPY . .
EXPOSE 8080
CMD v -prod . && ./VlangBenchmarksVisualization
