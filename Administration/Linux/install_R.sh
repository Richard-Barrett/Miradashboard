#!/bin/bash -x 
# Created by: Richard Barrett
# Creation Date: 04/22/2019
# Purpose: Install R Shiny Server
# Company: Mirantis 
# ---------------------------------

# The purpose of this script is to install and configure R Shiny Server

# Script Will install R Shiny Base and Gdebi-Core
sudo apt-get -f install r-base -y
sudo apt-get -f install gdebi-core -y

# Install Shiny Package
sudo su - \ -c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""

# Download R Shiny 
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.9.923-amd64.deb
sudo gdebi shiny-server-1.5.9.923-amd64.deb

# --- END-SCRIPT ---


