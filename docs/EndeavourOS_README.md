# My Arch Linux Setting
This is my personal Linux setting.

## EndeavourOS Installer
|카테고리|<center>선택</center>|
|:---:|---|
| Welcome | • American English |
| Location | • The numbers and dates locale : ko_KR.UTF-8 |
| Keyboard | • English(US) - Default |
| Desktop | • i3-wm |
| Packages | • Desktop-Base + Common packages </br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─(선택 안 하기) EndeavourOS Apps </br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─(선택 안 하기) EndeavourOS applications selection </br>• LTS Kernel in addition </br> • i3-Window-Manager|
| Bootloader | • Grub |
| Partitions | • Erase disk </br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└─Swap (with Hibernate) ― ext4|


## my_linux 다운로드
```swift
mkdir -p ~/Documents/github && cd ~/Documents/github && git clone https://github.com/2daeeun/my_linux.git
```

## 각종 패키지 설치
```swift
./1_install_chrome.sh
./2_install_pakage.sh
./3_install_zsh.sh
```

## 설정 파일 복사
```swift
./symbolic_link.sh
```

## 필요없는 패키지 삭제
```swift
sudo pacman -Rs gthumb xfce4-terminal
```

이후에는 재부팅
