FROM debian:testing

#ARG GADGETRON_URL=https://github.com/gadgetron/gadgetron
#ARG GADGETRON_BRANCH=master

RUN apt update

#NEED by bash shell
RUN apt install lsb-release wget software-properties-common wget gnupg -y

#install clang
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

#install others
RUN apt install cmake gdb g++ -y

# Clean up packages.
RUN  apt-get clean && \
   rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
WORKDIR /work