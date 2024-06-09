# My Arch Linux Setting
This is my personal Linux setting.

## EndeavourOS Installer
"EndeavourOS_Gemini-2024.04.20.iso" 기준으로 작성됨

|카테고리|<center>선택</center>|
|:---:|---|
| Welcome | • American English |
| Location | • The numbers and dates locale : ko_KR.UTF-8 |
| Keyboard | • English(US) - Default |
| Desktop | • i3-wm |
| Packages | • Desktop-Base + Common packages </br>• Recommended applications selection </br>• Firefox and language package </br>• Spell Checker and language package </br>• Firewall </br>• LTS Kernel in addition </br>• i3-Window-Manager|
| Bootloader | • Grub |
| Partitions | • Erase disk </br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─Swap (with Hibernate) ― ext4|


## my_linux 다운로드
```
mkdir -p ~/Documents/github && cd ~/Documents/github && git clone https://github.com/2daeeun/my_linux.git && cd my_linux
```

## 각종 패키지 설치
```
./1_install_chrome_and_kernel_update.sh
./2_install_packages.sh
./3_install_zsh.sh
./4_github_user_info.sh
```

## 설정 파일 복사
```
./symbolic_link.sh
```

## lazygit의 mason 설정
```
MasonInstall clangd clang-format cmake-language-server asm-lsp asmfmt mdformat
```

## 필요없는 패키지 삭제
```
sudo pacman -Rs nano
```

이후에는 재부팅
