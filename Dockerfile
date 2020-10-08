FROM markoshust/magento-php:7.4-fpm-0
# https://hub.docker.com/layers/markoshust/magento-php/7.4-fpm-0/images/sha256-1df35fdfb3920469c79624dfbdb5b1031f158ade336ad0a96ace8d0084143376?context=explore

USER root
COPY ./.tmp /var/www/html

# Remove memory limit for php/composer
RUN sed -i -e "s/memory_limit = 4G/memory_limit = -1/g" "/usr/local/etc/php/php.ini"

# ? Because /var/www is mounted as a volume from the previous docker image, all file ownership/permissions have to be set after container is built.

# Make sure you end with the `app` user
USER app