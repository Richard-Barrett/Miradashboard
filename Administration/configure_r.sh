#!/bin/bash -x 
# Created by: Richard Barrett
# Creation Date: 04/22/2019
# Purpose: Install R Shiny Server
# Company: Mirantis 
# ---------------------------------

# Change into the Home Directory
cd ~

# Make specific Directories for R Server and User Sessions and move into R directory
mkdir R

cd ~/R

# Create Specific directories within the R Directory
mkdir Users
mkdir Packages 
mkdir Sessions
mkdir Interfaces
mkdir Docuementation
mkdir Libraries 
mkdir Hadoop
mkdir Stackstorm
mkdir G-Suite

# Change into G-Suite Directory and Symbolic Links with G-Sheets to Track URLS in Current Use
cd ~/R/G-Suite

# ------------------ END-Script ---------------------
