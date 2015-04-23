
FROM centos:centos6

MAINTAINER Gary Straughan <gary.straughan@brainboxweb.co.uk>

RUN yum -y update

RUN yum -y install httpd gcc make git mysql-server mysql mysql-client python-setuptools

RUN rpm -Uvh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum -y install --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-pecl-xdebug php-pecl-xhprof pcre-devel php-gd php-gmp       php-intl openssl-devel #openssl-devel required for pecl

ADD mongodb.repo /etc/yum.repos.d/mongodb.repo
RUN yum install -y mongodb-org
RUN mkdir /data
RUN mkdir /data/db
RUN pecl install -f mongo-1.5.4
RUN echo extension=mongo.so >> /etc/php.d/mongo.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
ADD sample/ /app

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
