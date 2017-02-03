FROM java:openjdk-8-jre
MAINTAINER spiddy <d.kapanidis@gmail.com>

RUN apt-get update
RUN apt-get install apt-transport-https -y
RUN echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list
RUN apt-get update && apt-get clean ### Sonar version 5.6 - timestamp

RUN apt-get install -y --force-yes sonar=5.6

COPY assets/init /app/init
RUN chmod 755 /app/init

VOLUME /opt/sonar/extensions
VOLUME /opt/sonar/logs/

ENTRYPOINT ["/app/init"]
CMD ["app:start"]
