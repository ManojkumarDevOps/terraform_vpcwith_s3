#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y nginx git 
systemctl start nginx
systemctl enable nginx
echo "Nginx is working now " | sudo tee /var/www/html/index.html
sudo systemctl restart nginx
