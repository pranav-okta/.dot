# some useful options
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

setopt appendhistory

# load zsh functions
source "$ZDOTDIR/.zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'yazi^M'
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down

# pnpm
export PNPM_HOME="/Users/pranav.rathinakumar/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# asdf
. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# starship prompt
eval "$(starship init zsh)"

# zoxide directory jumping
eval "$(zoxide init zsh)"

GPG_TTY=$(tty)
export GPG_TTY

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# eza instead of ls
alias ls='eza --color=always --grid --icons --group-directories-first'
alias la='eza -a --color=always --grid --icons --group-directories-first'
alias ll='eza -l --header --color=always --grid --icons --group-directories-first'
alias lla='eza -la --header --color=always --grid --icons --group-directories-first'

# bat instead of cat
alias cat='bat'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# to show unicode characters in tmux sessions
alias tmux='tmux -u'

# easier to read disk
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

alias g="git"
alias m="git checkout master"
alias mm="git checkout main"

# use neovim instead of vim
alias vim="nvim"

alias lg="lazygit"

# LazyVim
alias lvim="NVIM_APPNAME=LazyVim nvim"

# use zoxide for directory jumping
alias cd="z"

alias ff="fastfetch"

ARTIFACTORY_TOKEN() {
	ocm handler artifactory
}

npm() {
	export NPM_TOKEN="$(ARTIFACTORY_TOKEN)"
	command npm "$@"
}
pnpm() {
	export NPM_TOKEN="$(ARTIFACTORY_TOKEN)"
	command pnpm "$@"
}

# bun completions
[ -s "/Users/pranav.rathinakumar/.bun/_bun" ] && source "/Users/pranav.rathinakumar/.bun/_bun"
