autoload -Uz vcs_info

zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' %F{blue}%b%f%c'

zstyle ':vcs_info:git:*' actionformats ' %F{red}%b|%a%f'

zstyle ':vcs_info:git:*' unstagedstr '%F{yellow}*%f'
zstyle ':vcs_info:git:*' stagedstr '%F{magenta}*%f'

precmd() { vcs_info }

PROMPT='%F{cyan}%~%f${vcs_info_msg_0_} %(!.#.%%) '
