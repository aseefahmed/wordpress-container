#!/bin/bash
sudo yum update -y
sudo yum install git -y
git clone https://github.com/aseefahmed/mywordpress.git
sudo rm -f /var/www/html/*
sudo cp -r mywordpress/* /var/www/html/

