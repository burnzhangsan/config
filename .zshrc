# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(battery colored-man-pages colorize emoji git man web-search zsh_reload)

#export TERM=rxvt-256color
source $ZSH/oh-my-zsh.sh
# Customize to your needs...
#
#if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
#	exec startx
#fi
RPROMPT='$(battery_pct_prompt) ...'
ZSH_COLORIZE_TOOL=pygmentize
#ZSH_COLORIZE_STYLE="colorful"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
# Put your fun stuff here.

vultr()
{
	ssh user@ip -p port
}

X230()
{
	ssh user@ip
}

alias vultr='vultr'
alias X230='X230'

export PATH=~/.local/bin:$PATH
export TERM=xterm-256color
export OMP_NUM_THREADS=8
#export R_LIBS_USER=~/.local/lib64/R
export SCIPY_PIL_IMAGE_VIEWER=display
unsetopt BEEP

autoload -U compinit promptinit
compinit
promptinit
