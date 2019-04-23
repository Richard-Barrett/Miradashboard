#!/bin/bash -x 
# Created by: Richard Barrett
# Creation Date: 04/22/2019
# Purpose: Install R Shiny Server
# Company: Mirantis 
# -----------------------------------------------------------------------------
#                              Documentation
# -----------------------------------------------------------------------------
#
# https://devanswers.co/installing-nginx-mysql-php-lemp-stack-ubuntu-18-04/
#
# -----------------------------------------------------------------------------

sudo apt update && sudo apt install nginx

sudo service nginx status

sudo ufw allow OpenSSH

sudo ufw allow 'Nginx HTTP'

sudo ufw enable

sudo ufw status

sudo apt update && sudo apt install mysql-server

sudo service mysql status

sudo mysql_secure_installation

sudo mysqladmin -p -u root version

sudo apt update && sudo apt install php-fpm php-mysql

php --version

ls /var/run/php/

