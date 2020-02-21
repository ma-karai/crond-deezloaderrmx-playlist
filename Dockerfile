FROM alpine:latest
RUN apk add --no-cache curl

ARG DEEZSERVER
ENV DEEZSERVER=192.168.0.104:1732



RUN mkdir -p /etc/periodic/friday

RUN cat > /etc/periodic/friday/friday-0 <<'EOF' \
its great \
server ip $DEEZSERVER \
and should stay that way \
EOF

RUN chmod +x /etc/periodic/friday/friday-0

RUN echo "0       8       *       *       5       run-parts /etc/periodic/friday" >> /var/spool/cron/crontabs/root
