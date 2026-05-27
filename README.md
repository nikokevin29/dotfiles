# dotfiles — CachyOS · Hyprland · ThinkPad T490

Personal dotfiles untuk setup Hyprland di CachyOS. Menggunakan [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland) (illogical-impulse) sebagai base shell, dengan kustomisasi di folder `custom/`.

---

## Perangkat

| | |
|---|---|
| **Laptop** | Lenovo ThinkPad T490 |
| **CPU** | Intel Core i5-8365U (Whiskey Lake) |
| **GPU** | Intel UHD Graphics 620 |
| **RAM** | 16GB |
| **OS** | CachyOS (Arch-based) |
| **WM** | Hyprland (Lua config) |
| **Shell** | [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland) (Quickshell) |
| **Terminal** | Kitty |
| **Font** | JetBrains Mono Nerd Font |

---

## Yang Diinclude

```
dotfiles/
├── config/
│   ├── hypr/custom/          # Override Hyprland (monitor, touchpad, keybinds, dll)
│   ├── illogical-impulse/    # Setting end-4 shell (baterai, threshold, dll)
│   ├── kitty/                # Terminal config
│   ├── swappy/               # Screenshot editor config
│   └── fontconfig/           # Font rendering (subpixel off untuk layar non-HiDPI)
├── system/
│   └── modprobe.d/
│       └── i915.conf         # Fix scroll patah-patah (disable Intel PSR)
├── install.sh                # Setup otomatis di mesin baru
└── update.sh                 # Sync config terbaru ke repo ini
```

> File dari end-4/dots-hyprland (`~/.config/quickshell/`, `~/.config/hypr/hyprland/`) tidak diinclude karena dimanage oleh installer end-4 dan akan ter-overwrite saat update.

---

## Kustomisasi Utama

### Hyprland (`config/hypr/custom/`)
- **Scale display 125%** untuk layar 1920×1080 14" T490
- **Touchpad:** scroll_factor 1.2, accel_profile flat (lebih konsisten)
- **Terminal default:** kitty

### System (`system/`)
- **i915 PSR dinonaktifkan** (`enable_psr=0`) — fix teks patah-patah saat scroll di layar laptop Intel

---

## Install di Mesin Baru

### Prasyarat
Pastikan sudah install [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland) terlebih dahulu, lalu:

```bash
git clone https://github.com/nana/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

Script akan:
1. Symlink semua user config ke `~/.config/`
2. Copy `i915.conf` ke `/etc/modprobe.d/` (perlu sudo)
3. Rebuild initramfs otomatis

Setelah selesai, logout dan login ulang.

---

## Update Dotfiles

Kalau ada perubahan config di sistem, sync ke repo:

```bash
cd ~/dotfiles
./update.sh
git add -A
git commit -m "update: deskripsi perubahan"
git push
```

---

## Shortcut Penting

| Shortcut | Aksi |
|---|---|
| `Super + Super` | Search / launcher |
| `Super + Tab` | Overview workspace |
| `Super + Shift + S` | Screenshot area → clipboard |
| `Super + V` | Clipboard history |
| `Super + A` | Sidebar kiri |
| `Super + N` | Sidebar kanan |
| `Super + /` | Cheatsheet lengkap |
| `Ctrl + Super + T` | Ganti wallpaper |
| `Ctrl + Alt + Del` | Menu session (shutdown/restart/logout) |
| `Super + L` | Lock layar |
