FROM centos:latest

MAINTAINER Gcaufy <gcaufy@gmail.com>

RUN yum update -y && yum clean all
RUN yum install openssh-server syslog httpd httpd-devel php php-pear php-mysql php-gd php-mbstring php-pecl-imagick -y

ADD conf/ /etc/httpd/conf/

RUN mkdir -p /data && rm -fr /var/www/html && ln -s /data /var/www/html && mkdir /data/www.test.com && mkdir /data/www.test2.com
RUN echo '<?php echo "Hello World!<br /> This is www.test.com" ?>' > /data/www.test.com/index.php
RUN echo '<?php echo "Hello World!<br /> This is www.test2.com" ?>' > /data/www.test2.com/index.php

ADD scripts/run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 80
WORKDIR /data

CMD ["/run.sh"]
