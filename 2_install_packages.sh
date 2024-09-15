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

# Common packages (공통 패키지들을 변수에 저장)
Basic_Package="sudo wget git"
Window_Manager="sway xorg-xwayland i3status"
Sound="pavucontrol alsa-utils"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ # pulseaudio                  # Sound server program                                │
# │ pavucontrol                 # Volume Control                                        │
# │ alsa-utils                  # The Advanced Linux Sound Architecture (ALSA)          │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Brightness="brightnessctl"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ brightnessctl               # Control device brightness                             │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Editors="terminator neovim tmux gedit"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ terminator                  # Terminator                                            │
# │ neovim                      # NeoVim                                                │
# │ tmux                        # terminal multiplexer                                  │
# │ gedit                       # Text editor                                           │
# │ # leafpad                   # Text editor                                           │
# └─────────────────────────────────────────────────────────────────────────────────────┘
SystemInfo="neofetch htop ncdu"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ neofetch                    # Show system information                               │
# │ htop                        # Task manager                                          │
# │ ncdu                        # du alternater, NCurses Disk Usage                     │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Display_Management="ly arandr lxrandr autorandr"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ lightdm                     # Lock Screen                                           │
# │ arandr                      # arandr                                                │
# │ lxrandr                     # lxrandr                                               │
# │ autorandr                   # auto arandr                                           │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Power_Management=""
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ # tlp tlp-rdw                 # Saving laptop battery power                         │
# │ xfce4-power-manager         # xfce power manager                                    │
# │ xfce4-screensaver           # xfce screenaver                                       │
# └─────────────────────────────────────────────────────────────────────────────────────┘
File_Management="unzip trash-cli"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ unzip                       # unzip                                                 │
# │ # ranger                    # ranger                                                │
# │ trash-cli                   # trash-cli                                             │
# │ fzf                         # fuzzy finder                                          │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Image_and_Video="gpick kolourpaint feh peek vlc cheese gnome-screenshot"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ gpick                       # Color Picker                                          │
# │ kolourpaint                 # Paint                                                 │
# │ # mcomix                      # Comic book viewer                                   │
# │ feh                         # Image viewer                                          │
# │ peek                        # Simple GIF screen recorder                            │
# │ vlc                         # Video Player                                          │
# │ cheese                      # Camera                                                │
# │ # xfce4-screenshooter       # screenshooter                                         │
# │ # scrot                     # screenshooter                                         │
# │ gnome-screenshot            # screenshooter                                         │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Office="libreoffice-still okular mate-calc"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ libreoffice-still           # Free office application                               │
# │ okular                      # PDF viewer                                            │
# │ # xpad                      # Sticky note application                               │
# │ mate-calc                   # Mate calculator                                       │
# │ # apcalc                    # CLI calculator                                        │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Clipboard="copyq"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ xdotool                     # command-line X11 automation tool                      │
# │ xclip                       # provides an interface to the clipboard                │
# │ parcellite                  # Clipboard tool (Shortcut : Ctrl+Alt+H)                │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Keyboard_and_Mouse="numlockx xtrlock barrier"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ numlockx                    # Control the state of NumLock                          │
# │ xtrlock                     # Lock display and mouse                                │
# │ barrier                     # KVM software                                          │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Monitor_power_saving=""
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ xorg-xrandr                 # 화면 밝기를 조정하는 데 사용                          │
# │ xautolock                   # 일정 시간 후에 스크립트를 실행하는 데 사용            │
# │ xorg-xprintidle             # 셸 스크립트에서 유휴 상태를 감지하는 데 사용          │
# │ polkit-gnome                # 시스템 권한 관리 및 인증을 처리                       │
# │ dex                         # 자동 시작 애플리케이션을 관리하는 도구                │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Man="tldr bat"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ tldr                        # man alternater                                        │
# │ bat                         # Cat clone with syntax highlighting and git integration│
# │ man-db                      # The online manual database                            │
# │ manpages-dev                # Manual pages about using GNU/Linux for development    │
# │ glibc-doc                   # GNU C Library: Documentation                          │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Hangul_input="ibus ibus-hangul"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ ibus ibus-hangul            # ibus                                                  │
# │ # fonts-nanum               # 나눔 한글 글꼴                                        │
# │ # fcitx-lib* fcitx-hangul   # fcitx                                                 │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Compiler="gcc clang cargo"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ gcc                         # GNU C Compiler                                        │
# │ clang LLVM                  # LLVM C/C++ Compiler                                   │
# │ cargo                       # Rust package manager                                  │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Build="make cmake"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ make                        # Build automation utility (Makefile)                   │
# │ cmake                       # Build automation utility (CMakeLists.txt)             │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Other_Utility="rofi aria2 barrier"
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ rofi                        # Application dmenu                                     │
# │ aria2                       # Command-line download utility                         │
# │ barrier                     # KVM software                                          │
# │ build-essential             # meta-package                                          │
# │ ccls                        # C/C++/Objective-C language server                     │
# │ cscope                      # cscope                                                │
# │ gdb                         # debug tool                                            │
# │ virtualbox                  # Virtual machine                                       │
# │ rsync                       # one way                                               │
# │ unison                      # both way                                              │
# │ openssh                     # ssh                                                   │
# │ ufw                         # ufw                                                   │
# └─────────────────────────────────────────────────────────────────────────────────────┘

# install_packages function (패키지 설치 함수)
install_packages() {
  if [ -x "$(command -v apt)" ]; then
    # Common packages install
    sudo apt install $1
  elif [ -x "$(command -v pacman)" ]; then
    # Common packages install
    sudo pacman -S --noconfirm $1
  else
    echo "Package manager not found. Exiting."
    exit 1
  fi
}

# run install_packages function (패키지 설치 함수 실행)
echo -e "\n\n\n\n\nRun Basic_Package\n\n\n\n\n"
sleep 5
install_packages "$Basic_Package"

echo -e "\n\n\n\n\nRun i3_Window_Manager\n\n\n\n\n"
sleep 5
install_packages "$i3_Window_Manager"

echo -e "\n\n\n\n\nRun Sound\n\n\n\n\n"
sleep 5
install_packages "$Sound"

echo -e "\n\n\n\n\nRun Brightness\n\n\n\n\n"
sleep 5
install_packages "$Brightness"

echo -e "\n\n\n\n\nRun Editors\n\n\n\n\n"
sleep 5
install_packages "$Editors"

echo -e "\n\n\n\n\nRun SystemInfo\n\n\n\n\n"
sleep 5
echo "Run SystemInfo"
install_packages "$SystemInfo"

echo -e "\n\n\n\n\nRun Display_Management\n\n\n\n\n"
sleep 5
install_packages "$Display_Management"

echo -e "\n\n\n\n\nRun Power_Management\n\n\n\n\n"
sleep 5
install_packages "$Power_Management"

echo -e "\n\n\n\n\nRun File_Management\n\n\n\n\n"
sleep 5
install_packages "$File_Management"

echo -e "\n\n\n\n\nRun Image_and_Video\n\n\n\n\n"
sleep 5
install_packages "$Image_and_Video"

echo -e "\n\n\n\n\nRun Office\n\n\n\n\n"
sleep 5
install_packages "$Office"

echo -e "\n\n\n\n\nRun Clipboard\n\n\n\n\n"
sleep 5
install_packages "$Clipboard"

echo -e "\n\n\n\n\nRun Keyboard_and_Mouse\n\n\n\n\n"
sleep 5
install_packages "$Keyboard_and_Mouse"

echo -e "\n\n\n\n\nRun Monitor_power_saving\n\n\n\n\n"
sleep 5
install_packages "$Monitor_power_saving"

echo -e "\n\n\n\n\nRun Man\n\n\n\n\n"
sleep 5
install_packages "$Man"

echo -e "\n\n\n\n\nRun Hangul_input\n\n\n\n\n"
sleep 5
install_packages "$Hangul_input"

echo -e "\n\n\n\n\nRun Compiler\n\n\n\n\n"
sleep 5
install_packages "$Compiler"

echo -e "\n\n\n\n\nRun Build\n\n\n\n\n"
sleep 5
install_packages "$Build"

echo -e "\n\n\n\n\nRun Other_Utility\n\n\n\n\n"
sleep 5
install_packages "$Other_Utility"

# Install exception handling package (예외 처리 패키지 설치)"
echo -e "\n\n\n\n\nInstall exception handling package (예외 처리 패키지 설치)\n\n\n\n\n"
sleep 5
if [ -x "$(command -v apt-get)" ]; then
  # apt exception handling package (apt 예외 처리 패키지)
  sudo apt install openjdk-17-jdk -y # JDK 17
  sudo apt install tlp tlp-rdw -y    # Saving laptop battery power
  # sudo apt install xorg                                 # xorg
  sudo apt install volumeicon-alsa -y                      # Lightweight volume control
  sudo apt install unar -y                                 # unzip alternater
  sudo apt install network-manager -y                      # nmtui(Network Manager)
  sudo apt install g++ -y                                  # GNU C++ Compiler
  sudo apt install exuberant-ctags -y                      # ctag
  sudo apt install python3-dev python3-pip python3-venv -y # python
  sudo apt install software-properties-common -y           # PPA Support
  sudo apt install build-essential -y                      # build-essential

  # Fin
  sudo apt update
  sudo apt upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean -y

  exit 0

fi

if [ -x "$(command -v pacman)" ]; then
  # pacman exception handling package (pacman 예외 처리 패키지)
  yay -S --noconfirm mcomix # Comic book viewer x
  # sudo pacman -S --noconfirm xorg           # xorg
  sudo pacman -S --noconfirm volumeicon     # Lightweight volume control
  sudo pacman -S --noconfirm unarchiver     # unzip alternater
  sudo pacman -S --noconfirm networkmanager # nmtui(Network Manager)
  sudo pacman -S --noconfirm ctags          # ctag
  sudo pacman -S --noconfirm python-pip     # python
  sudo pacman -S --noconfirm lazygit        # lazygit
  cargo install git-graph                   # git-graph
  sudo systemctl enable ly.service
  sudo systemctl start ly.service

  exit 0
fi

echo -e "\n\n\n\n\nPort and firewall settings\n\n\n\n\n"
sleep 5

# Open 22 port
sudo ufw enable
sudo ufw allow 22/tcp

# KDE Connect ufw setting
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw reload

# KDE Connect ufw firewall
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --reload

# Exit the script
exit 0
