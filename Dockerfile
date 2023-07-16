FROM ubuntu:22.04

RUN apt update
RUN apt upgrade
RUN apt install -y jq wget unzip openjdk-19-jre

COPY settings.json /srv/settings.json
COPY install.sh /srv/
COPY run.sh /srv/
RUN chmod +x /srv/*sh

RUN cat /srv/settings.json | jq .url

EXPOSE 25565
CMD [ "/srv/run.sh" ]
