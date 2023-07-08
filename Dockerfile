FROM devopsedu/webapp

MAINTAINER Ram Dittakavi <ramdittakavi@gmail.com>

#Update Repository
RUN apt-get update -y

#Install Apache
RUN apt-get install -y apache2

#Install PHP Modules
RUN apt-get install -y php7.4-cli php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath

#Copy Application Files
RUN rm -rf /var/www/html/*
COPY website /var/www/html/

#Open port 80
EXPOSE 8080

#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Start Selenium Test
# COPY selenium-server-standalone-3.14.0.jar /tmp
# RUN nohup java -jar /tmp/selenium-server-standalone-3.14.0.jar &

# CMD ["/bin/bash"]
