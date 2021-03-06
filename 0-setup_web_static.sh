#!/usr/bin/env bash
# Sets up my web servers for the deployment of web_static

sudo apt-get update
sudo apt-get -y install nginx

sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/

echo "Code: 451" | sudo tee /data/web_static/releases/test/index.html

sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/

sudo sed -i "58i \\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}\n\n" /etc/nginx/sites-enabled/default

sudo service nginx restart
