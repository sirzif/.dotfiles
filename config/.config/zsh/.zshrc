setopt extendedglob
setopt prompt_subst
# setopt correct
unsetopt beep

# History
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b) '
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

PROMPT='%F{cyan}%2~ %F{yellow}${vcs_info_msg_0_}%{$reset_color%}%(!.#.%%) '

source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/binds.zsh"

source <(fzf --zsh)
