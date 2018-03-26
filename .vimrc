set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on

set encoding=utf-8
set ma " modifiable
set ruler
set cul
set number
set mouse=a
set showcmd
set history=2000
set backspace=indent,eol,start

set incsearch
set hlsearch
set ignorecase
set smartcase
set magic

set expandtab 
set autoindent 
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/

highlight OverLength ctermbg=DarkGray ctermfg=white guibg=#592929
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

syntax on
 set t_Co=256
" colorscheme gruvbox
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
set background=dark

nnoremap <silent> <C-h> :bp <CR>
nnoremap <silent> <C-l> :bn <CR>

" NERDTree
autocmd VimEnter * NERDTree
nnoremap <silent> <C-a> :NERDTreeToggle <CR>
let g:NERDTreeChDirMode = 2 

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'

" Airline
set laststatus=2
set ttimeoutlen=50
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='papercolor'

" Gutter
set updatetime=250

set statusline=
set statusline+=%1*\[%n]                                  "buffernr
set statusline+=%2*\ %<%F\                                "File+path
set statusline+=%3*\ %=\ %{''.(&fenc!=''?&fenc:&enc).''}\ "Encoding
set statusline+=%4*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%5*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%6*\ row:%l/%L\ col:%03c\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
hi User2 ctermfg=3  ctermbg=0
hi User6 ctermfg=3  ctermbg=4
set laststatus=2
