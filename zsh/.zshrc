# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000000
setopt extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/shashisu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Starship
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Aliaces
alias ls="eza --color=always --long --git --icons --no-time --no-user --no-permissions"
alias cat="bat"
alias k="kubectl"
alias kctl="kubectl"
alias kns="kubens"
alias kctx="kubectx"
alias py="python3"
alias python="python3"
alias gcc="gcc-14"
alias g++="g++-14"
# alias docker="podman"

# fzf
eval "$(fzf --zsh)"

# use fd instead of fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# fzf file preview
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}'"

# fzf directory preview
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# use fd for ** path completions 
_fzf_compgen_path() {
   fd --hidden --exclude .git . "$1"
}

# use fd for ** path completions 
_fzf_compgen_dir() {
   fd --type=d --hidden --exclude .git . "$1"
}

# 
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
	cd)		fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
	export|unset)	fzf --preview "eval 'echo \$' {}" "$@" ;;
	ssh)		fzf --preview 'dig {}' "$@" ;;
	*)		fzf --preview "--preview 'bat -n --color=always {}'" "$@" ;;
    esac
}

# correct commands using thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)


# zoxide
eval "$(zoxide init --cmd cd zsh)"

# tmux
# tmux attach || tmux new -s default
# clear
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/shashisu/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# AsyncAPI CLI Autocomplete

ASYNCAPI_AC_ZSH_SETUP_PATH=/Users/shashisu/Library/Caches/@asyncapi/cli/autocomplete/zsh_setup && test -f $ASYNCAPI_AC_ZSH_SETUP_PATH && source $ASYNCAPI_AC_ZSH_SETUP_PATH; # asyncapi autocomplete setup


export PATH="$HOME/.local/bin:$PATH"
