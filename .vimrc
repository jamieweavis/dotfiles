set undofile
set undodir=~/.vim/undo
set undolevels=5000
set number " Enable line numbers
set nowrap " Don't wrap lines
set scrolloff=5 " Keep 5 lines above/below when vertical scrolling
set sidescrolloff=5 " Keep 5 cols left/right when horizontal scolling
set showmatch " Highlight matching braces
set hlsearch " Highlight search matches
set incsearch " Search as characters are entered
set ignorecase " Ignore case of search
set wildmenu " Visual tab autocomplete for : command menu
set wildmode=longest:full,full
set ruler " Show caret coordinates on status bar

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines
set backspace=2 " Allow backspace at start of line
set nocompatible " Fix insert mode?
set smarttab
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set background=dark

set shm+=I " Hide splash screen

set breakindent
set showbreak=↳\
set linebreak
syntax on " Enable syntax highlighting

" Plugins with vim-plug
" https://github.com/digitaltoad/vim-pug
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
call plug#end()

colorscheme dracula " Dracula theme

set fillchars-=vert:\| " Hide view split bar
highlight VertSplit ctermbg=DarkGrey " Make vertical split bg dark grey
highlight VertSplit ctermfg=DarkGrey " Make horizontal split bg dark grey"

" Nerd tree config
nmap <C-n> :NERDTreeToggle<CR> " Control + n toggle tree
let NERDTreeMinimalUI=1 " Hide help menu
let NERDTreeShowHidden=1 " Show hidden files by default

set signcolumn=number " Show signs in number column

highlight LineNr ctermfg=DarkGrey " Set line number to DarkGrey
highlight Normal ctermbg=NONE

" Enabled coc extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-rome',
  \ 'coc-json',
  \ 'coc-sh',
  \ 'coc-markdownlint'
  \ ]

" Load default coc config
so ~/.coc.vim

