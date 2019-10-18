set nocompatible

filetype plugin indent on
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
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'

" HTML
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag'

" JS
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'posva/vim-vue'

" Python
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'hdima/python-syntax'
Plugin 'indentpython.vim'

call vundle#end()

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

au BufNewFile,BufRead *.php,*.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=119 |

au BufNewFile,BufRead *.json,*.html,*.css,*.js,*.vue
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 |

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
let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" Gutter
set updatetime=500

" Emmet
let g:user_emmet_leader_key=','

" Auto Completion
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif

let g:neocomplcache_omni_functions.python = 'jedi#complete'
let g:jedi#popup_on_dot = 1
