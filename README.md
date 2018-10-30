# .vim

My vim dot files.

## Neovim

### Python

```
pyenv install 2.7.14
pyenv virtualenv 2.7.14 neovim2
pyenv activate neovim2
pip install neovim

pyenv install 3.6.6
pyenv virtualenv 3.6.4 neovim3
pyenv activate neovim3
pip install neovim

pyenv global 3.6.4 2.7.14 system neovim3 neovim2
```

### Ruby

```
gem install neovim
```

## Install

```
cd "$HOME"
git clone --recursive https://github.com/julianvmodesto/.vim.git "${HOME}/.vim"
ln -snf "${HOME}/.vim/vimrc" "${HOME}/.vimrc"

# alias vim dotfiles to neovim
mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
ln -snf "${HOME}/.vim" "${XDG_CONFIG_HOME}/nvim"
ln -snf "${HOME}/.vimrc" "${XDG_CONFIG_HOME}/nvim/init.vim"
```

## Post-Install

```
vim -c "CheckHealth"
vim -c "PlugInstall" -c "qa" # Install plugins with vim-plug
```

