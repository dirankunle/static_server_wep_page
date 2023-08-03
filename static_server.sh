#!/bin/bash

echo "Update Server"
echo "#################################"
sudo apt update && sudo apt upgrade -y

echo "Installing packages"
echo "#################################"
sudo apt install apache2 wget unzip -y

echo "Starting HTTPD Service"
echo "#################################"
sudo systemctl start apache2
sudo systemctl enable apache2
echo

echo "Download webfiles"
echo "#################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2130_waso_strategy.zip
unzip 2130_waso_strategy.zip
cd 2130_waso_strategy
cp -r * /var/www/html
echo

echo "Restarting HTTPD Service"
echo "#################################"
sudo systemctl restart apache2
echo

echo "Clean up the Webfiles DIR in TMP"
echo "#################################"
sudo rm -rf /tmp/webfiles
echo sudo rm -rf /tmp/webfiles
echo