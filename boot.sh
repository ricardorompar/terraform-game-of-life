#!/bin/bash
apt-get update
apt-get install -y docker.io git
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
usermod -aG docker ubuntu
cd /home/ubuntu
# Clone the app repo (assume repo will be created as 'game-of-life-app')
git clone https://github.com/ricardoromeroparedes/game-of-life-app.git || true
cd game-of-life-app
/usr/local/bin/docker-compose up -d
