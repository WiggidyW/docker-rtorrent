FROM alpine

LABEL maintainer="wiggidy" mail="wiggidy@riseup.net"
LABEL description="minimal rTorrent in Docker, intended for use with remote (local or internet) XMLRPC controller such as ruTorrent or Flood."

ARG USER
ARG PASS

RUN apk add --no-cache rtorrent nginx apache2-utils \
 && echo "daemon off;" >> /etc/nginx/nginx.conf \
 && mkdir -p /run/rtorrent \
 && mkdir /run/nginx \
 && mkdir /download \
 && mkdir /torrent \
 && mkdir /config \
 && mkdir /session

COPY ./root /

RUN chmod +x /init.sh

VOLUME /download /torrent /config /session

EXPOSE 50000 8080 6881 6881/udp

CMD ["/init.sh"]
