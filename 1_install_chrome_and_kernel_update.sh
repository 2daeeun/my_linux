# !/bin/sh

# Create default directory
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Videos

# Check if the OS is Debian or Ubuntu
if [ -x "$(command -v apt-get)" ]; then
  # apt update && apt upgrade
  echo -e "\n\n\n\n\napt update && apt upgrade\n\n\n\n\n"
  sleep 5
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y
	sudo apt install wget -y

	# Install Chrome
  echo -e "\n\n\n\n\nInstall Chrome\n\n\n\n\n"
  sleep 5
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt install python3-apt -y
	sudo apt install ./google-chrome-stable_current_amd64.deb -y
	sudo rm -rf google-chrome-stable_current_amd64.deb

	exit 0

fi

# Check if the OS is EndeavourOS or Arch
if [ -x "$(command -v pacman)" ]; then
	# Install LTS kernel
  echo -e "\n\n\n\n\nInstall LTS kernel\n\n\n\n\n"
  sleep 5
	sudo pacman -Sy
	sudo pacman -S --noconfirm git
	sudo pacman -S --noconfirm linux-lts linux-lts-headers

	# Set linux-lts as the default kernel
  echo -e "\n\n\n\n\nSet linux-lts as the default kernel\n\n\n\n\n"
  sleep 5
	sudo grub-mkconfig -o /boot/grub/grub.cfg

	# Install archlinux-keyring
  echo -e "\n\n\n\n\nInstall archlinux-keyring\n\n\n\n\n"
  sleep 5
	sudo pacman -S --noconfirm archlinux-keyring
	sudo pacman -Syu --noconfirm

	# Check if yay is installed
  if ! command -v yay &>/dev/null; then
		# Install yay
    echo -e "\n\n\n\n\nInstall yay\n\n\n\n\n"
    sleep 5
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
		cd ..
		rm -rf yay
	fi

	# Install Chrome
  echo -e "\n\n\n\n\nInstall Chrome\n\n\n\n\n"
  sleep 5
	yay -S --noconfirm google-chrome

	exit 0
fi

# Exit the script
exit 0
