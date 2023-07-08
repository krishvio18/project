# Use the official PHP 8.0 image as the base
FROM php:8.0-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set the document root to Laravel's public director

# Copy the application files to the container

RUN rm -rf /var/www/html/*
COPY website /var/www/html

# Set the working directory
WORKDIR /var/www/html

#Copy Application Files
#Open port 80
EXPOSE 8080

#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Start Selenium Test
# COPY selenium-server-standalone-3.14.0.jar /tmp
# RUN nohup java -jar /tmp/selenium-server-standalone-3.14.0.jar &

# CMD ["/bin/bash"]
