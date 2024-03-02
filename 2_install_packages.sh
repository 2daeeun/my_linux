# !/bin/sh

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
		sudo apt-get update
		sudo apt-get install -y intel-microcode
	elif [ "$CPU_VENDOR" = "amd" ]; then
		sudo apt-get update
		sudo apt-get install -y amd64-microcode
		# AMD GPU firmware
		# sudo apt install -y firmware-amd-graphics libgl1-mesa-dri
	fi
elif [ -x "$(command -v pacman)" ]; then
	if [ "$CPU_VENDOR" = "intel" ]; then
		sudo pacman -Sy
		sudo pacman -S --noconfirm intel-ucode
	elif [ "$CPU_VENDOR" = "amd" ]; then
		sudo pacman -Sy
		sudo pacman -S --noconfirm amd-ucode
	fi
else
	echo "Unsupported OS"
	exit 1
fi

# Common packages (공통 패키지들을 변수에 저장)
Basic_Package sudo wget git
i3_Window_Manager i3-wm i3status
Sound pulseaudio pavucontrol alsa-utils
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ pulseaudio                  # Sound server program                                  │
# │ pavucontrol                 # Volume Control                                        │
# │ alsa-utils                  # The Advanced Linux Sound Architecture (ALSA)          │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Brightness brightnessctl
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ brightnessctl               # Control device brightness                             │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Editors terminator neovim gedit
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ terminator                  # Terminator                                            │
# │ neovim                      # NeoVim                                                │
# │ gedit                       # Text editor                                           │
# │ # leafpad                   # Text editor                                           │
# └─────────────────────────────────────────────────────────────────────────────────────┘
SystemInfo neofetch htop ncdu
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ neofetch                    # Show system information                               │
# │ htop                        # Task manager                                          │
# │ ncdu                        # du alternater, NCurses Disk Usage                     │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Display_Management lightdm arandr lxrandr autorandr
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ lightdm                     # Lock Screen                                           │
# │ arandr                      # arandr                                                │
# │ lxrandr                     # lxrandr                                               │
# │ autorandr                   # auto arandr                                           │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Power_Management tlp tlp-rdw xfce4-power-manager xfce4-screensaver
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ tlp tlp-rdw                 # Saving laptop battery power                           │
# │ xfce4-power-manager         # xfce power manager                                    │
# │ xfce4-screensaver           # xfce screenaver                                       │
# └─────────────────────────────────────────────────────────────────────────────────────┘
File_Management unzip trash-cli
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ unzip                       # unzip                                                 │
# │ # ranger                    # ranger                                                │
# │ trash-cli                   # trash-cli                                             │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Image_and_Video gpick kolourpaint mcomix feh peek vlc cheese gnome-screenshot
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ gpick                       # Color Picker                                          │
# │ kolourpaint                 # Paint                                                 │
# │ mcomix                      # Comic book viewer                                     │
# │ feh                         # Image viewer                                          │
# │ peek                        # Simple GIF screen recorder                            │
# │ vlc                         # Video Player                                          │
# │ cheese                      # Camera                                                │
# │ # xfce4-screenshooter       # screenshooter                                         │
# │ # scrot                     # screenshooter                                         │
# │ gnome-screenshot            # screenshooter                                         │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Office libreoffice-still okular mate-calc
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ libreoffice-still           # Free office application                               │
# │ okular                      # PDF viewer                                            │
# │ # xpad                      # Sticky note application                               │
# │ mate-calc                   # Mate calculator                                       │
# │ # apcalc                    # CLI calculator                                        │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Clipboard xdotool xclip parcellite
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ xdotool                     # command-line X11 automation tool                      │
# │ xclip                       # provides an interface to the clipboard                │
# │ parcellite                  # Clipboard tool (Shortcut : Ctrl+Alt+H)                │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Keyboard_and_Mouse numlockx xtrlock barrier
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ numlockx                    # Control the state of NumLock                          │
# │ xtrlock                     # Lock display and mouse                                │
# │ barrier                     # KVM software                                          │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Man tldr
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ tldr                        # man alternater                                        │
# │ man-db                      # The online manual database                            │
# │ manpages-dev                # Manual pages about using GNU/Linux for development    │
# │ glibc-doc                   # GNU C Library: Documentation                          │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Hangul_input ibus ibus-hangul
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ ibus ibus-hangul            # ibus                                                  │
# │ # fonts-nanum               # 나눔 한글 글꼴                                        │
# │ # fcitx-lib* fcitx-hangul   # fcitx                                                 │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Compiler gcc g++ clang
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ # gcc g++                   # GNU C/++ Compiler                                     │
# │ clang LLVM                  # LLVM C/C++ Compiler                                   │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Build make cmake
# ┌─────────────────────────────────────────────────────────────────────────────────────┐
# │ make                        # Build automation utility (Makefile)                   │
# │ cmake                       # Build automation utility (CMakeLists.txt)             │
# └─────────────────────────────────────────────────────────────────────────────────────┘
Other_Utility rofi aria2 barrier
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

		# apt exception handling package (apt 예외 처리 패키지)
		sudo apt install openjdk-17-jdk # JDK 17
		# sudo apt install xorg                                 # xorg
		sudo apt install volumeicon-alsa                      # Lightweight volume control
		sudo apt install unar                                 # unzip alternater
		sudo apt install network-manager                      # nmtui(Network Manager)
		sudo apt install exuberant-ctags                      # ctag
		sudo apt install python3-dev python3-pip python3-venv # python
		sudo apt install software-properties-common           # PPA Support
		sudo apt install build-essential                      # build-essential

		# Fin
		sudo apt update
		sudo apt upgrade -y
		sudo apt autoremove -y
		sudo apt autoclean -y

	elif [ -x "$(command -v pacman)" ]; then
		# Common packages install
		sudo pacman -S --noconfirm $1

		# pacman exception handling package (pacman 예외 처리 패키지)
		# sudo pacman -S --noconfirm xorg           # xorg
		sudo pacman -S --noconfirm volumeicon     # Lightweight volume control
		sudo pacman -S --noconfirm unarchiver     # unzip alternater
		sudo pacman -S --noconfirm networkmanager # nmtui(Network Manager)
		sudo pacman -S --noconfirm ctags          # ctag
		sudo pacman -S --noconfirm python-pip     # python

	else
		echo "Package manager not found. Exiting."
		exit 1
	fi
}

# run install_packages function (패키지 설치 함수 실행)
install_packages "$Basic_Package"
install_packages "$i3_Window_Manager"
install_packages "$Sound"
install_packages "$Brightness"
install_packages "$Editors"
install_packages "$SystemInfo"
install_packages "$Display_Management"
install_packages "$Power_Management"
install_packages "$File_Management"
install_packages "$Image_and_Video"
install_packages "$Office"
install_packages "$Clipboard"
install_packages "$Keyboard_and_Mouse"
install_packages "$Man"
install_packages "$Hangul_input"
install_packages "$Compiler"
install_packages "$Build"
install_packages "$Other_Utility"

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
