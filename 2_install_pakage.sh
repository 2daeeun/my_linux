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
	for x in $(./package_list.sh); do sudo apt install -y $x; done

	# Fin
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y

elif [[ $prompt == "A" || $prompt == "a" ]]; then

	# ----- Install Packages -----
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
