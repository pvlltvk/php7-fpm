############################################################
# Dockerfile to run Memcached Containers
# Based on Ubuntu Image
############################################################

FROM ubuntu:12.04
MAINTAINER Pavel Litvyak <pvlltvk@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y dist-upgrade

RUN apt-get -y install perl memcached

#RUN sed -i '/logfile /c \
#logfile /var/log/memcached/memcached.log' /etc/memcached.conf

#RUN mkdir -p /var/log/memcached && \
#    chown -R memcache /var/log/memcached

EXPOSE 11211

CMD ["-m", "128"]

#VOLUME /var/log/memcached

USER memcache

ENTRYPOINT ["memcached"]
