FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq update && apt-get -qq install -y tzdata curl aria2 python3 python3-pip qbittorrent-nox \
    locales python3-lxml pv jq nano ffmpeg p7zip-full p7zip-rar libmagic-dev && rm -rf /var/lib/apt/lists/* && \
    curl -L https://github.com/lzzy12/megasdkrest/releases/download/v0.1.14-rebuild/megasdkrest-$(cpu=$(uname -m); if [[ "$cpu" == "x86_64" ]]; then    echo "amd64"; elif [[ "$cpu" == "x86" ]]; then    echo "i386"; elif [[ "$cpu" == "aarch64" ]]; then    echo "arm64"; else    echo $cpu; fi) -o /usr/local/bin/megasdkrest && \
    chmod +x /usr/local/bin/megasdkrest

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
