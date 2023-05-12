FROM ubuntu:20.04

ARG TARGETPLATFORM BUILDPLATFORM
ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    add-apt-repository multiverse && \
    add-apt-repository restricted && \
    apt-get install -y python3 python3-pip python3-lxml aria2 \
    tzdata p7zip-full p7zip-rar xz-utils curl wget pv jq \
    ffmpeg locales neofetch git make g++ gcc automake unzip \
    autoconf libtool libsodium-dev libcurl4-openssl-dev libc-ares-dev swig \
    libssl-dev libcrypto++-dev zlib1g-dev libsqlite3-dev libfreeimage-dev

# Installing Mega SDK Python Binding
ENV PYTHONWARNINGS=ignore
ENV MEGA_SDK_VERSION="4.10.0"
RUN git clone https://github.com/meganz/sdk.git --depth=1 -b v$MEGA_SDK_VERSION /home/sdk \
    && cd /home/sdk && rm -rf .git \
    && autoupdate -fIv && ./autogen.sh \
    && ./configure --disable-silent-rules --enable-python --with-sodium --disable-examples \
    && make -j$(nproc --all) \
    && cd bindings/python/ && python3 setup.py bdist_wheel \
    && cd dist && ls && pip3 install --no-cache-dir megasdk-*.whl
    
# Install Rclone
RUN curl https://rclone.org/install.sh | bash 

RUN /bin/sh -c locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
RUN apt -qq update --fix-missing 
RUN apt-get update && apt-get upgrade -y

RUN rm requirements.txt && apt-get -qq -y autoremove --purge && apt-get -qq -y clean && \
    rm -rf -- /var/lib/apt/lists/* /var/cache/apt/archives/* /etc/apt/sources.list.d/*

COPY . .

CMD ["bash", "start.sh"]
