# ==============================================
# fzf-tab  --  https://github.com/Aloxaf/fzf-tab
# ==============================================

# change few key bindings: tab to insert,... # 'tab:toggle+down' 'shift-tab:toggle+up'
# see: `man fzf`
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept' 'shift-tab:toggle+down' 'ctrl-a:toggle-all' 'ctrl-e:execute(vim {} >/dev/tty)'

# preview `cd` command directory contents (superseeded by lessfilter below :)
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# preview env vars
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# preview systemd units (systemctl)
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# Advanced preview (files, dirs, images,...) - requires some tools installed and `lessfilter` script
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# set list-colors to enable filename colorizing (? seems to colorize without this)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

