FROM debian:latest

# https://discuss.elastic.co/t/elasticsearch-7-x-support-for-arm64-raspberry-pi-4-b/187976

ENV ES_VERSION 7.6.1
ENV JAVA_VERSION 11

RUN apt-get update
RUN apt-get -yq install openjdk-${JAVA_VERSION}-jdk
RUN java -version

RUN apt-get -yq install wget
RUN wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}-no-jdk-amd64.deb
RUN dpkg -i --force-all --ignore-depends=libc6 elasticsearch-${ES_VERSION}-no-jdk-amd64.deb || true
RUN echo "xpack.ml.enabled: false" >> /etc/elasticsearch/elasticsearch.yml
#RUN echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
RUN echo "http.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
RUN ln -s /usr/lib/jvm/java-${JAVA_VERSION}-openjdk-armhf /usr/share/elasticsearch/jdk

EXPOSE 9200 9300

CMD /usr/share/elasticsearch/bin/elasticsearch
