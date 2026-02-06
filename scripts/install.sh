#!/usr/bin/env bash

set -e

echo "Kherbin's Install Script Running"
echo "Installing Docker, MariaDB, PHP, and Tailscale"
sudo pacman -Syu --noconfirm \
  docker \
  docker-compose \
  tailscale

echo "Enabling Docker and Tailscale"
sudo systemctl enable --now docker
sudo systemctl enable --now tailscaled

echo "Make docker run without sudo (root)"
sudo usermod -aG docker "$USER"


echo "Creating folders for data"
mkdir -p ../nextcould-data
mkdir -p db-data

echo "Nextcloud Starting"
docker compose up -d


echo "Required Installation Complete."
