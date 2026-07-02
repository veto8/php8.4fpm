FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
        libfreetype-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        libicu-dev \
        libxml2-dev \
        libcurl4-openssl-dev \
        libonig-dev \
        libwebp-dev \
        libxpm-dev \
        libavif-dev \
        libmagickwand-dev \
        libpq-dev \
        libbz2-dev \
        libldap2-dev \
        libtidy-dev \
        libgmp-dev \
        libxslt1-dev \
        libpspell-dev \
        libsodium-dev \
        libsnmp-dev \
        emacs-nox \
        ack \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm --with-avif \
    && docker-php-ext-install -j$(nproc) \
        gd \
        curl \
        mysqli \
        pdo_mysql \
        pdo_pgsql \
        pgsql \
        mbstring \
        xml \
        zip \
        bcmath \
        exif \
        intl \
        opcache \
        gmp \
        soap \
        sockets \
        bz2 \
        calendar \
        pcntl \
        shmop \
        sysvmsg \
        sysvsem \
        sysvshm \
        gettext \
        ldap \
        tidy \
        xsl \
        pspell \
        sodium \
        snmp \
    && pecl install redis apcu imagick && docker-php-ext-enable redis apcu imagick \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/etc/php/conf.d/ && \
    echo 'memory_limit = 2G' > docker-php-memlimit.ini && \
    echo 'max_execution_time = 300' >> docker-php-memlimit.ini && \
    echo 'max_input_vars = 5000' >> docker-php-memlimit.ini

    
