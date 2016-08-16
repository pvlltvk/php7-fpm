# pvlltvk/php7-fpm

Repo for PHP7-FPM based on official PHP 7 Alpine repository.  

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

This image can be pulled from [Docker Hub](https://hub.docker.com):
```
docker pull pvlltvk/php7-fpm
```

## Build
Configuration files (php.ini, php-fpm.conf, www.conf) copy to image on build. It's possible to change this config files before build
```
$ docker build -t repository/imagename:tag .
```

## Run

#### Run in foreground

```
$ docker run pvlltvk/php7-fpm
```

#### Run in background

```
$ docker run -d pvlltvk/php7-fpm
```

#### Run in background with some options

Run with name, mount host directory as a container data volume and map network ports inside our container to our host. You can put PHP application in this host directory.

```
$ docker run -d -P --name example_name -v /example_host_directory:/example_container_volume pvlltvk/php7-fpm
```

## Exposed ports

* 9000
