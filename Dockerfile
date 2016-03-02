FROM java:8-jre
MAINTAINER Alexander Gorokhov <sashgorokhov@gmail.com>

EXPOSE 8111

ENV TEAMCITY_VERSION="9.1.6"
ENV TEAMCITY_DOWNLOAD_URL="https://download.jetbrains.com/teamcity/TeamCity-"$TEAMCITY_VERSION".tar.gz"

ENV TEAMCITY_DATA_PATH /mnt/teamcity
VOLUME $TEAMCITY_DATA_PATH

RUN wget -qO - $TEAMCITY_DOWNLOAD_URL | tar xz -C /opt

CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
