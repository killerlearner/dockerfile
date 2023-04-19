FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq update && apt-get -qq install -y tzdata curl aria2 python3 python3-pip qbittorrent-nox \
    locales pv jq nano ffmpeg p7zip-full p7zip-rar libmagic-dev && rm -rf /var/lib/apt/lists/* && 
  
ENV PYTHONWARNINGS=ignore
RUN echo -e "\e[32m[INFO]: Building and Installing MegaSdkC++.\e[0m" && \
    git clone https://github.com/meganz/sdk.git ~/home/sdk && \
    cd ~/home/sdk && rm -rf .git && \
    autoupdate -fIv && ./autogen.sh && \
    ./configure CFLAGS='-fpermissive' CXXFLAGS='-fpermissive' CPPFLAGS='-fpermissive' CCFLAGS='-fpermissive' \
    --disable-silent-rules --enable-python --with-sodium --disable-examples --with-python3 && \
    make -j$(nproc --all) && \
    cd bindings/python/ && \
    python3 setup.py bdist_wheel && \
    cd dist && ls && \
    pip3 install *.whl mega
  
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
