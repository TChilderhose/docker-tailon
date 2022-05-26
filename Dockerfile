FROM alpine

LABEL maintainer="tchilderhose"

RUN apk update && \
    apk add --no-cache \
    bash \
    curl bind-tools \
    python3 py3-pip \
    tzdata && \
    ln -sf python3 /usr/bin/python && \
    rm -rf /var/cache/apk/*

CMD sleep 1d