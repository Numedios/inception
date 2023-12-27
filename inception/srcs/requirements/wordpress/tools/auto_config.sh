sleep 10

if [ ! -f /var/www/wordpress/wp-config.php ]; then

    wp core download --allow-root --path='/var/www/wordpress'
    cd /var/www/wordpress

    wp config create --allow-root \
                     --dbname="$SQL_DATABASE" \
                     --dbuser="$SQL_USER" \
                     --dbpass="$SQL_PASSWORD" \
                     --dbhost=mariadb:3306 

    wp core install --allow-root --skip-email --url="$DOMAIN_NAME" --title="$SITE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" 

    wp user create --allow-root --role=author "$USER1_LOGIN" "$USER1_MAIL" --user_pass="$USER1_PASS"  >> /var/www/log.txt
fi

if [ ! -d /run/php ]; then
    mkdir /run/php

fi

exec /usr/sbin/php-fpm7.3 -F
