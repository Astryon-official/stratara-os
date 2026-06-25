#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/stratara/iso" "$HOME/stratara/cubic" "$HOME/stratara/output"

echo "Starting Cubic..."
echo "Project directory: $HOME/stratara/cubic/stratara-os-0.1"
echo "Original ISO folder: $HOME/stratara/iso"
echo

exec cubic

