#!/bin/bash

ignorefiles=(
  .tmux.conf.old
  .tmux.nested.conf
)

cpfiles=(
  # folders
  ".config"
  ".debugger-256"
  ".shell"
  ".vim"
  "vim-examples"
  # files
  ".babelrc.base"
  ".eslintrc.overkill"
  ".iftoprc"
  ".sqsh_readline"
  ".tern-project-all"
  ".gdbinit"
  ".minttyrc"
  ".sqsh_session"
  ".tmux.conf"
  ".vimrc"
  ".agignore"
  ".gdbinit.local"
  ".sqshrc"
  ".vimrc.functions"
  ".babelrc"
  ".debugger-256.js"
  ".gitconfig"
  ".sqsh_history"
  ".tern-project"
  ".vimrc.plugins"
);

curr_dir=$(dirname $0)
clr_white='\e[0;37m'
clr_red='\e[38;2;250;0;0m'
clr_green='\e[38;2;20;200;41m'
clr_blue='\e[38;2;30;60;181m'
reset='\e[0m'

mkdir -p ~/.vim-tmp/swap ~/.vim-tmp/backup
cp -rv "$curr_dir/dotfiles/.vim" "$HOME"
cp -rv "$curr_dir/dotfiles/.shell" "$HOME"
cp -rv "$curr_dir/dotfiles/.shell/oh-my-zsh" "$HOME/.shell/.oh-my-zsh"
cp -rv "$curr_dir/dotfiles/.shell/powerline" "$HOME/.config"
cp -rv "$curr_dir/dotfiles/.shell/powerlevel9k-next" "$HOME/.oh-my-zsh/custom/themes"

cp -v "$curr_dir/dotfiles/.shell/.zshrc.replacer" "$HOME/.zshrc"
cp -v "$curr_dir/dotfiles/.shell/.zshrc.local" "$HOME/.zshrc.local"

for newFile in "${cpfiles[@]}"; do
  srcFile="$curr_dir/dotfiles/$newFile"
  targetFile="$HOME/$newFile"

  if [ ! -e "$targetFile" ]; then
    echo -e " $clr_green added  $reset \t $srcFile => $targetFile"
    cp -rv "$srcFile" "$targetFile"
  elif [ "$targetFile" -nt "$srcFile" ]; then
    echo -e "\n\n$clr_red  ERROR:$clr_white $srcFile $clr_red is older than$clr_white $targetFile\n\n $reset"
    exit 1
  else
    echo -e "$clr_blue update $reset \t $srcFile => $targetFile"
    cp -rv "$srcFile" "$targetFile"
  fi
done

cp -v ~/.vim/bundle-post/vim-airline-themes/autoload/airline/themes/* ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/

# install powerline
# brew install python
# sudo easy_install pip
# or curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py
# pip install --user powerline-status
# brew install zsh-syntax-highlighting
