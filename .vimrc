" Enable syntax highlighting
syntax on

" Enable line numbers
set number

" Don't wrap lines
set nowrap

" Keep 5 lines above/below when vertical scrolling
set scrolloff=5

" Keep 5 cols left/right when horizontal scolling
set sidescrolloff=5

" Highlight matching braces
set showmatch

" Highlight search matches
set hlsearch

" Search as characters are entered
set incsearch

" Ignore case of search
set ignorecase

" Visual tab autocomplete for : command menu
set wildmenu

" Show caret coordinates on status bar
set ruler

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" Allow backspace at start of line
set backspace=2

" Fix insert mode?
set nocompatible

" 2 spaces for tabs
set smarttab
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Plugins with vim-plug
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

" Hide view split bar
set fillchars-=vert:\|
highlight VertSplit ctermbg=DarkGrey
highlight VertSplit ctermfg=DarkGrey
