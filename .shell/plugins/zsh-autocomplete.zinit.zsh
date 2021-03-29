# async autocomplete
zinit light "marlonrichert/zsh-autocomplete"
# zstyle ':autocomplete:list-choices:*' min-input 3
# zstyle ':autocomplete:*' max-lines 100%
zstyle ':autocomplete:*' max-lines 5

zstyle ':autocomplete:space:*' magic none
# zstyle ':autocomplete:*' recent-dirs off
zstyle ':autocomplete:*' key-binding off
# zstyle ':autocomplete:*' config off


# fzf, widget-style menu-complete, widget-style menu-select
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style fzf
zstyle ':autocomplete:tab:*'fzf yes

zstyle ':autocomplete:*:no-matches-yet' message '      %F{#446666}...'
zstyle ':autocomplete:*:too-many-matches' message '     %F{#446666}...<tab>'
zstyle ':autocomplete:*:no-matches-at-all' message '      %F{#446666}...'

