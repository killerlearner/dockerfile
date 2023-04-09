FROM ubuntu:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update && apt-get upgrade -y
RUN apt -qq update --fix-missing
RUN apt-get autoremove && apt-get autoclean

RUN apt install python3
RUN apt install python3-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get -y clean
RUN apt-get -y autoremove
