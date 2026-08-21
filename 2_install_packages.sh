#!/bin/sh

# Create default directory
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Videos

# Check CPU vendor
if grep -q "GenuineIntel" /proc/cpuinfo; then
  CPU_VENDOR="intel"
elif grep -q "AuthenticAMD" /proc/cpuinfo; then
  CPU_VENDOR="amd"
else
  echo "CPU vendor is unknown"
  exit 1
fi

# Check OS and install microcode
if [ -x "$(command -v apt-get)" ]; then
  if [ "$CPU_VENDOR" = "intel" ]; then
    echo -e "\n\n\n\n\nInstall intel-microcode\n\n\n\n\n"
    sleep 5
    sudo apt-get update
    sudo apt-get install -y intel-microcode
  elif [ "$CPU_VENDOR" = "amd" ]; then
    echo -e "\n\n\n\n\nInstall amd64-microcode\n\n\n\n\n"
    sleep 5
    sudo apt-get update
    sudo apt-get install -y amd64-microcode
    # AMD GPU firmware
    # sudo apt install -y firmware-amd-graphics libgl1-mesa-dri
  fi
elif [ -x "$(command -v pacman)" ]; then
  if [ "$CPU_VENDOR" = "intel" ]; then
    echo -e "\n\n\n\n\nInstall intel-ucode\n\n\n\n\n"
    sleep 5
    sudo pacman -Sy
    sudo pacman -S --noconfirm intel-ucode
  elif [ "$CPU_VENDOR" = "amd" ]; then
    echo -e "\n\n\n\n\nInstall amd-ucode\n\n\n\n\n"
    sleep 5
    sudo pacman -Sy
    sudo pacman -S --noconfirm amd-ucode
  fi
else
  echo "Unsupported OS"
  exit 1
fi

# function define
Basic_Package() {
  echo -e "\n\n\n\n\n"
  echo -e "Basic_Package"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * sudo                       # Authorization                                         │"
  echo -e "│ * wget                       # Network utility to retrieve files from the web        │"
  echo -e "│ * git                        # The fast distributed version control system           │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S sudo wget git
}
# function run
Basic_Package

Window_Manager() {
  echo -e "\n\n\n\n\n"
  echo -e "Window_Manager"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * hyprland                   # Dynamic tiling Wayland compositor                     │"
  echo -e "│ * hyprpaper                  # Wayland wallpaper utility                             │"
  echo -e "│ * hypridle                   # hyprland’s idle daemon                                │"
  echo -e "│ * xdg-desktop-portal-hyprland    # xdg-desktop-portal backend for hyprland           │"
  echo -e "│ * waybar                     # Wayland bar                                           │"
  echo -e "│ * rofi-wayland               # A window switcher                                     │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S hyprland hyprpaper hypridle xdg-desktop-portal-hyprland waybar rofi-wayland
}
Window_Manager

Sound() {
  echo -e "\n\n\n\n\n"
  echo -e "Sound"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * pavucontrol                # Volume Control                                        │"
  echo -e "│ * alsa-utils                 # The Advanced Linux Sound Architecture (ALSA)          │"
  echo -e "│ * volumeicon                 # Lightweight volume contro                             │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S pavucontrol alsa-utils volumeicon
}
Sound

Brightness() {
  echo -e "\n\n\n\n\n"
  echo -e "Brightness"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * brightnessctl              # Control device brightness                             │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S brightnessctl
}
Brightness

Editors() {
  echo -e "\n\n\n\n\n"
  echo -e "Editors"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * terminator                 # Terminator                                            │"
  echo -e "│ * kitty                      # kitty                                                 │"
  echo -e "│ * neovim                     # NeoVim                                                │"
  echo -e "│ * tmux                       # terminal multiplexer                                  │"
  echo -e "│ * gedit                      # Text editor                                           │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S terminator kitty neovim tmux gedit
}
Editors

SystemInfo() {
  echo -e "\n\n\n\n\n"
  echo -e "SystemInfo"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * neofetch                   # Show system information                               │"
  echo -e "│ * htop                       # Task manager                                          │"
  echo -e "│ * ncdu                       # du alternater, NCurses Disk Usage                     │"
  echo -e "│ * power-options-gtk          # Linux GUI power management                            │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S htop ncdu
  yes | yay -S --noconfirm neofetch power-options-gtk
}
SystemInfo

Display_Management() {
  echo -e "\n\n\n\n\n"
  echo -e "Display_Management"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ // * ly                         # TUI display manager                                │"
  echo -e "│ // * lightdm                    # Lock Screen                                        │"
  echo -e "│ // * arandr                     # arandr                                             │"
  echo -e "│ // * autorandr                  # auto arandr                                        │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  # yes | sudo pacman -S ly arandr autorandr
  # sudo systemctl enable ly.service
}
Display_Management

File_Management() {
  echo -e "\n\n\n\n\n"
  echo -e "File_Management"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ // * pcmanfm                 # file anager                                           │"
  echo -e "│ * unzip                      # unzip                                                 │"
  echo -e "│ * unarchiver                 # unzip alternater                                      │"
  echo -e "│ * trash-cli                  # trash-cli                                             │"
  echo -e "│ * tree                       # tree                                                  │"
  echo -e "│ * fzf                        # fuzzy finder                                          │"
  echo -e "│ * nautilus                   # GNOME file manager                                    │"
  echo -e "│ * gvfs / gvfs-mtp            # Virtual filesystem and MTP support                    │"
  echo -e "│ * xdg-desktop-portal-gtk     # GTK desktop portal backend                            │"
  echo -e "│ * papirus-icon-theme         # Papirus icon theme                                    │"
  echo -e "│ * papirus-folders            # Papirus folder color customization                    │"
  echo -e "│ * ffmpegthumbnailer          # Video thumbnail generator                             │"
  echo -e "│ * file-roller                # GNOME archive manager                                 │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S pcmanfm unzip unarchiver trash-cli tree fzf
  yay -S --needed nautilus gvfs gvfs-mtp xdg-desktop-portal-gtk papirus-icon-theme papirus-folders ffmpegthumbnailer file-roller &&
    gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Light' &&
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' &&
    gsettings set org.gnome.desktop.interface text-scaling-factor 1.25 &&
    xdg-mime default org.gnome.Nautilus.desktop inode/directory
}
File_Management

Image_and_Video() {
  echo -e "\n\n\n\n\n"
  echo -e "Image_and_Video"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * vlc                        # Video Player                                          │"
  echo -e "│ * FFmpeg                     # Convert and stream audio and video                    │"
  echo -e "│ * gpick                      # Color Picker                                          │"
  echo -e "│ * kolourpaint                # Paint                                                 │"
  echo -e "│ * viu                        # Image viewer                                          │"
  echo -e "│ * peek                       # Simple GIF screen recorder                            │"
  echo -e "│ * cheese                     # Camera                                                │"
  echo -e "│ * gnome-screenshot           # screenshooter                                         │"
  echo -e "│ * grim                       # Screenshot utility for Wayland                        │"
  echo -e "│ * slurp                      # Select a region in a Wayland compositor               │"
  echo -e "│ * swappy                     # A Wayland native snapshot editing tool                │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S $(pacman -Ssq '^vlc-') # vlc 와 관련된 모든 패키지 설치
  yes | sudo pacman -S vlc ffmpeg gpick kolourpaint viu peek vlc cheese gnome-screenshot grim slurp swappy
}
Image_and_Video

Office() {
  echo -e "\n\n\n\n\n"
  echo -e "Office"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * libreoffice-still          # Free office application                               │"
  echo -e "│ * libreoffice-still-ko       # Korean language pack for LibreOffice still            │"
  echo -e "│ * hoffice                    # Hancom Office Editor                                  │"
  echo -e "│ * okular                     # PDF viewer                                            │"
  echo -e "│ * mate-calc                  # Mate calculator                                       │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S libreoffice-still libreoffice-still-ko okular mate-calc
  yes | yay -S --noconfirm hoffice
}
Office

Clipboard() {
  echo -e "\n\n\n\n\n"
  echo -e "Clipboard"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * copyq                      # Clipboard manager                                     │"
  echo -e "│ * wl-clipboard               # Command-line copy/paste utilities for Wayland         │"
  echo -e "│ * xclip                      # Command line interface to the X11 clipboard           │"
  echo -e "│ * clipboard-sync             # Synchronizes the clipboard across multiple X11        │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S copyq wl-clipboard xclip
  yes | yay -S clipboard-sync
}
Clipboard

Keyboard_and_Mouse() {
  echo -e "\n\n\n\n\n"
  echo -e "Keyboard_and_Mouse"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * numlockx                   # Control the state of NumLock                          │"
  echo -e "│ * xtrlock                    # Lock display and mouse                                │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S numlockx xtrlock
}
Keyboard_and_Mouse

Monitor_power_saving() {
  echo -e "\n\n\n\n\n"
  echo -e "Monitor_power_saving"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * xorg-xrandr                # 화면 밝기를 조정하는 데 사용                          │"
  echo -e "│ // * xautolock                  # 일정 시간 후에 스크립트를 실행하는 데 사용         │"
  echo -e "│ // * xorg-xprintidle            # 셸 스크립트에서 유휴 상태를 감지하는 데 사용       │"
  echo -e "│ * polkit-gnome               # 시스템 권한 관리 및 인증을 처리                       │"
  echo -e "│ * dex                        # 자동 시작 애플리케이션을 관리하는 도구                │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S xorg-xrandr polkit-gnome dex
}
Monitor_power_saving

Hangul_input() {
  echo -e "\n\n\n\n\n"
  echo -e "Hangul_input"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ // * kime                       # Korean IME                                         │"
  echo -e "│ // * ibus ibus-hangul           # ibus                                               │"
  echo -e "│ // fonts-nanum                  # 나눔 한글 글꼴                                     │"
  echo -e "│ * fcitx-lib* fcitx-hangul fcitx5-gtk       # fcitx                                   │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  yes | yay -S --noconfirm fcitx-lib* fcitx-hangul fcitx5-gtk
}
Hangul_input

Man() {
  echo -e "\n\n\n\n\n"
  echo -e "Man"
  echo -e "┌───────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * tldr                        # man alternater                                        │"
  echo -e "│ * bat                         # Cat clone with syntax highlighting and git integration│"
  echo -e "│ * man-db                      # The online manual database                            │"
  echo -e "│ // * manpages-dev               # Manual pages about using GNU/Linux for development  │"
  echo -e "│ * glib2-docs                  # Low level core library - documentation                │"
  echo -e "└───────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S tldr bat man-db glib2-docs
  tldr -u
}
Man

Compiler() {
  echo -e "\n\n\n\n\n"
  echo -e "Compiler"
  echo -e "┌───────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * gcc                        # GNU C Compiler                                         │"
  echo -e "│ * clang                      # LLVM C/C++ Compiler                                    │"
  echo -e "│ * llvm                       # Compiler infrastructure                                │"
  echo -e "│ * rust                       # rust                                                   │"
  echo -e "│ * bear                       # A tool to generate compilation database                │"
  echo -e "│ * bc                         # An arbitrary precision calculator language             │"
  echo -e "└───────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S gcc clang llvm rust bear bc
}
Compiler

Build() {
  echo -e "\n\n\n\n\n"
  echo -e "Build"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * make                       # Build automation utility (Makefile)                   │"
  echo -e "│ * cmake                      # Build automation utility (CMakeLists.txt)             │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S make cmake
}
Build

Other_Utility() {
  echo -e "\n\n\n\n\n"
  echo -e "Other_Utility"
  echo -e "┌──────────────────────────────────────────────────────────────────────────────────────┐"
  echo -e "│ * aria2                      # Command-line download utility                         │"
  echo -e "│ * ctag                       # Generates an index file of C/C++ Language             │"
  echo -e "│ * ccls                       # C/C++/Objective-C language server                     │"
  echo -e "│ * cscope                     # cscope                                                │"
  echo -e "│ * gdb                        # debug tool                                            │"
  echo -e "│ * python-pip                 # python-pip                                            │"
  echo -e "│ * lazygit                    # Simple terminal UI for git commands                   │"
  echo -e "│ * git-graph                  # Visualize Git history graphs                          │"
  echo -e "│ * git-delta                  # Syntax-highlighting pager for git and diff output     │"
  echo -e "│ * rsync                      # one way                                               │"
  echo -e "│ * unison                     # both way                                              │"
  echo -e "│ * openssh                    # ssh                                                   │"
  echo -e "│ * sshfs                      # FUSE client based on the SSH                          │"
  echo -e "│ * mako                       # Lightweight notification daemon for Wayland           │"
  echo -e "│ * ufw                        # ufw                                                   │"
  echo -e "│ * networkmanager             # nmtui(Network Manager)                                │"
  echo -e "│ * VSCode                     # Visual Studio Code                                    │"
  echo -e "└──────────────────────────────────────────────────────────────────────────────────────┘"
  echo -e "\n\n\n\n\n"
  sleep 5
  yes | sudo pacman -S aria2 ctags ccls cscope gdb python-pip lazygit git-delta rsync unison openssh sshfs mako ufw networkmanager
  cargo install git-graph
  yes | yay -S visual-studio-code-bin
  sudo systemctl enable NetworkManager.service
}
Other_Utility

echo -e "\n\n\n\n\n"
echo -e "┌──────────┐"
echo -e "│  Finish  │"
echo -e "└──────────┘"

# Exit the script
exit 0
