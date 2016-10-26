# .vim

My vim dot files.

## Prerequisites
- neovim
- tmux
- Python

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

Find and check `g:python_host_prog` and `g:python3_host_prog` in general.vimrc

```
let py2="path/to/python"
if filereadable(py2)
  let g:python_host_prog = py2
endif
let py3="path/to/python"
if filereadable(py3)
  let g:python3_host_prog = py3
endif
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

## Uninstall

```
rm -rf ~/.config/nvim ~/.vim ~/.vimrc
```

