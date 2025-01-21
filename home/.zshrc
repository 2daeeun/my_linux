if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

#zsh 플러그인 설치
plugins=(
  git
  fzf
  zsh-syntax-highlighting
  zsh-autosuggestions
  # zsh-wakatime
)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#alias 설정(명령어)
alias powerup='yay -Syu --ignore linux,linux-headers,linux-lts,linux-lts-headers,linux-zen,linux-zen-headers'
alias lg="lazygit"
alias gg="git-graph"
alias vi="nvim"
# alias rrm="sudo mv -t /tmp"
# alias rrm="trash-put"
rrm() {
  trash-put "$@"
}
alias th="pcmanfm $pwd"
alias lock="xtrlock"
alias lock60="timeout 60 xtrlock"
# alias cal="if [ -t 1 ] ; then ncal -b ; else /usr/bin/cal ; fi"
alias cap='grim -g "$(slurp)" - | swappy -f -'
alias gif="vlc --demux=avformat --loop"
alias weather_home="curl wttr.in/37.5508,126.8648"
alias weather_school="curl wttr.in/37.4868,126.8224"
alias cls="clear"
alias e="exit"

#alias 설정(디렉토리 이동)
alias vid="cd ~/Videos/"
alias doc="cd ~/Documents/"
alias dow="cd ~/Downloads/"
alias st="cd ~/Documents/study/"
alias gh="cd ~/Documents/github/"
alias to="cd ~/Documents/github/token/ && nvim token.sh"
alias my="cd ~/Documents/github/my_linux/"
alias ks="cd ~/Documents/github/kernel_study/"
alias ksl="cd ~/Documents/github/kernel_study/linux/"
alias al="cd ~/Documents/github/Algorithm_study/"
alias br="cd ~/Documents/github/Algorithm_study/solved.ac/Bronze/"
alias si="cd ~/Documents/github/Algorithm_study/solved.ac/Silver/"

#alias 설정(임시)
alias ro="~/rocksdb/"

#alias 설정(셸 스크립트 실행)
alias mo="~/Documents/mount_sshfs.sh"

# 임시 alias 설정
alias jsy="cd ~/Documents/github/JSY-s_TCP-IP_socket_programming/"
alias ardu="cd ~/Documents/github/Arduino_Smart_Logistics_System/ASLS_Management_Program/"

#unzip 한글 깨짐 방지
export UNZIP="-O cp949"
export ZIPINFO="-O cp949"

#"Shutdown & Reboot Command Not Found" error solve
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin

# Cargo 환경변수
export PATH="$PATH:$HOME/.cargo/bin/"

#Display man Pages in Color
man() {
    command man "$@" | bat -pl man
}
