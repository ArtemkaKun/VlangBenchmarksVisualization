FROM ubuntu:18.04
RUN sudo apt-get install unzip
ADD https://github.com/vlang/v/releases/latest/download/v_linux.zip .
RUN unzip v_linux.zip && cd v && sudo ./v symlink && cd ..
COPY . ./app
RUN cd app && v -prod . && cd ..
CMD cd app && ./main
