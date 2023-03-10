
#sudo docker build . -t download_interface:debian
#

FROM debian:bullseye-slim

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install fuse -y
RUN apt-get install nano mc wget tzdata lftp curlftpfs htop rsync sshpass sshfs openssh-client ca-certificates -y
RUN apt-get install npm -y

RUN npm install -g crontab-ui

RUN rm -rf /var/cache/apk/*

RUN mkdir /mnt/source
RUN mkdir /mnt/dest
RUN mkdir /usr/local/bin/log

ENV TZ="Europe/Budapest"
ENV HOST="127.0.0.1"
ENV PORT=8080

RUN crontab-ui &
