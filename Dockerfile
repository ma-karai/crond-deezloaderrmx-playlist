FROM alpine:latest
RUN apk add --no-cache curl


ENV DEEZQUALITY FLAC
ENV DEEZSERVER 192.168.0.104:1732

RUN echo "var1=$DEEZQUALITY" >> /tmp/deezvars
RUN echo "var2=$DEEZSERVER" >> /tmp/deezvars

RUN cat /tmp/deezvars


RUN mkdir -p /etc/periodic/friday


# replace word with the ips and stuff
COPY friday-0 /etc/periodic/friday/friday-0

RUN cat /tmp/deezvars

RUN sed -i "s/DEEZQUALITY/$DEEZQUALITY/g" /etc/periodic/friday/friday-0
RUN sed -i 's/DEEZLOADERRMIXIPPORT/$DEEZSERVER/g' /etc/periodic/friday/friday-0

RUN cat /etc/periodic/friday/friday-0

RUN chmod +x /etc/periodic/friday/friday-0

RUN echo "0       8       *       *       5       run-parts /etc/periodic/friday" >> /var/spool/cron/crontabs/root
