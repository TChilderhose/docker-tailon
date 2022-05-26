FROM alpine

LABEL maintainer="tchilderhose"

RUN apk update && \
    apk add --no-cache \
    bash \
    curl \
    python3 py3-pip\
    tzdata && \
    ln -sf python3 /usr/bin/python && \
    echo "Cleanup" && \
    apk del --no-cache curl && \
    rm -rf /var/cache/apk/*

CMD sleep 1d