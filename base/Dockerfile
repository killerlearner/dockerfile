FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive PYTHONWARNINGS=ignore
RUN apt-get -qq update && apt-get -qq install -y tzdata curl aria2 python3 python3-pip git libfreeimage-dev \
    locales python3-lxml pv jq nano ffmpeg p7zip-full p7zip-rar libmagic-dev qbittorrent-nox autoconf xz-utils \
    libcrypto++-dev libssl-dev libc-ares-dev libcurl4-openssl-dev libsqlite3-dev libsodium-dev && rm -rf /var/lib/apt/lists/* 
  
RUN git clone https://github.com/meganz/sdk.git &&\
	cd sdk && sh autogen.sh &&\
	./configure --disable-silent-rules --enable-python --disable-examples &&\
	make && make install

RUN cd sdk/bindings/python && python3 setup.py bdist_wheel &&\
	pip3 install dist/megasdk-4.18.0-py2.py3-none-any.whl

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8p
