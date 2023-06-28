# !/bin/sh
# Text to ASCII ART Generator
# URL : https://patorjk.com/software/taag
# ASCII Art Font : ANSI Shadow
# ASCII More Opts(Format the output) : Echo commands

# ----- Create Directory -----
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Videos

echo "Are you using Debian or Arch?"
read -p "(Debian is D, Arch is A) <D/A> " prompt
if [[ $prompt == "D" || $prompt == "d" ]]; then

	# ----- Debian Update & Upgrade -----
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y
	sudo apt install wget -y

	# ----- Install Chrome -----
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt install python3-apt -y
	sudo apt install ./google-chrome-stable_current_amd64.deb -y
	sudo rm -rf google-chrome-stable_current_amd64

	# Fin
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y

elif [[ $prompt == "A" || $prompt == "a" ]]; then

	# ----- Arch Update & Upgrade -----
	yes | sudo pacman -Sy
	yes | sudo pacman -S linux-lts linux-lts-headers
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	yes | sudo pacman -S archlinux-keyring
	sudo pacman -Syu

	# ----- Install Chrome -----
	yes | sudo pacman -Sy --needed base-devel git
	git clone https://aur.archlinux.org/google-chrome.git
	cd google-chrome
	makepkg -is


else
	echo "other"
fi

# Exit the script
exit 0
