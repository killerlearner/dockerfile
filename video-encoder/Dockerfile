FROM ubuntu:20.04

RUN mkdir /app
RUN chmod 777 /app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
COPY requirements.txt .
RUN apt update && apt install -y --no-install-recommends git wget aria2 curl busybox python3 python3-pip p7zip-full p7zip-rar unzip mkvtoolnix ffmpeg
RUN pip3 install --no-cache-dir -r requirements.txt

# For Extraction of archieved files
RUN chmod +x extract

RUN apt -qq update --fix-missing -y && \
    apt-get update && apt-get upgrade -y

RUN rm requirements.txt && apt-get -qq -y autoremove --purge && apt-get -qq -y clean && \
    rm -rf -- /var/lib/apt/lists/* /var/cache/apt/archives/* /etc/apt/sources.list.d/*


