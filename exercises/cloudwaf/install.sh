#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
sudo yum remove -y java
sudo yum install -y java-1.8.0-openjdk

echo "Install Maven"
sudo yum install -y maven 

echo "Install git"
sudo yum install -y git

echo "Install Docker engine"
sudo yum update -y
sudo amazon-linux-extras install docker
sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
docker network create nginx
docker network create localhost --internal

echo "Install nodejs"
mkdir nodejs && cd nodejs
cat > Dockerfile <<EOF
FROM jenkins/jenkins:lts
LABEL maintainer=”sk@gmail.com”
ENV JAVA_OPTS="-Xmx1024m"
ENV JENKINS_OPTS=" --handlerCountMax=300"
USER jenkins
EXPOSE 8080
EOF
docker build -t jenkins:1.0 .
docker run -d -p 8080:8080  jenkins:1.0 

echo "Install NGINX"
mkdir nginx && cd nginx
cat > nginx.conf <<EOF
upstream jenkins {
  server        127.0.0.1:8080;
}

server {
  listen        80;
  server_name   localhost;

  location / {
    proxy_pass  http://127.0.0.1;
  }
}
EOF
echo "Create nginx docker file and run nginx docker"
cat > Dockerfile <<EOF
FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
EOF
docker build -t nginx:1.0 .
docker run -p 80:8080 nginx:1.0

echo "Start Docker & Jenkins services"
sudo service docker start
sudo service jenkins start