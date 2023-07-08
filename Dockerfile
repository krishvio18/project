FROM php:8.0-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Creates a directory called "app"
RUN mkdir /app  

# Sets that directory as your working directory
WORKDIR /app  

# Changes uid and gid of apache to docker user uid/gid
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

# Sets Apache to run via the app directory
RUN sed -i -e "s/var\/www/app/g" /etc/apache2/apache2.conf && sed -i -e "s/html/public/g" /etc/apache2/apache2.conf

# Copies your code to the image
COPY /website/*  /app/ 

# Sets permissions for the web user
RUN chown -R www-data:www-data

# Start Selenium Test
# COPY selenium-server-standalone-3.14.0.jar /tmp
# RUN nohup java -jar /tmp/selenium-server-standalone-3.14.0.jar &

# CMD ["/bin/bash"]
