FROM alpine:3.13

LABEL maintainer="tchilderhose"

ARG VERSION=1.1.0

RUN apk update && \
    apk add --no-cache \
    curl \
    libc6-compat \
    tzdata && \
    echo "Fetching" && \
    curl -o /tmp/tailon.tar.gz -sSL https://github.com/gvalkov/tailon/releases/download/v${VERSION}/tailon_${VERSION}_linux_amd64.tar.gz && \
    echo "Extracting and Moving" && \
    tar xfz /tmp/tailon.tar.gz -C /usr/local/bin tailon && \
    echo "Cleanup" && \
    apk del --no-cache curl && \
    rm -rf /var/cache/apk/* && \
    rm /tmp/tailon.tar.gz
    
EXPOSE 80

CMD /usr/local/bin/tailon -b 0.0.0.0:80 -t 1000 -f /log
