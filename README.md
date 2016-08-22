[![Build Status](https://travis-ci.org/pvlltvk/php7-fpm.svg?branch=master)](https://travis-ci.org/pvlltvk/php7-fpm)
[![](https://images.microbadger.com/badges/image/pvlltvk/php7-fpm.svg)](http://microbadger.com/images/pvlltvk/php7-fpm "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/pvlltvk/php7-fpm.svg)](http://microbadger.com/images/pvlltvk/php7-fpm "Get your own version badge on microbadger.com")

Dockerfile to build PHP7-FPM image. Based on official PHP 7 Alpine image.  

## PHP extentions

Additional PHP extentions in this image:

- [GD](http://php.net/manual/en/intro.image.php)
- [Mcrypt](http://php.net/manual/en/intro.mcrypt.php)
- [XML-RPC](http://php.net/manual/en/intro.xmlrpc.php)
- [PDO](http://php.net/manual/en/intro.pdo.php)
- [PDO_MYSQL](http://php.net/manual/en/ref.pdo-mysql.php)
- [PDO_PGSQL](http://php.net/manual/en/ref.pdo-pgsql.php)
- [PDO_SQLITE](http://php.net/manual/en/ref.pdo-sqlite.php)
- [phpredis](https://github.com/phpredis/phpredis)

## Getting image

This image can be pulled from [Docker Hub](https://hub.docker.com/r/pvlltvk/php7-fpm/):

```
docker pull pvlltvk/php7-fpm
```

## Build

It's possible to change PHP config files (php.ini, php-fpm.conf, www.conf) before build.

```
$ docker build -t repository/imagename:tag .
```
## Available configuration parameters

Environment variables can be used in PHP configuration files. List of variables that used in php.ini and www.conf.

- `FPM_PM`: used in pm directive in www.conf. Default: static.
- `FPM_PM_MAX_CHILDREN`: used in pm.max_children directive in www.conf. Default: 4.
- `PHP_DATE_TIMEZONE`: used in [date.timezone](http://php.net/manual/en/datetime.configuration.php#ini.date.timezone) directive in php.ini. Default: Europe/Moscow.
- `PHP_MEMORY_LIMIT`: used in [memory_limit](http://php.net/manual/en/ini.core.php#ini.memory-limit) directive in php.ini. Default: 256M.
- `PHP_POST_MAX_SIZE`: used in [post_max_size](http://php.net/manual/en/ini.core.php#ini.post-max-size) directive in php.ini. Default: 20M.
- `PHP_UPLOAD_MAX_SIZE`: used in [upload_max_size](http://php.net/manual/en/ini.core.php#ini.upload-max-filesize) directrive in php.ihi. Default: 20M.
- `PHP_SMTP`: used in [SMTP](http://php.net/manual/en/mail.configuration.php#ini.smtp) directive in php.ini. Default: localhost.
- `PHP_SMTP_PORT`: used in [smtp_port](http://php.net/manual/ru/mail.configuration.php#ini.smtp-port) directive in php.ini. Default: 25.

You can use `-e` docker run command option to change default variables value.  

## Usage

Run with name, mount host directory as a container data volume, set `FPM_PM_MAX_CHILDREN` to 8 and map network ports inside our container to our host. You can put PHP application in this host directory.

```
$ docker run -d -P --name example_name -e "FPM_PM_MAX_CHILDREN=8" -v /example_host_directory:/example_container_volume pvlltvk/php7-fpm
```

## Exposed ports
* 9000
