# This is to install nodejs and nginx container. nginx as reverse proxy
#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
sudo yum remove -y java
sudo yum install -y java-1.8.0-openjdk

echo "Install Maven"
sudo yum install -y maven 

echo "Install git"
sudo yum install -y git

echo "Install Jenkins"
sudo amazon-linux-extras install epel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo   https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo systemctl daemon-reload
sudo systemctl start jenkins


echo "Install NGINX"
sudo amazon-linux-extras install nginx1
sudo chkconfig nginx on
sudo service nginx status

echo "Start Jenkins & nginx"
sudo systemctl start jenkins
sudo service nginx start
