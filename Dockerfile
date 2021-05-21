FROM alpine:3.13

LABEL maintainer="tchilderhose"

ARG VERSION=1.1.0

RUN apk update && \
    apk add --no-cache \
    curl \
    tzdata && \
    curl -sSL https://github.com/gvalkov/tailon/releases/download/v${VERSION}/tailon_${VERSION}_linux_amd64.tar.gz | tar -xvz && \    
    mv tailon /usr/bin/tailon && \ 
    apk del --no-cache curl && \
    rm -rf /var/cache/apk/*
    
EXPOSE 80

CMD /usr/bin/tailon -b 0.0.0.0:80 -t 1000 -f /log
