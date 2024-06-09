#!/bin/sh

# Install git
echo -e "\n\n\ngit 설치\n\n\n"

if [ -x "$(command -v apt-get)" ]; then
	sudo apt update
	sudo apt install git -y
elif [ -x "$(command -v pacman)" ]; then
	sudo pacman -Sy
	sudo pacman -S --noconfirm git
fi

echo -e "\n\n\n"
echo "깃허브 사용자 정보를 입력하세요."
echo "────────────────────────────────"
read -p "사용자 이름: " username
read -p "이메일 주소: " email

# 컬러 설정
git config --global color.ui "auto"

# git 편집 에디터 바꾸기 (nano to vim)
git config --global core.editor "nvim"

# 사용자 정보 등록
git config --global user.name "$username"
git config --global user.email "$email"

echo "깃허브 사용자 정보가 설정되었습니다."
