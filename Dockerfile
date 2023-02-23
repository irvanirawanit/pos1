FROM php:8.1.16

# install zip extension
RUN apt-get update && apt-get install -y libzip-dev && docker-php-ext-configure zip && docker-php-ext-install zip

# install gd extension
RUN apt-get update && apt-get install -y libpng-dev && apt-get install -y libwebp-dev && apt-get install -y libjpeg62-turbo-dev && apt-get install -y libpng-dev libxpm-dev && apt-get install -y libfreetype6-dev && docker-php-ext-configure gd --enable-gd --with-webp --with-jpeg --with-xpm --with-freetype && docker-php-ext-install gd

# install mysql extension
RUN docker-php-ext-install pdo pdo_mysql

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# install npm
RUN npm install -g npm@8.0.0

# copy laravel project
COPY . /var/www/html

EXPOSE 8000

# docker build --tag irvanirawanit/php-8.1.16-laravel:node18.npm8.0.0.pos .
