# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nano;

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         git-extras
         extract
         copypath
         copyfile
         dirhistory
         archlinux
         vi-mode
         timer
         sudo
         z
         zsh-syntax-highlighting
         zsh-autosuggestions
         zsh-completions
         zsh-autocomplete
         zsh-history-substring-search
         fzf-zsh-plugin)

source $ZSH/oh-my-zsh.sh

export LESSOPEN='| lessfilter-fzf %s'

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

## Aliases ##

alias zshconfig='nano ~/.zshrc'
alias ohmyzsh='nano ~/.oh-my-zsh'
alias grubup='sudo update-grub'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias ip='ip -color a'

## XBPS ##

alias search='xbps-query -Rs'
alias info='xbps-query -RS'
alias add='sudo xbps-install -S'
alias update='sudo xbps-install -Su'
alias clean='sudo xbps-remove -O'
alias del='sudo xbps-remove -R'
alias reconf='sudo xbps-reconfigure -f'
alias ra='sudo xbps-reconfigure -fa'
alias installed='xbps-query -m'
alias list-held='xbps-query -H'
alias hold='sudo xbps-pkgdb -m hold'
alias unhold='sudo xbps-pkgdb -m unhold'
alias rc='sudo rm /var/cache/xbps/*'
alias orphans='xbps-query --list-orphans'
alias ro='sudo xbps-remove --remove-orphans'

## Services ##

alias services='sudo sv status /var/service/*'
alias status='sudo sv status'
alias start='sudo sv start'
alias stop='sudo sv stop'
alias restart='sudo sv restart'

## Filesystem ##

alias themes='cd /usr/share/themes'
alias hthemes='cd $HOME/.themes'
alias lsthemes='cd $HOME/.local/share/themes'
alias fonts='cd /usr/share/fonts'
alias hfonts='cd $HOME/.fonts'
alias lsfonts='cd $HOME/.local/share/fonts'
alias icons='cd /usr/share/icons'
alias hicons='cd $HOME/.icons'
alias lsicons='cd $HOME/.local/share/icons'
alias co='cd ~/.config'
alias lo='cd ~/.local'
alias los='cd ~/.local/share'
alias coz='cd ~/.config/zsh'
alias home='cd $HOME'

## ls ##

alias ls='eza -a --icons --group-directories-first --git'
alias ll='ls -lh --git'
alias la='ll -g --octal-permissions'
alias df='df -kh'
alias c='clear'

## Fast upwards navigation ##

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias fgrep='ugrep -F --color=auto'
alias egrep='ugrep -E --color=auto'
alias hw='hwinfo --short'

## Safe operations with files ##

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

## Shorthands ##

alias top='topgrade'
alias q='exit'
alias rl='exec $SHELL -l'
alias mkdir='mkdir -pv'
alias root='sudo su -'
alias ports='netstat -tulanp'
alias h='history | fzf'

## Bat ##

alias batlt='bat --list-themes'
alias batcb='bat cache --build'

## Git ##

alias clone='git clone --depth 1 --recurse-submodules'

## Fonts ##

alias ft='fc-cache -f -v'
alias sf='fc-list : family spacing | grep -i'
