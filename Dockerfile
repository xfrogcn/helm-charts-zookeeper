FROM openjdk:8u292-jdk-slim

LABEL category="pub"

WORKDIR /tmp

ENV ZK_VERSION=3.7.0

RUN apt-get update && apt-get install wget procps openbsd-inetd telnet curl vim inetutils-ping -y
RUN wget https://downloads.apache.org/zookeeper/zookeeper-${ZK_VERSION}/apache-zookeeper-${ZK_VERSION}-bin.tar.gz && \
    tar zxvf apache-zookeeper-${ZK_VERSION}-bin.tar.gz -C /opt

WORKDIR /opt/apache-zookeeper-${ZK_VERSION}-bin/bin

COPY ./init.sh init.sh
RUN chmod +x ./init.sh

CMD sh -c './init.sh && ./zkServer.sh start-foreground'