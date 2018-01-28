#!/bin/sh

# Add Google Chrome repository
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y upgrade

# Install the basics
sudo apt-get -y install google-chrome-stable vim git bash-completion

# Configure git
git config --global user.name "pizzyflavin"
git config --global user.email "pizzyflavin@gmail.com"
git config --global push.default "simple"

