#!/bin/bash

# Update the system
sudo yum -y update

# Install Apache web server
sudo yum -y install httpd

# Start Apache web server
sudo systemctl start httpd.service

# Enable Apache to start at boot
sudo systemctl enable httpd.service

type -p yum-config-manager >/dev/null || sudo yum install yum-utils
sudo yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo yum install git -y
g clone https://github.com/sameernagar-hub/PenPulseAWS.git
sudo mv PenPulseAWS/* /var/www/html/