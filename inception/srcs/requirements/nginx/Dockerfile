FROM debian:buster

RUN apt update && apt upgrade -y
RUN apt-get install -y nginx
RUN apt install vim -y
RUN apt install curl -y

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=sbelabba.42.fr/UID=sbelabba"
RUN mkdir -p /var/run/nginx


COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress 
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 443

ENTRYPOINT ["nginx", "-g",  "daemon off;"]

