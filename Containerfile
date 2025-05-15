FROM ubuntu:24.04

LABEL io.containers.capabilities="sys_chroot"
ENV DEBIAN_FRONTEND noninteractive

RUN apt -y update && \
    apt install -y --no-install-recommends \
        locales \
        git \
        ssh \
        rsync \
        grep \
        xz-utils \
        curl \
        wget \
        fakeroot \
        gawk \
        unzip \
        tar \
        squashfs-tools \
        sudo \
        bison \
        pseudo \
        cpio \
        file \
        build-essential \
        xxd \
        file \
        socat \
        python3 \
        python3-dev \
        python3-pip \
        python-is-python3 \
        kmod \
        bc \
        binfmt-support \
        ca-certificates \
        qemu-utils\
        chrpath \
        diffstat \
        liblz4-1 \
        liblz4-tool \
        libncurses-dev \
        zstd \
        tmux \
        bmap-tools

RUN apt clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN python3 -m pip install --upgrade pip --no-cache-dir --break-system-packages || true
RUN python3 -m pip install kas==4.7 --no-cache-dir --break-system-packages

WORKDIR /yocto
COPY entrypoint /yocto/entrypoint
ENTRYPOINT [ "/yocto/entrypoint" ]
