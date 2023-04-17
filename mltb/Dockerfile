FROM killerlearner/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update && apt-get upgrade -y
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get upgrade -y
RUN apt -qq update --fix-missing
RUN apt-get autoremove && apt-get autoclean
