#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Stratara OS Cubic build VM setup${NC}"

if ! command -v sudo >/dev/null 2>&1; then
  echo "sudo is required. Run this on the Kubuntu build VM user account."
  exit 1
fi

echo -e "${YELLOW}[1/4] Updating package lists...${NC}"
sudo apt update

echo -e "${YELLOW}[2/4] Installing base tools...${NC}"
sudo apt install -y \
  software-properties-common \
  git \
  curl \
  wget \
  ca-certificates \
  xorriso \
  squashfs-tools \
  p7zip-full

echo -e "${YELLOW}[3/4] Installing Cubic...${NC}"
if ! grep -R "cubic-wizard" /etc/apt/sources.list /etc/apt/sources.list.d >/dev/null 2>&1; then
  sudo add-apt-repository -y ppa:cubic-wizard/release
fi
sudo apt update
sudo apt install -y cubic

echo -e "${YELLOW}[4/4] Creating local Stratara build folders...${NC}"
mkdir -p "$HOME/stratara/iso" "$HOME/stratara/cubic" "$HOME/stratara/output"

cat <<EOF

${GREEN}Build VM is ready.${NC}

Put the Kubuntu 24.04 LTS ISO in:
  $HOME/stratara/iso

Then start Cubic:
  cubic

Use this project directory:
  $HOME/stratara/cubic/stratara-os-0.1

EOF

