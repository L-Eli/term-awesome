call plug#begin('~/.vim/autoload')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'
Plug 'matze/vim-move'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
Plug 'arcticicestudio/nord-vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Python
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'HansPinckaers/ncm2-jedi'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" JS

" HTML
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
call plug#end()


" nerdtree
nnoremap <silent> <C-a> :NERDTreeToggle <CR>

let NERDTreeShowHidden=3

"autocmd VimEnter * NERDTreeToggle


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_html_tidy_quiet_messages={"level":"warnings"}


" tagbar
nmap <silent> <C-t> :TagbarToggle <CR>

let g:tagbar_width=winwidth('%') / 5

"autocmd VimEnter * TagbarToggle


" airline
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>1 :bfirst<CR>
nnoremap <Leader>2 :bfirst<CR>:bn<CR>
nnoremap <Leader>3 :bfirst<CR>:2bn<CR>
nnoremap <Leader>4 :bfirst<CR>:3bn<CR>
nnoremap <Leader>5 :bfirst<CR>:4bn<CR>
nnoremap <Leader>6 :bfirst<CR>:5bn<CR>
nnoremap <Leader>7 :bfirst<CR>:6bn<CR>
nnoremap <Leader>8 :bfirst<CR>:7bn<CR>
nnoremap <Leader>9 :blast<CR>
nnoremap <Leader>w :bd<CR>

let g:airline_theme='nord'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1


" theme
let g:solarized_termcolors=256


" supertab
let g:SuperTabMappingForward='<s-tab>'
let g:SuperTabMappingBackward='<tab>'


" move
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp

" vim nerdtree syntastic highlight
let g:NERDTreeExtensionHighlightColor={}
let g:NERDTreeExtensionHighlightColor['vue']='42b883'


" gutter
set updatetime=500


" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
inoremap <c-c> <ESC>

set completeopt=menuone,noselect,noinsert
set shortmess+=c

let ncm2#popup_delay=5
let ncm2#complete_length=[[1, 1]]
let g:ncm2#matcher='substrfuzzy'


" jedi (disable all jedi-vim's auto completeion)
let g:jedi#auto_initialization=1
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0
let g:jedi#smart_auto_mappings=0
let g:jedi#popup_on_dot=0
let g:jedi#completions_command=""
let g:jedi#show_call_signatures="1"


" emmet
let g:user_emmet_leader_key=','


" closetag
let g:closetag_filenames='*.html,*.vue'


" settings

set encoding=UTF-8
set modifiable
set number                      " display line number
set showcmd
set mouse=a
set ruler
set history=1000
set sidescroll=1
set cursorline		        " highlights the screen column of the cursor
set backspace=indent,eol,start

""" style
syntax enable
colorscheme nord
set background=dark

""" fold
nnoremap <space> za <CR>
set foldmethod=indent
set foldlevel=100

""" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set magic

""" indent
set expandtab
set autoindent

au BufNewFile,BufRead *.php,*.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |

au BufNewFile,BufRead *.json,*.html,*.css,*.js,*.vue
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |

function StartUp()
    if ''==@%                           " No filename
        NERDTree
        Tagbar
    elseif 0==filereadable(@%)          " File doesn't exists
    elseif 1==line('$') && 1==col('$')  " File is empty
    endif
endfunction

autocmd VimEnter * call StartUp()
