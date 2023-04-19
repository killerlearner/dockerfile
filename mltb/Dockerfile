FROM killerlearner/mltb:latest

RUN apt-get update && apt-get upgrade -y
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt -qq update --fix-missing
RUN apt-get autoremove && apt-get autoclean
