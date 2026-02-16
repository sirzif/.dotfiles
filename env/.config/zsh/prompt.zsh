autoload -Uz vcs_info
precmd() {
    vcs_info

    if [[ -n "${vcs_info_msg_0_}" ]]; then
        if ! git diff-index --quiet HEAD -- 2>/dev/null; then
            _dir_status="%F{yellow} "
        elif git rev-parse @{u} >/dev/null 2>&1 && \
             (( $(git rev-list --count @{u}..HEAD 2>/dev/null || echo 0) > 0 )); then
            _dir_status="%F{magenta} "
        else
            _dir_status="%F{#767a90} "
        fi
    else
        _dir_status=""
    fi

}
zstyle ':vcs_info:git:*' formats ' %F{blue}%b'

PROMPT='%{$fg[cyan]%}%~%{$fg_bold[blue]%}%{$fg_bold[blue]%}${vcs_info_msg_0_}${_dir_status}%{$reset_color%}%(?..%F{red} ) %{$reset_color%}%(!.#.%%) '
