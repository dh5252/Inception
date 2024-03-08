
FROM alpine:3.18

RUN apk update && apk upgrade && apk add mariadb mariadb-client

#LABEL "author"="cahn"

COPY config.sh /tmp/configure.sh

ENTRYPOINT [ "sh", "/tmp/configure.sh" ]
