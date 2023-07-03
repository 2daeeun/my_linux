# !/bin/sh
# Text to ASCII ART Generator
# URL : https://patorjk.com/software/taag
# ASCII Art Font : ANSI Shadow
# ASCII More Opts(Format the output) : Echo commands

# ----- Create Directory -----
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Videos

echo "██████╗  █████╗  ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     "
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     "
echo "██████╔╝███████║██║     █████╔╝ ███████║██║  ███╗█████╗      ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     "
echo "██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══██║██║   ██║██╔══╝      ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     "
echo "██║     ██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝███████╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗"
echo "╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝"
echo "                                                                                                                   "
echo "                                                                                                                   "

read -p "Are you using an Intel CPU?(No is AMD) <Y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
	sudo apt install -y intel-microcode
else
	sudo apt install -y amd64-microcode
	# sudo apt install -y firmware-amd-graphics libgl1-mesa-dri   # AMD GPU firmware
fi

echo "Are you using Debian or Arch?"
read -p "(Debian is D, Arch is A) <D/A> " prompt
if [[ $prompt == "D" || $prompt == "d" ]]; then

	# ----- Debian Update & Upgrade -----
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y

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
