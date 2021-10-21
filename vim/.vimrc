set pastetoggle=<F3>

" generic vim setup
" show line number
set number 
" set tab to r24 space indent
set shiftwidth=2
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
" 0.1 seconds instead of default 4 seconds (for git gutter)
set updatetime=100


" vim-plug setup
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " colour scheme
  Plug 'lifepillar/vim-solarized8'
  " file explorer in vim
  Plug 'preservim/nerdtree'
  " paraentheses highlighting
  Plug 'frazrepo/vim-rainbow'
  " git highlighting
  Plug 'airblade/vim-gitgutter'
call plug#end()

" colour scheme settings
set background=dark
colorscheme solarized8
