#!/bin/bash
# Stratara OS Build Script
# Astryon - All Rights Reserved

set -e

# Colours for output
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${PURPLE}"
echo "  ____  _             _                  "
echo " / ___|| |_ _ __ __ _| |_ __ _ _ __ __ _ "
echo " \___ \| __| '__/ _\` | __/ _\` | '__/ _\` |"
echo "  ___) | |_| | | (_| | || (_| | | | (_| |"
echo " |____/ \__|_|  \__,_|\__\__,_|_|  \__,_|"
echo -e "${NC}"
echo -e "${GREEN}Stratara OS Build System v0.1${NC}"
echo -e "${GREEN}Astryon - Astryon has no limit${NC}"
echo ""

# Variables
BUILD_DIR="$(pwd)/build"
BASE_DISTRO="ubuntu"
BASE_VERSION="noble"
ARCH="amd64"

echo "[1/5] Checking dependencies..."
for cmd in debootstrap mksquashfs xorriso grub-mkrescue; do
    if ! command -v $cmd &> /dev/null; then
        echo -e "${RED}Missing: $cmd — run sudo apt install $cmd${NC}"
        exit 1
    fi
done
echo -e "${GREEN}All dependencies found!${NC}"

echo "[2/5] Setting up build directory..."
mkdir -p "$BUILD_DIR/chroot"
mkdir -p "$BUILD_DIR/iso/live"
mkdir -p "$BUILD_DIR/iso/boot/grub"
echo -e "${GREEN}Build directory ready!${NC}"

echo ""
echo -e "${GREEN}Build environment ready. Full build coming soon!${NC}"
