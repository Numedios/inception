FROM debian:buster

LABEL maintainer="MARIADB Inception Docker"

RUN apt-get update \
    && apt-get install -y vim mariadb-server mariadb-client \
    && mkdir -p /var/run/mariadb && mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb-DBCreate.sh	/var/run/mariadb/mariadb-DBCreate.sh


RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /var/run/mariadb/mariadb-DBCreate.sh

ENTRYPOINT ["bash", "/var/run/mariadb/mariadb-DBCreate.sh"]