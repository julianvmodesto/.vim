if isdirectory($HOME."/.pyenv")
  let g:python_host_prog=$HOME."/.pyenv/versions/neovim2/bin/python"
  let g:python3_host_prog=$HOME."/.pyenv/versions/neovim3/bin/python"
endif

if isdirectory($HOME."/.rbenv/versions/2.4.2/")
  let g:ruby_host_prog=$HOME.'/.rbenv/versions/2.4.2/bin/neovim-ruby-host'
endif

" Modularized vimrc
" https://www.gregjs.com/vim/2016/do-yourself-a-favor-and-modularize-your-vimrc-init-vim/
source $HOME/.vim/init.vimrc
source $HOME/.vim/general.vimrc
source $HOME/.vim/plugins.vimrc
source $HOME/.vim/line.vimrc
source $HOME/.vim/keys.vimrc

