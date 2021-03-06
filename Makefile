XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: install
install: ## Sets up symlink for user and root .vimrc for vim and neovim.
	ln -snf "$(HOME)/.vim/vimrc" "$(HOME)/.vimrc"
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(HOME)/.vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(HOME)/.vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"
	sudo ln -snf "$(HOME)/.vim" /root/.vim
	sudo ln -snf "$(HOME)/.vimrc" /root/.vimrc
	sudo mkdir -p /root/.config
	sudo ln -snf "$(HOME)/.vim" /root/.config/nvim
	sudo ln -snf "$(HOME)/.vimrc" /root/.config/nvim/init.vim

.PHONY: install_providers
install_providers:
	hack/fix-install-providers.sh

.PHONY: update
update: update-plug update-plugins update-providers ## Updates vim-plug and all plugins and providers.

.PHONY: update-plugins
update-plugins: ## Updates all plugins.
	vim +PlugInstall +qall
	vim +PlugUpdate +qall

.PHONY: update-plug
update-plug: ## Updates vim-plug.
	vim +PlugUpgrade +qall

.PHONY: update-providers
update-providers:
	vim +GoUpdateBinaries +qall
	${HOME}/.pyenv/versions/neovim2/bin/pip2 install --upgrade \
	  msgpack-python==0.5.1 \
	  neovim \
	  pynvim
	${HOME}/.pyenv/versions/neovim3/bin/pip3 install --upgrade \
	  msgpack-python==0.5.1 \
	  neovim \
	  pynvim
	gem update neovim
	yarn global upgrade neovim

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
