FROM python:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

RUN pip3 install -U pip

COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U -r requirements.txt
# RUN pip3 install -r requirements.txt
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /Link-Search-Bot
WORKDIR /Link-Search-Bot
COPY start.sh /start.sh

# CMD ["/bin/bash", "/start.sh"]
# # julie
# FROM python:3.10.8-slim-buster

# RUN apt update && apt upgrade -y
# RUN apt install git -y
# COPY requirements.txt /requirements.txt

# RUN cd /
# RUN pip3 install -U pip && pip3 install -U -r requirements.txt
# RUN mkdir /Link-Search-Bot
# WORKDIR /Link-Search-Bot
# COPY . /Link-Search-Bot
# CMD gunicorn app:app & python3 main.py
