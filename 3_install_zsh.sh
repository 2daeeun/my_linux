# !/bin/sh

# Create default directory
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Videos

# Install ZSH Plugins Function
install_zsh_plugins() {
	echo -e "\n\n\n\n\n"
	echo -e "┌─────Install ZSH Plugins─────┐"
	echo -e "│ * Powerlevel10k 설치        │"
	echo -e "│ * zsh 구문 강조 플러그인    │"
	echo -e "│ * zsh 자동 제안 플러그인    │"
	echo -e "└─────────────────────────────┘"
	echo -e "\n\n\n\n\n"
	sleep 5
	echo -e "Powerlevel10k 설치"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
	echo -e "\n"
	echo -e "zsh 구문 강조 플러그인"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	echo -e "\n"
	echo -e "zsh 자동 제안 플러그인"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

# Install vim-plug
echo -e "\n\n\n\n\nInstall vim-plug\n\n\n\n\n"
sleep 5
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Check if the OS is Debian or Ubuntu
if [ -x "$(command -v apt-get)" ]; then
	# apt update && apt upgrade
	echo -e "\n\n\n\n\napt update && apt upgrade\n\n\n\n\n"
	sleep 5
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y
	sudo apt install wget curl -y

	# Install ZSH
	echo -e "\n\n\n\n\nInstall ZSH\n\n\n\n\n"
	sleep 5
	sudo apt-get install zsh -y

	# Install Oh-My-Zsh
	echo -e "\n\n\n\n\nInstall Oh-My-Zsh\n\n\n\n\n"
	sleep 5
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# Change Default Shell
	echo -e "\n\n\n\n\nChange Default Shell\n\n\n\n\n"
	sleep 5
	sudo chsh -s /usr/bin/zsh

	# prompt and statusline utility (oh-my-zsh 폰트 깨짐 방지)
	echo -e "\n\n\n\n\nprompt and statusline utility (oh-my-zsh 폰트 깨짐 방지)\n\n\n\n\n"
	sleep 5
	sudo apt-get install -y fonts-powerline

	# Install Node.js
	echo -e "\n\n\n\n\nInstall Node.js\n\n\n\n\n"
	sleep 5
	curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
	sudo apt update
	sudo apt install nodejs -y

	# Install yarn
	echo -e "\n\n\n\n\nInstall yarn\n\n\n\n\n"
	sleep 5
	curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
	echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update
	sudo apt install yarn -y

	# Install Nerd Fonts
	echo -e "\n\n\n\n\nInstall Nerd Fonts\n\n\n\n\n"
	sleep 5
	sudo wget -P /usr/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf
	sudo fc-cache -f -v

	# Run install_zsh_plugins Function
	install_zsh_plugins
	# Fin
	echo -e "\n\n\n\n\nFin\n\n\n\n\n"
	sleep 5
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y

	exit 0

fi

# Check if the OS is EndeavourOS or Arch
if [ -x "$(command -v pacman)" ]; then
	# Arch Update & Upgrade
	echo -e "\n\n\n\n\nArch Update & Upgrade\n\n\n\n\n"
	sleep 5
	sudo pacman -Sy
	yes | sudo pacman -S wget curl

	# Install ZSH
	echo -e "\n\n\n\n\nInstall ZSH\n\n\n\n\n"
	sleep 5
	yes | sudo pacman -S zsh

	# Install Oh-My-Zsh
	echo -e "\n\n\n\n\nInstall Oh-My-Zsh\n\n\n\n\n"
	sleep 5
	wget --no-check-certificate http://install.ohmyz.sh -O - | sh

	# Change Default Shell
	echo -e "\n\n\n\n\nChange Default Shell\n\n\n\n\n"
	sleep 5
	chsh -s /usr/bin/zsh

	# Install Fonts
	echo -e "\n\n\n\n\nInstall Fonts\n\n\n\n\n"
	sleep 5
	yes | sudo pacman -S powerline-fonts
	yes | sudo pacman -S adobe-source-han-sans-kr-fonts
	yes | sudo pacman -S adobe-source-han-serif-kr-fonts
	yes | sudo pacman -S ttf-hack-nerd

	# Instal Node.js and yarn
	echo -e "\n\n\n\n\nInstal Node.js and yarn\n\n\n\n\n"
	sleep 5
	yes | sudo pacman -S nodejs
	yes | sudo pacman -S yarn
	yes | sudo pacman -S npm

	# Run install_zsh_plugins Function
	install_zsh_plugins

	exit 0
fi

# Exit the script
exit 0
