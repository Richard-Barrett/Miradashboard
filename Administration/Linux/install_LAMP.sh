#!/bin/bash -x 
# Created by: Richard Barrett
# Creation Date: 04/22/2019
# Purpose: Install R Shiny Server
# Company: Mirantis 
# ------------------------------------------------------------------------------------------------------------------
#                                                Documentation
# ------------------------------------------------------------------------------------------------------------------
#
# https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04
#
# -------------------------------------------------------------------------------------------------------------------

# Step 1. Install Apache2 if not Installed
# ----------------------------------------

sudo apt-get install apache2

sudo apache2ctl configtest

sudo ufw app list

sudo ufw app info "Apache Full"

sudo ufw allow in "Apache Full"

# Step 2. Install MySQL if not Installed
# --------------------------------------

sudo apt-get install mysql-server

mysql_secure_installation

# Step 3. Install PHP if not Installed
# -------------------------------------

# I need to add in error checking
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql

sudo systemctl restart apache2

sudo systemctl status apache2

# ---------------------- End-Script -------------------------
