#!/bin/bash


# Get Updates
apt update && apt upgrade -y


# Install packages to allow apt to use a repository over HTTPS:
apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Use the following command to set up the stable repository.
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker
apt update
apt install docker-ce git

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

systemctl enable docker

useradd jitsi
usermod -L jitsi


# Setup the Docker Container

git clone https://github.com/jitsi/docker-jitsi-meet /home/jitsi/



cp -f -R files/* /home/jitsi/

mkdir -p /home/jitsi/.jitsi-meet-cfg/{web/letsencrypt,transcripts,prosody,jicofo,jvb}





chown -R jitsi /home/jitsi
