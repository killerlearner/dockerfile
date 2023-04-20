FROM killerlearner/mltb:latest

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
RUN apt -qq update --fix-missing && \
    apt -qq install -y mediainfo
RUN apt-get update && apt-get upgrade -y

RUN rm requirements.txt && apt-get -qq -y autoremove --purge && apt-get -qq -y clean && \
    rm -rf -- /var/lib/apt/lists/* /var/cache/apt/archives/* /etc/apt/sources.list.d/*
