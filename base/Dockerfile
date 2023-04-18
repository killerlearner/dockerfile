FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive PYTHONWARNINGS=ignore
RUN apt-get -qq update && apt-get -qq install -y tzdata curl aria2 python3 python3-pip qbittorrent-nox\
    locales python3-lxml pv jq nano ffmpeg p7zip-full p7zip-rar libmagic-dev && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
