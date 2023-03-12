FROM ubuntu:latest
LABEL "Author"="fanfan"
LABEL "Project"="Apache"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install apache2 git unzip -y
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
WORKDIR /var/www/html
VOLUME /var/log/apache2
COPY wedding.zip /var/www/html
RUN rm /var/www/html/index.html && unzip /var/www/html/wedding.zip -d /var/www/html/ && rm /var/www/html/wedding.zip && mv /var/www/html/2131_wedding_lite/* /var/www/html/ && rm -r /var/www/html/2131_wedding_lite

