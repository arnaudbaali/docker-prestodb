# PRESTODB Docker Container
FROM java:8
MAINTAINER Arnaud Baali

ENV PRESTO_DB_VERS 0.131

RUN apt-get update && apt-get install -y python

# Installing presto
ADD https://repo1.maven.org/maven2/com/facebook/presto/presto-server/$PRESTO_DB_VERS/presto-server-$PRESTO_DB_VERS.tar.gz /tmp/presto.tar.gz
RUN mkdir /opt/presto
RUN tar -zxvf /tmp/presto.tar.gz -C /opt/presto --strip-components=1
RUN rm /tmp/presto.tar.gz

# Copying files for config and catalogs
COPY config/* /opt/presto/etc/
COPY etc/catalog/* /opt/presto/etc/catalog/


ENTRYPOINT [ "/opt/presto/bin/launcher", "run" ]

EXPOSE 8080
