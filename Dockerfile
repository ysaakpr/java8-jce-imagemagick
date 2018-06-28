FROM anapsix/alpine-java:8_server-jre_unlimited

RUN apk --update add imagemagick && \
    rm -rf /var/cache/apk/*
