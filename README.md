# .vim

My vim dot files.

## Prerequisites
- neovim
- tmux
- Node

## Python
https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim

Install Anaconda.

```
conda update conda
conda update anaconda
conda create -n neovim2 python=2.7
conda install -n neovim2 flake8
source activate neovim2
pip install neovim
conda create -n neovim3 python=3.4
conda install -n neovim3 flake8
source activate neovim3
pip install neovim
```

Find and check `g:python_host_prog` and `g:python3_host_prog` in vimrc/init.vim

```
let g:python_host_prog = 'path/to/python'
let g:python3_host_prog = 'path/to/python'
```

## Ruby
Install RVM.

```
gem install neovim
```

## Install

```
cd ~
git clone --recursive https://github.com/julianvmodesto/.vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
mkdir -p ~/.config/nvim
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

Set git commit editor
```
git config --global core.editor "nvim"
```

## Keys
In iTerm, go to Preferences > Profiles > Keys and set the left-option key to +Esc

```
<C-key>      = Ctrl
<leader-key> = \
<M-key>      = left-option key is +Esc
```

## Uninstall

```
rm -rf ~/.config/nvim ~/.vim ~/.vimrc
```

