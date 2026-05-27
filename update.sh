#!/bin/bash
# Sync latest configs from system into this dotfiles repo
# Run this before git commit kalau ada perubahan config

DOTFILES="$(dirname "$(realpath "$0")")"

cp -r ~/.config/hypr/custom/.                          "$DOTFILES/config/hypr/custom/"
cp    ~/.config/illogical-impulse/config.json          "$DOTFILES/config/illogical-impulse/"
cp    ~/.config/kitty/kitty.conf                       "$DOTFILES/config/kitty/"
cp    ~/.config/swappy/config                          "$DOTFILES/config/swappy/"
cp    ~/.config/fontconfig/fonts.conf                  "$DOTFILES/config/fontconfig/"
cp    /etc/modprobe.d/i915.conf                        "$DOTFILES/system/modprobe.d/"

echo "Dotfiles updated. Jalankan: git add -A && git commit && git push"
