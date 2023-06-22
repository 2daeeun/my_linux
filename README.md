### 삭제 해야 할 패키지
* Celluloid
* Hypnotix
* Pix
* Drawing
* Onboard
* Rhythmbox
* Hexchat
* Hypnotix
* Thunderbird
* Firefox
* epiphany-browser
```swift
sudo apt-get --purge remove celluloid hypnotix pix* drawing onboard* rhythmbox* hexchat* hypnotix* thunderbird* firefox* epiphany-browser
```
```swift
sudo rm -Rf /etc/firefox/ /usr/lib/firefox* /usr/lib/firefox-addons/ /home/leedaeeun/.mozilla
```

***
### 그놈 터미널 삭제
```swift
sudo apt-get --purge remove gnome-terminal gnome-terminal-data
```

***
### 수동으로 설정해야 할 패키지
* Numlock 활성화(설치 후 Login Window -> Settings에서 Activate numlock 선택하기)
* Virtualbox (의존성 문제 있으면 [이곳](https://www.virtualbox.org/wiki/Linux_Downloads)에서 직접 다운 받기)

***
### 단축키 설정
(설정 > 키보드 > 단축키)를 들어간다.
* 루킹글래스 단축키 바꾸기 (분류 > 일반 > 문제 해결하기 > 루킹글래스 표시)에서 (Super+L > Alt+Super+L)로 설정한다.  
* 창 최소화 단축키는 (분류 > 창 > 창 최소화)에서 (Super+M)로 설정한다.
* 창 최대화 단축키는 (분류 > 창 > 창 최대화 토글)에서 (Ctrl+Alt+J)로 추가 설정한다.
* 창 닫기 단축키는 (Categories>Windows>Close windows)에서 (Super+X)로 추가 설정한다.
* 웹 브라우저 단축키는 (Categories>Launchers>Launch web browser)에서 (Super+E)로 설정한다.
* 홈 폴더 단축키는 (Categories>Launchers>Home folder)에서 (Super + F)로 설정한다,
* 터미네이터 단축키는 우선 (설정 >기본 애플리케이션)으로 가서 기본 애플리케이션 터미널을 터미네이터로 선택한다.
그 후 (설정 > 키보드 > 단축키)에서 (분류 > 런처 > 터미널 실행)에서 (Ctrl+Alt+T > Super+T)로 설정한다.  
* 다운로드 폴더 열기 단축키는 (Categories>Launchers>Custom Shortcuts)에서 (Add custom shortcut)를 누른 뒤 Name 은 "다운로드 폴더 열기"로 Command는 "nemo Downloads"로 하고 단축키는 (Super+L)로 설정한다.
* 동영상 폴더 열기 단축키는 (Categories>Launchers>Custom Shortcuts)에서 (Add custom shortcut)를 누른 뒤 Name 은 "동영상 폴더 열기"로 Command는 "nemo Videos"로 하고 단축키는 (Super+V)로 설정한다.
* 사진 폴더 열기 단축키는 우선 (Categories>Launchers>System>Hardware)에서 (디스플레이장치 다시 감지)의 단축키 설정값을 (Shift+Ctrl+Alt+*)로 재설정 한 뒤에, (Categories>Launchers>Custom Shortcuts)에서 (Add custom shortcut)를 누른 뒤 Name 은 "사진 폴더 열기"로 Command는 "nemo Pictures"로 하고 단축키는 (Super+P)로 설정한다.
* 문서 폴더 열기 단축키는 우선 (Categories>Launchers>System>Hardware)에서 (방향고정)의 단축키 설정값을 (Shift+Ctrl+Alt+O)로 재설정 한 뒤에, (Categories>Launchers>Custom Shortcuts)에서 (Add custom shortcut)를 누른 뒤 Name 은 "문서 폴더 열기"로 Command는 "nemo Documents"로 하고 단축키는 (Super+O)로 설정한다.
* 소리 설정 열기 단축키는 우선 (Categories>일반)에서 (데스크릿 보기)의 단축키 설정값을 (Shift+Ctrl+Alt+&)로 재설정 한 뒤에,
(Categories>Launchers>Custom Shortcuts)에서 (Add custom shortcut)를 누른 뒤 Name 은 "소리 설정 열기 단축키"로 Command는 "cinnamon-settings sound"로 하고 단축키는 (Super+S)로 설정한다.
* 버추얼박스에서 윈도우7(카카오톡) 가상머신 켜는 단축키는 (Categories>Launchers>Custom Shortcuts)에서 (Add custom shortcut)를 누른 뒤 Name 은 "VirtualBox_Win7(KakaoTalk)"로 Command는 "VBoxManage startvm KakaoTalk"로 하고 단축키는 (Super+F7)로 설정한다.
* 버추얼박스에서 윈도우10 가상머신 켜는 단축키는 (Categories>Launchers>Custom Shortcuts)에서 (Add custom shortcut)를 누른 뒤 Name 은 "VirtualBox_Win10"로 Command는 "VBoxManage startvm Win10"로 하고 단축키는 (Super+F10)로 설정한다.

***
### 애플릿에서 설정 해야 할 것
* CPU Temperature Indicator
* System Monitor
* Weather (설정값은 Weather.json 수정하기)
***
