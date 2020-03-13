# Add some colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -laF'

# force tmux to use unicode and 256 color
alias tmux='tmux -2u'

# hide all of the entries added by Snap
alias df='df -x squashfs'

# Typos!
alias gti='git'
alias gt='git'
alias gi='git'

if [ -x "$(command -v rg)" ]; then
	alias grep='rg --color=auto'
fi

if [ -x "$(command -v nvim)" ]; then
	alias vim='nvim'
fi

if [ -x "$(command -v bat)" ]; then
  alias cat=bat
fi

alias open='xdg-open'

function psswap {
	for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file; done | sort -k 2 -n -r
}
