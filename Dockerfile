FROM php:5.5-apache
MAINTAINER Jonas Renggli <jonas.renggli@visol.ch>

RUN apt-get update \
    && apt-get install -y unzip \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysql

ENV TUPA_GIT_SHA1 157b97d7ec84aee4dfe19d4d1adc8b6ffe905628

RUN curl -o tupa-dns.zip -SL https://github.com/visol/tupa-dns/archive/${TUPA_GIT_SHA1}.zip \
    && unzip tupa-dns.zip -d /var/www/html \
    && mv /var/www/html/tupa-dns-${TUPA_GIT_SHA1}/* /var/www/html \
    && rm tupa-dns.zip \
    && rm -rf /var/www/html/tupa-dns-${TUPA_GIT_SHA1}

COPY docker-entrypoint.sh /entrypoint.sh
COPY assets/config_site.inc.php /var/www/html/config/config_site.inc.php
COPY assets/apache.conf /etc/apache2/apache2.conf

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["app:start"]
