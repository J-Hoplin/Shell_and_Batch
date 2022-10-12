#!/bin/bash

#Script written by Hoplin

apt-get update
apt-get upgrade

# Go lang installation script
apt-get install software-properties-common
apt-get update
apt-get upgrade
add-apt-repository ppa:longsleep/golang-backports
apt update
apt install golang-go -y

# Python installation
apt-get install python3 -y
apt-get install python3-pip -y

# Node JS Runtime Installation
apt-get install nodejs -y
apt-get install npm
npm install -g n
# Update to latest
n latest
