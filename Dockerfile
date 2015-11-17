FROM buildpack-deps:jessie-curl

MAINTAINER Nathan Herald <nathan.herald@microsoft.com>

ARG start
ARG sha

EXPOSE 8125

RUN apt-get update \
 && mkdir /opt/app \
 && mkdir /opt/src

RUN apt-get install -y make gcc scons

ADD . /opt/src/

RUN cp -R /opt/src/statsite.d /opt/app/ \
 && cd /opt/src/statsite/ && make && cp ./statsite /opt/app/ \
 && mkdir /opt/app/sinks && cp /opt/src/statsite/sinks/* /opt/app/sinks/

RUN echo $start > /opt/start \
 && chmod +x /opt/start

RUN echo $sha > /opt/app/sha

CMD /opt/start
