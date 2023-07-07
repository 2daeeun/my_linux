# My Arch Linux Setting
This is my personal Linux setting.

## Arch Linux Installer
|카테고리|GUI|
|:---:|:---:|
|Welcome|American English|
|Location|The numbers and dates locale : ko_KR.UTF-8|
|Keyboard|English(US) - Default|
|Partitions(Swap)|Swap with Hibernate|


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

이후에는 재부팅
