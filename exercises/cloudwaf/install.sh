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

echo "Install Jenkins"
docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home jenkins

echo "Install NGINX"
docker run --name cloudwaf-nginx -d -p 80:8080 some-content-nginx

echo "Start Docker & Jenkins services"
sudo service docker start
sudo service jenkins start