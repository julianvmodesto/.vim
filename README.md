# .vim

My vim dot files.

## Prerequisites
- neovim
- tmux

## Install

```
cd ~
git clone --recursive https://github.com/julianvmodesto/.vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
ln -sf ~/.vim ~/.config/nvim
ln -sf ~/.vim/vimrc ~/.config/nvim/init.vim
```

## Post-Install

```
vim -c "PlugInstall" -c "qa" # Install plugins with vim-plug
```

Configure tmux.
https://github.com/christoomey/vim-tmux-navigator#tmux

Fix neovim + <C-h>
https://github.com/neovim/neovim/issues/2048#issuecomment-78045837

## Uninstall

```
rm -rf ~/.config/nvim ~/.vim ~/.vimrc
```

