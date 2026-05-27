#!/bin/bash
# Install dotfiles to a new machine
# Usage: ./install.sh

set -e

DOTFILES="$(dirname "$(realpath "$0")")"

echo "==> Installing dotfiles from $DOTFILES"

# --- User configs ---
mkdir -p ~/.config/hypr ~/.config/illogical-impulse ~/.config/kitty ~/.config/swappy ~/.config/fontconfig

# Symlink directories/files so edits stay in sync with the repo
ln -sfn "$DOTFILES/config/hypr/custom"                       ~/.config/hypr/custom
ln -sf  "$DOTFILES/config/illogical-impulse/config.json"     ~/.config/illogical-impulse/config.json
ln -sf  "$DOTFILES/config/kitty/kitty.conf"                  ~/.config/kitty/kitty.conf
ln -sf  "$DOTFILES/config/swappy/config"                     ~/.config/swappy/config
ln -sf  "$DOTFILES/config/fontconfig/fonts.conf"             ~/.config/fontconfig/fonts.conf

echo "    User configs linked"

# --- System files (need sudo) ---
echo "==> Applying system configs (sudo required)"
sudo cp "$DOTFILES/system/modprobe.d/i915.conf" /etc/modprobe.d/i915.conf
sudo mkinitcpio -P > /dev/null 2>&1 && echo "    initramfs rebuilt (PSR fix applied)"

echo ""
echo "Done! Logout dan login ulang untuk menerapkan semua perubahan."
echo "Kalau baru install Hyprland: jalankan juga end-4 dots-hyprland setup terlebih dahulu."
