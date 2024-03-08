
FROM alpine:3.18

#LABEL "author"="cahn"

RUN apk update && apk upgrade && apk add nginx openssl

# SSL config
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/cahn.pem \
    -keyout /etc/nginx/ssl/cahn.key \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42 Seoul/OU=cahn/CN=cahn/"

# nginx config
RUN mkdir -p /run/nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Start nginx foreground
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

