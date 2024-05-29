#!/bin/sh

curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/userData?api-version=2021-01-01&format=text" | base64 --decode > nginx.conf

sudo systemctl stop nginx

sudo dnf install nginx -y

sudo cp nginx.conf /etc/nginx/nginx.conf

sudo systemctl enable nginx
sudo systemctl start nginx
sudo iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT
