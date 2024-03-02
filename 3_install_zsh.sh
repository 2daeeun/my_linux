# !/bin/sh

# Create default directory
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Videos

# Check if the OS is Debian or Ubuntu
if [ -x "$(command -v apt-get)" ]; then
	# Debian Update & Upgrade
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y
	sudo apt install wget curl -y

	# Install ZSH
	sudo apt-get install zsh -y

	# Install Oh-My-Zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# Change Default Shell
	sudo chsh -s /usr/bin/zsh

	# prompt and statusline utility (oh-my-zsh 폰트 깨짐 방지)
	sudo apt-get install -y fonts-powerline

	# Install Node.js
	curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
	sudo apt update
	sudo apt install nodejs -y

	# Install yarn
	curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
	echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update
	sudo apt install yarn -y

	# Nerd Fonts Install
	sudo wget -P /usr/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf
	sudo fc-cache -f -v

	# Fin
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean -y

	exit 0

fi

# Check if the OS is EndeavourOS or Arch
if [ -x "$(command -v pacman)" ]; then
	# Arch Update & Upgrade
	sudo pacman -Sy
	sudo pacman -S wget curl

	# Install ZSH
	yes | sudo pacman -S zsh

	# Install Oh-My-Zsh
	wget --no-check-certificate http://install.ohmyz.sh -O - | sh

	# Change Default Shell
	chsh -s /usr/bin/zsh

	# Install Fonts
	yes | sudo pacman -S powerline-fonts
	yes | sudo pacman -S adobe-source-han-sans-kr-fonts
	yes | sudo pacman -S adobe-source-han-serif-kr-fonts
	yes | sudo pacman -S ttf-hack-nerd

	# Instal Node.js and yarn
	yes | sudo pacman -S nodejs
	yes | sudo pacman -S yarn
	yes | sudo pacman -S npm

	exit 0
fi

# ┌─────Install ZSH Plugins─────┐
# │ * Powerlevel10k 설치        │
# │ * zsh 구문 강조 플러그인    │
# │ * zsh 자동 제안 플러그인    │
# └─────────────────────────────┘
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Exit the script
exit 0
