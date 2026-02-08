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

zstyle :compinstall filename '/home/martis/.zshrc'

# Load plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

# Load completions
source "$ZDOTDIR/completion.zsh"

# Load prompt
source "$ZDOTDIR/prompt.zsh"

# Loading stuff
autoload -U colors && colors

# Aliases
source "$ZDOTDIR/alias.zsh"

# Keybinds
source "$ZDOTDIR/binds.zsh"
