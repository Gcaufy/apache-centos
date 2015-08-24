# apache-centos
apache container based on centos:latest

### Build
`docker build -t apache.centos .`

### Run
`docker run -d -p 80:80 apache.centos`

### Link to  mysql
`docker run -d -p 80:80 -v /data/docker/apache/logs:/var/log/httpd -v /data/docker/apache/app:/data --link ubuntu.mysql:db --name lamp centos.apache`
