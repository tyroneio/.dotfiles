# ===============================
# Zinit setup
# ===============================
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}Installing Zinit plugin manager...%f"
    command mkdir -p "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ===============================
# FZF integration
# ===============================
eval "$(fzf --zsh)"

# ===============================
# Plugins via Zinit
# ===============================
autoload -Uz compinit && compinit

# Completion and FZF integration
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Autosuggestions
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Syntax highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

# Vi-mode (must be last)
# zinit light jeffreytse/zsh-vi-mode

# ===============================
# Keybindings for autosuggestions
# ===============================
bindkey -M viins '^f' autosuggest-accept
bindkey -M viins '^e' autosuggest-end-of-line
bindkey -M viins '^d' autosuggest-clear
bindkey -M emacs '^f' autosuggest-accept
bindkey -M emacs '^e' autosuggest-end-of-line
bindkey -M emacs '^d' autosuggest-clear

# ===============================
# Utilities
# ===============================
. "$HOME/.local/bin/env" 2>/dev/null
export PATH="$HOME/.cargo/bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/default"

# Zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# The Fuck
eval "$(thefuck --alias)"

alias ls='eza --icons --group-directories-first --color=always'
alias ll='eza -l --icons --group-directories-first --color=always'
alias la='eza -la --icons --group-directories-first --color=always'
alias lt='eza --tree --level=2 --icons --group-directories-first'
alias s='sesh connect $(sesh list | fzf)'
alias open='xdg-open'
alias nnvim='NVIM_APPNAME="nnvim" nvim'

# ===============================
# Starship prompt
# ===============================
eval "$(starship init zsh)"

# ===============================
# Quality of life options
# ===============================
setopt autocd
setopt histignoredups sharehistory
setopt interactivecomments
setopt nobeep

# opencode
export PATH=/home/abz/.opencode/bin:$PATH
