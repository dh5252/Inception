#!bin/sh

# wait MariaDB
while ! mariadb -h$INCEPTION_MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME &>/dev/null; do
    sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

    mv /tmp/index.html /var/www/html/index.html

    # wordpress download and config
    wp core download --allow-root
    wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$INCEPTION_MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    wp theme install astra --activate --allow-root

    wp plugin update --all --allow-root
fi

echo "Wordpress running..[port 9000]"

#run php-fpm8.1 foreground
/usr/sbin/php-fpm81 -F -R