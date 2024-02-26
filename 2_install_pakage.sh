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

exit 0

# install packages





Basic_Package sudo wget git
i3_Window_Manager i3-wm i3status
Sound_Packages pulseaudio pavucontrol alsa-utils
# pulseaudio  : Sound server program
# pavucontrol : Volume Control
# alsa-utils  : The Advanced Linux Sound Architecture (ALSA)
Brightness brightnessctl
# brightnessctl :Control device brightness

# ----- Utility -----
printf "unzip "               # unzip
printf "neofetch "            # Show system information
printf "terminator "          # Terminator
printf "htop "                # Task manager
printf "tlp tlp-rdw "         # Saving laptop battery power
printf "neovim "              # NeoVim
printf "xdotool "             # command-line X11 automation tool
printf "arandr "              # arandr
printf "lxrandr "             # lxrandr
printf "autorandr "           # auto arandr
printf "xclip "               # provides an interface to the clipboard
printf "rofi "                # Application dmenu
printf "lightdm "             # Lock Screen
printf "xfce4-power-manager " # xfce power manager
printf "xfce4-screensaver "   # xfce screenaver
printf "gpick "               # Color Picker
printf "numlockx "            # Control the state of NumLock
printf "vlc "                 # Video Player
printf "ranger "              # ranger
# printf "xpad "                # Sticky note application
printf "kolourpaint " # Paint
printf "mcomix "      # Comic book viewer
printf "feh "         # Image viewer
printf "peek "        # Simple GIF screen recorder
printf "gedit "       # Text editor
# printf "leafpad "             # Text editor
# printf "xfce4-screenshooter " # screenshooter
# printf "scrot "               # screenshooter
printf "gnome-screenshot " # screenshooter
printf "mate-calc "        # Mate calculator
# printf "apcalc "              # CLI calculator
printf "libreoffice-still " # Free office application
printf "okular "            # PDF viewer
printf "aria2 "             # Command-line download utility
printf "cheese "            # Camera
printf "parcellite "        # Clipboard tool (Shortcut : Ctrl+Alt+H)
printf "barrier "           # KVM software
printf "trash-cli "         # trash-cli
printf "xtrlock "           # Lock display and mouse

# ----- Man -----
printf "tldr " # man alternater
# printf "man-db "              # The online manual database.
# printf "manpages-dev "        # Manual pages about using GNU/Linux for development
# printf "glibc-doc "           # GNU C Library: Documentation
printf "ncdu " # du alternater, NCurses Disk Usage

# ----- Hangul_input -----
printf "ibus ibus-hangul fonts-nanum " # ibus
# printf "fcitx-lib* fcitx-hangul fonts-nanum "     	# fcitx

# ----- Developer_Utility -----
printf "openjdk-17-jdk "          # JDK 17
printf "build-essential gcc g++ " # C/C++ 컴파일러 & 기본 라이브러리
printf "make cmake "              # C/C++ 컴파일러 & 기본 라이브러리
printf "ccls "                    # C/C++/Objective-C 언어 서버
printf "cscope "                  # cscope
printf "clang "                   # clang
printf "gdb "                     # 디버거
printf "virtualbox "              # Virtual machine
printf "rsync "                   # one way
printf "unison "                  # both way
printf "openssh "                 # ssh
printf "ufw "                     # ufw

exit 0
































	# ----- Install Packages -----
	sudo apt install xorg -y
	# Lightweight volume control (compatible with ALSA)
	sudo apt install volumeicon-alsa -y
	# unzip alternater
	sudo apt install unar -y
	#nmtui(Network Manager)
	sudo apt install network-manager -y
	# ctag
	sudo apt install exuberant-ctags
	# python
	sudo apt install python3-dev python3-pip python3-venv -y
	# PPA Support
	sudo apt install software-properties-common -y
	# build-essential
	sudo apt install build-essential -y

	for x in $(./package_list.sh); do sudo apt install -y $x; done

	# Fin
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y

elif [[ $prompt == "A" || $prompt == "a" ]]; then

	# ----- Install Packages -----
	sudo pacman -S xorg
	# Lightweight volume control (compatible with ALSA)
	yes | sudo pacman -S volumeicon
	# unzip alternater
	yes | sudo pacman -S unarchiver
	# nmtui(Network Manager)
	yes | sudo pacman -S networkmanager
	# ctag
	yes | sudo pacman -S ctags
	# python
	yes | sudo pacman -S python-pip

	for x in $(./package_list.sh); do sudo pacman -S --noconfirm $x; done

else
	echo "other"
fi

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
