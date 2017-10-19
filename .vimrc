" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
call plug#end()

" Configure plugins
let g:javascript_plugin_jsdoc = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'


" Override vim-sensible
runtime! plugin/sensible.vim
set expandtab
set smarttab
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number

