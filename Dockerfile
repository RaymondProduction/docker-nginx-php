FROM ubuntu:16.04
# Code name OS for NGINX
ENV CODENAME xenial

# Update OS
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install nano
RUN apt-get install software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update


# Install PHP
RUN apt-get install php7.0 php7.0-fpm php7.0-mysql -y

# Install NGINX
# RUN apt-get install wget -y
# RUN wget http://nginx.org/keys/nginx_signing.key
# RUN apt-key add nginx_signing.key
# RUN echo "deb http://nginx.org/packages/ubuntu/ $CODENAME nginx ">> /etc/apt/sources.list
# RUN echo "deb-src http://nginx.org/packages/ubuntu/ $CODENAME nginx ">> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install nginx -y

RUN apt-get install mc -y
RUN service php7.0-fpm start  

COPY sites-available/default  /etc/nginx/sites-available/default
COPY nginx.conf /etc/nginx/conf.d/default.conf 
COPY index.php /usr/share/nginx/html/index.php
RUN echo "11"
RUN service nginx start


# MySQL
#ENV MYSQL_PWD  raymond
#RUN echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
#RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections
#RUN apt-get -y install mysql-server


