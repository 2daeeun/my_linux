# !/bin/sh
# Text to ASCII ART Generator
# URL : https://patorjk.com/software/taag
# ASCII Art Font : ANSI Shadow
# ASCII More Opts(Format the output) : Echo commands

echo "███████╗███████╗██╗  ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     "
echo "╚══███╔╝██╔════╝██║  ██║    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     "
echo "  ███╔╝ ███████╗███████║    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     "
echo " ███╔╝  ╚════██║██╔══██║    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     "
echo "███████╗███████║██║  ██║    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗"
echo "╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝"
echo "                                                                                  "
echo "                                                                                  "

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
	sudo apt install curl -y

	# ----- Install ZSH -----
	sudo apt-get install zsh -y
	# ----- Install Oh-My-Zsh -----
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	# ----- Change Default Shell -----
	sudo chsh -s /usr/bin/zsh

	# oh-my-zsh 폰트 깨짐 방지
	sudo apt-get install -y fonts-powerline

	# Node.Js 최신 버전 설치
	curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
	sudo apt update
	sudo apt install nodejs -y

	# yarn 최신 버전 설치
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

elif [[ $prompt == "A" || $prompt == "a" ]]; then

	# ----- Arch Update & Upgrade -----
	yes | sudo pacman -Sy
	yes | sudo pacman -S archlinux-keyring
	yes | sudo pacman -Syu
	yes | sudo pacman -S wget
	yes | sudo pacman -S curl

	# ----- zsh 설치 -----
	yes | sudo pacman -S zsh
	# ----- oh-my-zsh 설치 -----
	wget --no-check-certificate http://install.ohmyz.sh -O - | sh
	# ----- zsh를 기본 쉘로 설정 -----
	chsh -s /usr/bin/zsh

	# ----- Install Fonts -----
	yes | sudo pacman -S powerline-fonts
	yes | sudo pacman -S adobe-source-han-sans-kr-fonts
	yes | sudo pacman -S adobe-source-han-serif-kr-fonts
	yes | sudo pacman -S ttf-hack-nerd

	# ----- NeoVim 플러그인 사용을 위한 것 -----
	yes | sudo pacman -S nodejs
	yes | sudo pacman -S yarn
	yes | sudo pacman -S npm

	# Fin
	yes | sudo pacman -Syu

else
	echo "other"
fi

# ------- Install ZSH -------
# | Powerlevel10k 설치       |
# | zsh 구문 강조 플러그인   |
# | zsh 자동 제안 플러그인   |
# ----------------------------
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ----- vim-plug -----
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Exit the script
exit 0
