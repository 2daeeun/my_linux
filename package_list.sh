# !/bin/sh
#
# ----- Basic_Package -----
printf "sudo "
printf "wget "
printf "git "

# ----- Window_Manager -----
printf "i3-wm "
printf "i3status "

# ----- Sound_Packages -----
printf "pulseaudio "  # Sound server program
printf "pavucontrol " # Volume Control
printf "alsa-utils "  # The Advanced Linux Sound Architecture (ALSA)

# ----- Brightness -----
printf "brightnessctl " # Control device brightness

# ----- Utility -----
printf "unzip "               # unzip
printf "neofetch "            # Show system information
printf "terminator "          # Terminator
printf "htop "                # Task manager
printf "tlp tlp-rdw "         # Saving laptop battery power
printf "neovim "              # NeoVim
printf "xdotool "             # command-line X11 automation tool
printf "arandr "              # arandr GUI
printf "autorandr "           # auto arandr
printf "xclip "               # provides an interface to the clipboard
printf "rofi "                # Application dmenu
printf "lightdm "             # Lock Screen
printf "xfce4-power-manager " # xfce power manager
printf "xfce4-screensaver "   # xfce screenaver
printf "gpick "               # Color Picker
printf "numlockx "            # Control the state of NumLock
printf "vlc "                 # Video Player
printf "ranger "              # ranger
# printf "xpad "                # Sticky note application
printf "kolourpaint " # Paint
printf "mcomix "      # Comic book viewer
printf "feh "         # Image viewer
printf "peek "        # Simple GIF screen recorder
printf "gedit "       # Text editor
# printf "leafpad "             # Text editor
# printf "xfce4-screenshooter " # screenshooter
# printf "scrot "               # screenshooter
printf "gnome-screenshot " # screenshooter
printf "mate-calc "        # Mate calculator
# printf "apcalc "              # CLI calculator
printf "libreoffice-still " # Free office application
printf "okular "            # PDF viewer
printf "aria2 "             # Command-line download utility
printf "cheese "            # Camera
printf "parcellite "        # Clipboard tool (Shortcut : Ctrl+Alt+H)
printf "barrier "           # KVM software
printf "trash-cli "         # trash-cli
printf "xtrlock "           # Lock display and mouse

# ----- Man -----
printf "tldr " # man alternater
# printf "man-db "              # The online manual database.
# printf "manpages-dev "        # Manual pages about using GNU/Linux for development
# printf "glibc-doc "           # GNU C Library: Documentation
printf "ncdu " # du alternater, NCurses Disk Usage

# ----- Hangul_input -----
printf "ibus ibus-hangul fonts-nanum " # ibus
# printf "fcitx-lib* fcitx-hangul fonts-nanum "     	# fcitx

# ----- Developer_Utility -----
printf "openjdk-17-jdk "          # JDK 17
printf "build-essential gcc g++ " # C/C++ 컴파일러 & 기본 라이브러리
printf "make cmake "              # C/C++ 컴파일러 & 기본 라이브러리
printf "ccls "                    # C/C++/Objective-C 언어 서버
printf "cscope "                  # cscope
printf "clang "                   # clang
printf "gdb "                     # 디버거
printf "virtualbox "              # Virtual machine
printf "rsync "                   # one way
printf "unison "                  # both way
printf "openssh "                 # ssh
printf "ufw "                     # ufw

exit 0
