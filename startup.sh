#!/bin/bash

yum update –y

# Install Git

yum install git

# Install Docker

yum install docker
systemctl enable docker

# Install Docker-Compose

curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

# Chrome on EC2

wget https://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_linux64.zip

unzip chromedriver_linux64.zip

sudo mv chromedriver /usr/bin/chromedriver

chromedriver — version

git clone https://github.com/koushikpr/Selenium-Test-on-AWS-Using-Docker

# Run the files

systemctl start docker

docker pull selenium/standalone-chrome
docker run -d -p 4444:4444 -v /dev/shm:/dev/shm selenium/standalone-chrome

cd Selenium-Test-on-AWS-Using-Docker

docker-compose up



