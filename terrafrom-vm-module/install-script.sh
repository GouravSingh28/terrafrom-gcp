#!/bin/bash

# Update and install prerequisites
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y curl wget git unzip

# Install Docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Clone the repository
REPO_URL="https://github.com/your-repo.git"  # Replace with your repository URL
git clone $REPO_URL /opt/your-repo

# Install Java
sudo apt install -y openjdk-17-jdk
JAVA_VERSION=$(java -version 2>&1 | head -n 1)
echo "Java installed: $JAVA_VERSION"

# Download and extract Keycloak
KEYCLOAK_VERSION="21.1.1"  # Replace with your desired version
wget https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz -P /tmp
sudo tar -xzf /tmp/keycloak-${KEYCLOAK_VERSION}.tar.gz -C /opt/
sudo mv /opt/keycloak-${KEYCLOAK_VERSION} /opt/keycloak

# Set permissions
sudo chown -R $(whoami):$(whoami) /opt/keycloak

# Start Keycloak services
cd /opt/keycloak/bin
./kc.sh start-dev

# Print completion message
echo "Setup completed. Keycloak is running."
