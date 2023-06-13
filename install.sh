#!/bin/sh Text to ASCII ART Generator
# URL : https://patorjk.com/software/taag
# ASCII Art Font : ANSI Shadow
# ASCII More Opts(Format the output) : Echo commands



# read -p "Are you using an Intel CPU?(No is AMD) <Y/N> " prompt
# if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
# then
#     sudo apt install -y intel-microcode 
# else
#     sudo apt install -y amd64-microcode
#     # sudo apt install -y firmware-amd-graphics libgl1-mesa-dri   # AMD GPU firmware
# fi

Basic_Package=(
    sudo
    wget
    git
    curl                                    # Command line to data transfer tool 
)

Window_Manager=(
    xorg
    i3
    i3status
)

Sound_Packages=(
    pulseaudio                              # Sound server program
    pavucontrol                             # Volume Control
    alsa-utils                              # The Advanced Linux Sound Architecture (ALSA)
    volumeicon-alsa                         # Lightweight volume control (compatible with ALSA)
)

Brightness=(
    brightnessctl                           # Control device brightness
)

Utility=(
    ack-grep                                # grep alternater
    neofetch                                # Show system information
    terminator                              # Terminator
    htop                                    # Task manager
    tlp tlp-rdw                             # Saving laptop battery power
    neovim                                  # NeoVim
    xdotool                                 # command-line X11 automation tool
    arandr                                  # arandr GUI
    autorandr                               # auto arandr
    xclip                                   # provides an interface to the clipboard
    rofi                                    # Application dmenu
    lightdm                                 # Lock Screen
    #xdm                                     # Lock Screen
    xfce4-power-manager                     # xfce power manager
    gpick                                   # Color Picker
    numlockx                                # Control the state of NumLock
    vlc                                     # Video Player
    ranger                                  # ranger
    ncal                                    # calendar
    #xpad                                   # Sticky note application
    kolourpaint                             # Paint
    mcomix                                  # Comic book viewer
    feh                                     # Image viewer
    peek                                    # Simple GIF screen recorder
    gedit                                   # Text editor
    #leafpad                                # Text editor
    #xfce4-screenshooter                    # screenshooter
    scrot                                   # screenshooter
    mate-calc                               # Mate calculator
    #apcalc                                  # CLI calculator
    libreoffice                             # Free office application
    okular                                  # PDF viewer
    aria2                                   # Command-line download utility
    cheese                                  # Camera
    parcellite                              # Clipboard tool (Shortcut : Ctrl+Alt+H)
    unar                                    # unzip alternater
    xinput                                  # utility to configure and test X input devices
    barrier                                 # KVM software
    trash-cli                               # trash-cli
    network-manager                         # nmtui(Network Manager)
    xtrlock                                 # Lock display and mouse
)

Man=(
    tldr                                    # man alternater
    man-db                                  # The online manual database.
    manpages-dev                            # Manual pages about using GNU/Linux for development
    glibc-doc                               # GNU C Library: Documentation
    ncdu                                    # du alternater, NCurses Disk Usage
)

Hangul_input=(
    ibus ibus-hangul fonts-nanum            # ibus
    # fcitx-lib* fcitx-hangul fonts-nanum     # fcitx
)

Developer_Utility=(
    software-properties-common              # PPA Support
    openjdk-17-jdk                          # JDK 17
    build-essential gcc g++                 # C/C++ 컴파일러 & 기본 라이브러리
    make cmake                              # C/C++ 컴파일러 & 기본 라이브러리
    libc6-dev                               # C 라이브러리
    libncurses5-dev                         # C 라이브러리
    moreutis                                # Collection of the unix tools(errno 사용하기 위해 설치)
    ccls                                    # C/C++/Objective-C 언어 서버
    exuberant-ctags                         # ctag
    cscope                                  # cscope
    clang                                   # clang
    clang-format                            # clang-format
    python3-dev python3-pip python3-venv    # python
    gdb                                     # 디버거
    fuse libfuse2                           # FUSE (Filesystem in Userspace)
    virtualbox                              # Virtual machine
    rsync                                   # one way
    unison                                  # both way
)

Remove_Package=(
    nano
    vim
    vim-common
    vim-nox
    vim-runtime
    vim-tiny
    mousepad
    qterminal
    xfce4-terminal
    xiterm+thai
    xterm
    mlterm
    parole
    firefox
)

echo "Are you using Debian or Arch?"
read -p "(Debian is D, Arch is A) <D/A> " prompt
if [[ $prompt == "D" || $prompt == "d" ]]; then


# ----- Debian Update & Upgrade -----
sudo apt-get update
sudo apt-get upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# ----- Create Directory -----
mkdir -p ~/Downloads
mkdir -p ~/Videos

# ----- Install Chrome -----
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install python3-apt -y
sudo apt install ./google-chrome-stable_current_amd64.deb -y
sudo rm -rf google-chrome-stable_current_amd64

# ----- Install Packages -----
sudo apt install -y "${Basic_Package[@]}"
sudo apt install -y "${Window_Manager[@]}"
sudo apt install -y "${Sound_Packages[@]}"
sudo apt install -y "${Brightness[@]}"
sudo apt install -y "${Utility[@]}"
sudo apt install -y "${Man[@]}"
sudo apt install -y "${Hangul_input[@]}"
sudo apt install -y "${Developer_Utility[@]}"

sudo apt install ssh -y
sudo apt install ufw -y
sudo ufw enable
sudo ufw allow 22/tcp

sudo apt purge -y "${Remove_Package[@]}"
sudo rm -rf /etc/firefox/ /usr/lib/firefox* /usr/lib/firefox-addons/ /home/leedaeeun/.mozilla

# Fin
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y


elif [[ $prompt == "A" || $prompt == "a" ]]; then

# ----- Arch Update & Upgrade -----
yes | sudo pacman -Syu

# ----- Create Directory -----
mkdir -p ~/Downloads
mkdir -p ~/Videos

# ----- Install Chrome -----

# ----- Install Packages -----
yes | sudo pacman -S "${Basic_Package[@]}"
yes | sudo pacman -S "${Window_Manager[@]}"
yes | sudo pacman -S "${Sound_Packages[@]}"
yes | sudo pacman -S "${Brightness[@]}"
yes | sudo pacman -S "${Utility[@]}"
yes | sudo pacman -S "${Man[@]}"
yes | sudo pacman -S "${Hangul_input[@]}"
yes | sudo pacman -S "${Developer_Utility[@]}"

yes | sudo pacman -S openssh
yes | sudo pacman -S ufw
sudo ufw enable
sudo ufw allow 22/tcp

yes | sudo pacman -Rs "${Remove_Package[@]}"
sudo rm -rf /etc/firefox/ /usr/lib/firefox* /usr/lib/firefox-addons/ ~/.mozilla

# Fin
yes | sudo pacman -Syu



else
	echo "other"
fi


#KDE Connect ufw setting
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw reload

#KDE Connect ufw firewall
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload

# Exit the script
exit 0
