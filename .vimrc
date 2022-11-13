set background=dark
let g:gruvbox_contrast_dark='dark'
set tabstop=2
set t_Co=256
let g:airline_powerline_fonts = 1

call plug#begin()

Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'

call plug#end()

colorscheme gruvbox
syntax enable
filetype plugin indent on

" turn hybrid line numbers on
set number relativenumber
set nu rnu
