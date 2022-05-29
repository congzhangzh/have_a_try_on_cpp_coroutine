FROM debian:testing

#ARG GADGETRON_URL=https://github.com/gadgetron/gadgetron
#ARG GADGETRON_BRANCH=master

RUN apt update

#Need by bash shell
RUN apt install lsb-release wget software-properties-common wget gnupg -y

#Build essential
RUN apt-get install -y ssh \
    build-essential \
    gcc \
    g++ \
    gdb \
    clang \
    cmake \
    rsync \
    tar \
    python3 \
    ninja-build \
    gdbserver \
    openssh-server

#install clang latest
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"


RUN apt-get clean
# Clean up packages.
#RUN  apt-get clean && \
#   rm -rf /var/lib/apt/lists/*


RUN useradd -m user && yes password | passwd user

# TODO, I do not fully understand here
RUN systemd-tmpfiles --create && mkdir /run/sshd

#CMD ["/bin/bash"]
CMD ["/usr/sbin/sshd", "-D"]
WORKDIR /work
