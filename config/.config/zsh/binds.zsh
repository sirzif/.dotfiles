autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -e

bindkey '^[[Z' reverse-menu-complete

_start_tmux_sessionizer() {
    tmux-sessionizer <> $TTY
    zle redisplay
}
zle -N start-tmux-sessionizer _start_tmux_sessionizer

bindkey '^f' start-tmux-sessionizer

bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

bindkey '\e[3~' delete-char
