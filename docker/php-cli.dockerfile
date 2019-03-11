FROM php:7.0-cli

RUN echo 'Acquire::By-Hash "yes";' >> /etc/apt/apt.conf
RUN echo 'Acquire::CompressionTypes::Order:: "gz";' >> /etc/apt/apt.conf
RUN echo 'Acquire::http::Pipeline-Depth 0;' >> /etc/apt/apt.conf
RUN echo 'Acquire::http::No-Cache true;' >> /etc/apt/apt.conf
RUN echo 'Acquire::BrokenProxy    true;' >> /etc/apt/apt.conf

RUN apt-get clean && apt-get update
RUN apt-get clean && apt-get update
RUN apt-get install -y --no-install-recommends \
    zlib1g-dev \
    git \
    ssh \
    libzip-dev && \
    docker-php-ext-install \
    zip

# Install Composer
RUN curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
