# -------------------------------- #
# ------->  ZSH Config's  <------- #
# -------------------------------- #

# ZSH direcotory
export ZSH=$HOME/.oh-my-zsh

# zsh_theme
ZSH_THEME="robbyrussell"
plugins=(git)

# zsh_history
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=1000

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

# ------------------------------- #
# --------->  Exports  <--------- #
# ------------------------------- #

# Basic environment settings
export USER="user"
export HOSTNAME="termux"
export SHELL="zsh"
export EDITOR="nano"
export VISUAL="nano"

# Customize pfetch information display
export PF_INFO="ascii title os host pkgs shell memory editor"

# Add local bin directories to PATH
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# --------------------------------- #
# ---------->  Scripts <----------- #
# --------------------------------- #

# ex = EXtractor for all kinds of archives
ex () {
  if [ -f "$1" ]; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.deb)       ar x "$1"      ;;
      *.tar.xz)    tar xf "$1"    ;;
      *.tar.zst)   tar xf "$1"    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# -------------------------------- #
# --------->  aliases  <---------- #
# -------------------------------- #

# YouTube-dl aliases for audio and video downloads
alias yta-aac="yt-dlp --extract-audio --audio-format aac"
alias yta-best="yt-dlp --extract-audio --audio-format best"
alias yta-flac="yt-dlp --extract-audio --audio-format flac"
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3"
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"
