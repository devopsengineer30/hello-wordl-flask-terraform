#!/bin/bash
set -ex
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
cd /home/ec2-user/code
eval $(aws ecr get-login --registry-ids 573973682192 --region eu-central-1 --no-include-email)
docker build -t hello-world-flask .
docker tag hello-world-flask:latest 573973682192.dkr.ecr.eu-central-1.amazonaws.com/hello-world-flask:latest
docker push 573973682192.dkr.ecr.eu-central-1.amazonaws.com/hello-world-flask
docker-compose up -d
