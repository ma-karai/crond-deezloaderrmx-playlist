FROM alpine:latest
RUN apk add --no-cache curl

ENV DEEZSERVERTEST=192.168.0.104:1732
ARG DEEZSERVER=192.168.0.104:1732


RUN mkdir -p /etc/periodic/friday

RUN echo  $'\n\
  #!/bin/bash\n\
  test \n\
  foo test test test hallotest test test test  \n\
  test \n'\
  >>  /etc/periodic/friday/friday-0

# replace word with the ips and stuff
RUN sed -i 's/hallotest/${DEEZSERVER}/g' /etc/periodic/friday/friday-0

RUN cat /etc/periodic/friday/friday-0
RUN chmod +x /etc/periodic/friday/friday-0

RUN echo "0       8       *       *       5       run-parts /etc/periodic/friday" >> /var/spool/cron/crontabs/root
