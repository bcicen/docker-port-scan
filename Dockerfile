FROM alpine:3.2

ENV SCAN_INTERVAL 1440
ENV SCAN_PORTS 22,80

RUN apk add --update nginx nmap libxslt bash && \
    rm -f /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
