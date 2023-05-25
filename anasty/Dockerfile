FROM anasty17/mltb:latest

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt


RUN apt -qq update --fix-missing 
RUN apt-get update && apt-get upgrade -y

RUN rm requirements.txt && apt-get -qq -y autoremove --purge && apt-get -qq -y clean && \
    rm -rf -- /var/lib/apt/lists/* /var/cache/apt/archives/* /etc/apt/sources.list.d/*
