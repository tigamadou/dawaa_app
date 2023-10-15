# Use an official PHP image as a parent image
FROM php:8.0-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Set COMPOSER_ALLOW_SUPERUSER environment variable to allow Composer to run as root/superuser
ENV COMPOSER_ALLOW_SUPERUSER=1

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql mbstring exif pcntl bcmath soap

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# # Copy Laravel application files from the 'dawaa' folder into the container
# COPY dawaa/.env.example .env

# # Install Laravel dependencies using Composer
# RUN composer install

# # Generate Laravel application key
# RUN php artisan key:generate

# Set working directory to /var/www/html
WORKDIR /var/www/dawaa
# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
