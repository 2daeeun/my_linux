if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

#zsh 플러그인 설치
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    # zsh-wakatime
)
source $ZSH/oh-my-zsh.sh

#alias 설정
alias powerup='sudo pacman -Syu'
# alias rrm="sudo mv -t /tmp"
alias lg="lazygit"
alias vi="nvim"
alias rrm="trash-put"
alias doc="cd ~/Documents"
alias dow="cd ~/Downloads"
alias vid="cd ~/Videos"
alias gh="cd ~/Documents/github"
alias st="cd ~/Documents/study"
alias th="thunar $(pwd)"
alias my="cd ~/Documents/github/my_linux"
alias lock="xtrlock" 
alias lock60="timeout 60 xtrlock" 
# alias cal="if [ -t 1 ] ; then ncal -b ; else /usr/bin/cal ; fi"
# alias cap="scrot -s '%F_%T.png' -e 'xclip -selection clip -t image/png "$f"; mv "$f" ~/Pictures/'"
# alias cap="~/./.scrot_clipboard.sh"
alias gif="vlc --demux=avformat --loop"
alias weather_home="curl wttr.in/37.5508,126.8648"
alias weather_school="curl wttr.in/37.4868,126.8224"
alias e="exit"

#unzip 한글 깨짐 방지
export UNZIP="-O cp949"
export ZIPINFO="-O cp949"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Picked up _JAVA_OPTIONS: -Dawt.useSystemAAFontSettings=on
alias java='java "$_SILENT_JAVA_OPTIONS"'

#"Shutdown & Reboot Command Not Found" error solve
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin

# cargo 환경변수
export PATH=/home/leedaeeun/.cargo/bin:$PATH

#Display man Pages in Color
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
