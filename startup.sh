#!/bin/bash

yum update –y


echo "Install Docker"

yum install docker
systemctl enable docker

echo "Install Docker-Compose"

curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

echo "Installing Chrome Driver"

wget https://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_linux64.zip

unzip chromedriver_linux64.zip

sudo mv chromedriver /usr/bin/chromedriver

chromedriver — version

systemctl start docker





