dir=${0:a:h}

export ZSH_LOADER="zplug" # zinit, antigen

source "${dir}/plugins/.init-plugins.zsh"

source "${dir}/plugins/alias-tips.zsh"
source "${dir}/plugins/anyframe.zsh"
source "${dir}/plugins/asdf.zsh"
source "${dir}/plugins/auto-ls.zsh"
source "${dir}/plugins/dotbare.zsh"
source "${dir}/plugins/enhancd.zsh"
source "${dir}/plugins/fast-syntax-highlighting.zsh"
source "${dir}/plugins/zsh-auto-notify.zsh"
source "${dir}/plugins/zsh-autocomplete.zsh"
source "${dir}/plugins/zsh-autoenv.zsh"
source "${dir}/plugins/zsh-better-npm-completion.zsh"
source "${dir}/plugins/zsh-completions.zsh"
source "${dir}/plugins/zsh-fzy.zsh"
# source "${dir}/plugins/zsh-autosuggestions.zsh"
source "${dir}/plugins/zsh-histdb.zsh"
# source "${dir}/plugins/zsh-syntax-highlighting.zsh"
source "${dir}/plugins/zsh-titles.zsh"
source "${dir}/plugins/zsh-vim-mode.zsh"

# zplug RobSis/zsh-completion-generator
# zplug RobSis/zsh-reentry-hook
#
# zinit light xPMo/zsh-toggle-command-prefix
# zinit light hlissner/zsh-autopair
# zinit light zsh-users/zsh-history-substring-search
# zinit light michaelxmcbride/zsh-dircycle
# zinit light leonjza/history-here
# zinit light hkbakke/bash-insulter
#
# programs
# zinit light Aloxaf/fzf-tab
# zinit light leophys/zsh-plugin-fzf-finder
# zinit light LuRsT/hr
# zinit light wfxr/emoji-cli
# zinit light wfxr/forgit
# zinit light ytet5uy4/fzf-widgets
# zinit light PhrozenByte/rmtrash
# zinit light Seirdy/stpv
# zinit light TheLocehiliosan/yadm
# zinit light ZoeFiri/fz
# zinit light alexgisby/imgur-album-downloader
# zinit light charmbracelet/glow
# zinit light denisidoro/navi
# zinit light dylanaraps/neofetch
# zinit light dylanaraps/pash
# zinit light eth-p/bat-extras
# zinit light exiftool/exiftool
# zinit light greymd/tmux-xpanes
# zinit light jesseduffield/lazydocker
# zinit light jesseduffield/lazygit
# zinit light lukechilds/zsh-nvm
# zinit light mvdan/xurls
# zinit light paulirish/git-open
# zinit light petervanderdoes/git-flow-completion
# zinit light ranger/ranger
# zinit light th3lusive/chrome-extension-dl
# zinit light tj/git-extras
# zinit light tree-sitter/tree-sitter

source "${dir}/plugins/oh-my-zsh.zsh"
source "${dir}/plugins/.completions.zsh"
source "${dir}/plugins/.theme.zsh"
# source "${dir}/plugins/.programs.zsh"

if [[ "$ZSH_LOADER" == "zplug" ]]; then
  if ! zplug check --verbose; then
    zplug install
  fi
  zplug load --verbose
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  echo "zinit"
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi
