let g:python_host_prog=$HOME."/anaconda/envs/neovim2/bin/python"
let g:python3_host_prog=$HOME."/anaconda/envs/neovim3/bin/python"

" Modularized vimrc
" https://www.gregjs.com/vim/2016/do-yourself-a-favor-and-modularize-your-vimrc-init-vim/
source $HOME/.vim/init.vimrc
source $HOME/.vim/general.vimrc
source $HOME/.vim/plugins.vimrc
source $HOME/.vim/line.vimrc
source $HOME/.vim/keys.vimrc

