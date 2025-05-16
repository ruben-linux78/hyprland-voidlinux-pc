# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load starship prompt if starship is installed
if [ -x /usr/bin/starship ]; then
	__main() {
		local major="${BASH_VERSINFO[0]}"
		local minor="${BASH_VERSINFO[1]}"

		if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
			source <("/usr/bin/starship" init bash --print-full-init)
		else
			source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
		fi
	}
	__main
	unset -f __main
fi

# Advanced command-not-found hook
if [[ -f /usr/share/doc/find-the-command/ftc.bash ]]; then
  source /usr/share/doc/find-the-command/ftc.bash
fi


## Useful aliases

# Replace ls with eza
if [[ -x /usr/bin/eza ]]; then
  alias ls='eza -al --color=always --group-directories-first --icons'     # preferred listing
  alias la='eza -a --color=always --group-directories-first --icons'      # all files and dirs
  alias ll='eza -l --color=always --group-directories-first --icons'      # long format
  alias lt='eza -aT --color=always --group-directories-first --icons'     # tree listing
  alias l.='eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles
fi

# Replace some more things with better alternatives
if [[ -x /usr/bin/bat ]]; then
  alias cat='bat --style header --style snip --style changes --style header'
fi

# Common use
alias grubup="sudo update-grub"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
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
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
alias ip='ip -color a'

# Help me
alias please='sudo'
alias tb='nc termbin.com 9999'
alias helpme='cht.sh --shell'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

