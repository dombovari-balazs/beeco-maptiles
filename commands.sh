#!/bin/bash

set -e

echo "Updating system packages..."
dnf update -y

echo "Installing core utilities..."
dnf install -y \
    bash \
    git \
    make \
    bc \
    coreutils \
    unzip \
    wget \
    which

# md5sum is part of coreutils, just making sure
command -v md5sum >/dev/null || {
    echo "md5sum is not available. Something's wrong with coreutils."
    exit 1
}

echo "Installing Docker..."
dnf install -y docker

echo "Enabling and starting Docker service..."
systemctl enable --now docker

echo "Adding ec2-user to the docker group..."
usermod -aG docker ec2-user

echo "Installing Docker Compose..."
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Symlink if needed
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose || true

echo "Verifying Docker version..."
docker --version
docker-compose --version

echo "All dependencies are installed. You may need to reboot or re-login for docker group permissions to take effect."

echo "✅ Setup complete!"
