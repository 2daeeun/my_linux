if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# zsh 플러그인 설치
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

# alias 설정(명령어)
# 시스템 업그레이드 (yay 메뉴는 전부 None, 아래 목록은 업그레이드 제외)
powerup() {
  local -a ignore=(
    linux      linux-headers
    linux-lts  linux-lts-headers
    linux-zen  linux-zen-headers
    linux-mainline
    firefox
    google-chrome
    visual-studio-code-bin
    libreoffice-still
    vlc
    discord
  )

  # 설치된 haskell-*, linux-firmware* 패키지는 전부 제외
  local skip
  skip=$(pacman -Qq | grep -E "^(haskell-|linux-firmware)")
  [[ -n $skip ]] && ignore+=(${(f)skip})

  yay -Syu --color=always \
    --answerclean   None \
    --answerdiff    None \
    --answeredit    None \
    --answerupgrade None \
    --ignore "${(j:,:)ignore}" \
    "$@" |
    grep -v "haskell-"
}

alias lg="lazygit"
alias gg="git-graph"
alias vi="nvim"
# alias rrm="sudo mv -t /tmp"
# alias rrm="trash-put"
rrm() {
  trash-put "$@"
}
alias th="pcmanfm $pwd"
alias tree="pwd && eza --tree -l --icons"
# pwd 실행 시 현재 경로를 출력하고 클립보드에도 복사
alias pwd='builtin pwd && { print -rn -- "$PWD" | wl-copy 2>/dev/null || true; }'
# alias cal="if [ -t 1 ] ; then ncal -b ; else /usr/bin/cal ; fi"
alias cap='grim -g "$(slurp)" - | swappy -f -'
alias gif="vlc --demux=avformat --loop"
alias weather_home="curl wttr.in/37.5508,126.8648"
alias weather_school="curl https://wttr.in/37.3211,127.1325"
alias cls="clear"
alias e="exit"
alias co="codex"

# alias 설정(디렉토리 이동)
alias vid="cd ~/Videos/"
alias doc="cd ~/Documents/"
alias dow="cd ~/Downloads/"
alias st="cd ~/Documents/study/"
alias gh="cd ~/Documents/github/"
# alias to="cd ~/Documents/github/token/ && nvim token.sh"
alias to="cd ~/token/ && nvim token.sh"
alias my="cd ~/Documents/github/my_linux/"
alias ks="cd ~/Documents/github/kernel_study/"
alias ksl="cd ~/Documents/github/kernel_study/linux/"
alias pa="cd ~/Documents/github/papers_collection/"
alias pau="cd ~/Documents/github/papers_collection/papers/_File\ System/_User-Space\ File\ System/"

# alias 설정(셸 스크립트 실행)
alias mo="~/Documents/mount_sshfs.sh"

# 임시 alias 파일 불러오기
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# nvim 환경변수
export EDITOR=nvim
export VISUAL=nvim

# unzip 한글 깨짐 방지
export UNZIP="-O cp949"
export ZIPINFO="-O cp949"

# "Shutdown & Reboot Command Not Found" error solve
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/sbin

# Cargo 환경변수
export PATH="$PATH:$HOME/.cargo/bin/"

# Display man Pages in Color
man() {
    command man "$@" | bat -pl man
}
export PATH="$HOME/.local/bin:$PATH"
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH

export PATH="$HOME/.local/bin:$PATH"
