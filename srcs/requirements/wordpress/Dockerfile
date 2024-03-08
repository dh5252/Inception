
FROM alpine:3.18

#LABEL "author"="cahn"

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/v3.18/community" >> /etc/apk/repositories && apk update

RUN apk update && apk upgrade && apk add --no-cache\
    wget    \
    tar     \
    mariadb-client \
	php \
    php-fpm \
    php-pdo \
    php-pdo_mysql \
    php-mysqli \
    php-mbstring \
    php-xml \
    php-json \
    php-phar \
    php-openssl \
    php-curl \
    php-zlib

# add system user, group
RUN adduser -S nginx && addgroup -S nginx
# copy conf file
COPY conf/php-fpm.conf /etc/php81/php-fpm.conf
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

# static website
COPY conf/index.html /tmp/index.html

# download wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html/wordpress

COPY tools/configure.sh /tmp/configure.sh

ENTRYPOINT [ "sh", "/tmp/configure.sh" ]