
#imagen base
FROM ubuntu:16.04

#install java, vsftpd , supervisor
RUN apt-get update && \
        apt-get install -y openjdk-8-jdk && \
        apt-get install -y ant && \
        apt-get install -y vsftpd supervisor && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        rm -rf /var/cache/oracle-jdk8-installer && \
        mkdir -p /var/run/vsftpd/empty;

#set enviroment java path
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

ENV PATH $PATH:/usr/lib/jvm/java-8-openjdk-amd64/jre/bin:/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin

ADD target/sandbox-sap-receiverMQ.jar app.jar
ENTRYPOINT java -jar app.jar

