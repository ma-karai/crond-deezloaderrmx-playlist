FROM alpine:latest
RUN apk add --no-cache curl


ENV DEEZQUALITY FLAC
ENV DEEZSERVER 192.168.0.104:1732
ENV DEEZPLAYLIST "https://www.deezer.com/en/playlist/5158987484","https://www.deezer.com/en/playlist/1043463931"

RUN export DEEZQUALITY
RUN export DEEZSERVER 
RUN export DEEZPLAYLISTFRIDAY
RUN export DEEZPLAYLISTDAILY

# testing because noob
#RUN echo "$DEEZPLAYLIST" >> /tmp/playlisturl
#RUN echo "var2=$DEEZSERVER" >> /tmp/deezvars
#RUN cat /tmp/playlisturl


#RUN touch /etc/periodic/daily/daily-0
RUN mkdir -p /etc/periodic/friday

# replace word with the ips and stuff
COPY friday-0 /etc/periodic/friday/friday-0
COPY daily-0 /etc/periodic/daily/daily-0

# replace    placeholder $quality or $ip
#RUN sed -i "s/DEEZQUALITY/$DEEZQUALITY/g" /etc/periodic/friday/friday-0
#RUN sed -i "s/DEEZSERVER/$DEEZSERVER/g" /etc/periodic/friday/friday-0
#RUN sed -r "s/DEEZPLAYLIST/$DEEZPLAYLIST/g" /etc/periodic/friday/friday-0
#RUN sed -i "s/DEEZPLAYLIST/$(sed 's:/:\\/:g' /tmp/playlisturl)/" /etc/periodic/friday/friday-0 


RUN cat /etc/periodic/friday/friday-0

RUN chmod +x /etc/periodic/friday/friday-0
RUN chmod +x /etc/periodic/daily/daily-0

RUN echo "0       8       *       *       5       run-parts /etc/periodic/friday" >> /var/spool/cron/crontabs/root

CMD crond -l 2 -f
