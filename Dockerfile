FROM openjdk:8u292-jdk-slim

LABEL category="pub"

WORKDIR /tmp

ENV ZK_VERSION=3.7.0

RUN apt-get update && apt-get install wget -y && apt-get install procps -y
RUN wget https://downloads.apache.org/zookeeper/zookeeper-${ZK_VERSION}/apache-zookeeper-${ZK_VERSION}-bin.tar.gz && \
    tar zxvf apache-zookeeper-${ZK_VERSION}-bin.tar.gz -C /opt

WORKDIR /opt/apache-zookeeper-${ZK_VERSION}-bin/bin

COPY ./init.sh init.sh
RUN chmod +x ./init.sh

ENTRYPOINT [ "bash", "./init.sh", "&&", "./zkServer.sh", "start-foreground" ]