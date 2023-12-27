FROM debian:buster

RUN apt -y update && apt -y upgrade

RUN apt-get -y install wget

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod 777 /usr/local/bin/wp


COPY tools/auto_config.sh /auto_config.sh

RUN chmod 777 /auto_config.sh

ENTRYPOINT ["bash", "./auto_config.sh"]