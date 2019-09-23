#!/usr/bin/env bash

set -exou pipefail

vim +GoInstallBinaries +qall
pyenv virtualenv-delete -f neovim2 || true
pyenv install 2.7.15 --skip-existing
pyenv virtualenv 2.7.15 neovim2
${HOME}/.pyenv/versions/neovim2/bin/pip2 install \
  msgpack-python==0.5.1 \
  neovim \
  pynvim
pyenv virtualenv-delete -f neovim3 || true
pyenv install 3.6.4 --skip-existing
pyenv virtualenv 3.6.4 neovim3
${HOME}/.pyenv/versions/neovim3/bin/pip3 install --upgrade
${HOME}/.pyenv/versions/neovim3/bin/pip3 uninstall msgpack-python || true
${HOME}/.pyenv/versions/neovim3/bin/pip3 install \
  msgpack-python==0.5.1 \
  neovim \
  pynvim
rbenv install 2.5.3 --skip-existing
rbenv global 2.5.3 system
gem install neovim
yarn global add neovim
