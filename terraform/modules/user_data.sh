#!/bin/bash
sudo yum update -y
sudo yum install git -y
git clone https://github.com/aseefahmed/mywordpress.git
cd mywordpress
docker-compose build
docker-compose up -d
