#!/bin/bash
# Timewarrior installation script for Stow-managed dotfiles

set -e

USER=$(whoami)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

echo "Setting up Timewarrior..."

# Create necessary directories
mkdir -p ~/.ssh/sockets
mkdir -p ~/bin

# Install stow package
stow -d "$DOTFILES_DIR" timewarrior

# Set permissions
chmod +x ~/bin/timew-backup
chmod +x ~/.task/hooks/on-modify.timewarrior

# Install systemd service
if [[ -f "$SCRIPT_DIR/etc/systemd/system/timew-backup.service.template" ]]; then
  sudo sed "s/__USER__/$USER/g" "$SCRIPT_DIR/etc/systemd/system/timew-backup.service.template" >/tmp/timew-backup.service
  sudo mv /tmp/timew-backup.service /etc/systemd/system/
  sudo systemctl daemon-reload
  sudo systemctl enable timew-backup.service
fi

echo "Setup complete!"
