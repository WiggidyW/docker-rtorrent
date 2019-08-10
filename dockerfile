FROM alpine

LABEL maintainer="wiggidy" mail="wiggidy@riseup.net"
LABEL description="minimal rTorrent in Docker, intended for use with remote (local or internet) XMLRPC controller such as ruTorrent or Flood."
LABEL version="1.0"

ARG USER
ARG PASS

RUN apk add --no-cache rtorrent nginx apache2-utils \
 && echo "daemon off;" >> /etc/nginx/nginx.conf

COPY ./root /

VOLUME /download /torrent

EXPOSE 50000 8080 6881 6881/udp

CMD ["/init.sh"]
