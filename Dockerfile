FROM i386/alpine:latest

ENV INFLUXD_OPTS= INFLUXD_VERSION=1.3.7 ARCH=i386

WORKDIR /tmp

RUN apk --update upgrade && \ 
    apk add wget ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/* && \
    wget https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXD_VERSION}_linux_${ARCH}.tar.gz

ADD influxdb-${INFLUXD_VERSION}_linux_${ARCH}.tar.gz /opt

WORKDIR /usr/bin

RUN mv /opt/influxdb-* /opt/influxdb && \
    ln -s /opt/influxdb/usr/bin/influx && \
    ln -s /opt/influxdb/usr/bin/influxd && \
    ln -s /opt/influxdb/usr/bin/influx_inspect && \
    ln -s /opt/influxdb/usr/bin/influx_stress && \
    ln -s /opt/influxdb/usr/bin/influx_tsm && \
    rm -f /tmp/influxdb-*.tar.gz

# Configuration files & database
VOLUME /etc/influxdb /var/lib/influxdb

EXPOSE 8086 8088

ENTRYPOINT ["influxd"]
CMD ["-config", "/etc/influxdb/influxdb.conf", "$INFLUXD_OPTS"]

