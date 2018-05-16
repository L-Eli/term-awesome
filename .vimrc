set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

filetype plugin indent on

set sidescroll=1

set encoding=utf-8
set modifiable
set ruler
set cul
set number
set mouse=a
set showcmd
set history=200
set backspace=indent,eol,start

set incsearch
set hlsearch
set ignorecase
set smartcase
set magic

set expandtab 
set autoindent 
hi LeaderTab guifg=#666666
match LeaderTab /^\t/

hi OverLength ctermbg=DarkGray ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set fileformat=unix |

au BufNewFile,BufRead *.php,*.json,*.phtml,*.html,*.css,*.js,*.cron
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=119 |

set foldmethod=indent
set foldlevel=99
nnoremap <space> za <CR>

" Style
syntax on
set t_Co=256
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
set background=dark

nnoremap <silent> <C-h> :bp <CR>
nnoremap <silent> <C-l> :bn <CR>

" NERDTree
nnoremap <silent> <C-a> :NERDTreeToggle <CR>
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1

" Airline
set ttimeoutlen=50
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" Gutter
set updatetime=500
