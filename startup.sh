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

curl https://intoli.com/install-google-chrome.sh | bash

sudo mv /usr/bin/google-chrome-stable /usr/bin/google-chrome

google-chrome — version && which google-chrome

wget https://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_linux64.zip

unzip chromedriver_linux64.zip

sudo mv chromedriver /usr/bin/chromedriver

chromedriver — version


# Run the files

docker-compose up
