FROM ubuntu:18.04
RUN apt-get update && apt-get -y install sudo
RUN apt-get -y install build-essential
RUN apt-get -y install libssl-dev
RUN apt-get -y install unzip
ADD https://github.com/vlang/v/releases/latest/download/v_linux.zip .
RUN unzip v_linux.zip && cd v && sudo ./v symlink && cd ..
COPY . ./app
RUN cd app && v -prod . && cd ..
CMD cd app && ./main
