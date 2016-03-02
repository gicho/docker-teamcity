FROM java:8-jre
MAINTAINER Alexander Gorokhov <sashgorokhov@gmail.com>

EXPOSE 8111

ARG teamcity_version="9.1.6"
ARG teamcity_download_url="http://download.jetbrains.com/teamcity/TeamCity-"${teamcity_version}".tar.gz"
ARG teamcity_data_path="/mnt/teamcity"

ENV TEAMCITY_DATA_PATH ${teamcity_data_path}
VOLUME $TEAMCITY_DATA_PATH

RUN wget -qO - https://download.jetbrains.com/teamcity/TeamCity-${teamcity_version}.tar.gz | tar xz -C /opt

CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
