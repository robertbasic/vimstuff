set nocompatible

" Using vim-plug for plugins https://github.com/junegunn/vim-plug

call plug#begin("~/.vim/bundle")

Plug 'VundleVim/Vundle.vim'

Plug 'scrooloose/nerdtree'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'easymotion/vim-easymotion'

Plug 'bronson/vim-trailing-whitespace'

Plug 'takac/vim-hardtime'

Plug 'airblade/vim-rooter'

Plug 'vim-scripts/PreserveNoEOL'

Plug '2072/PHP-Indenting-for-VIm'

Plug '2072/vim-syntax-for-PHP'

Plug 'itchyny/lightline.vim'

Plug 'majutsushi/tagbar'

Plug 'vim-php/tagbar-phpctags.vim'

Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" Enable filetype indentation
filetype plugin indent on
" Do smart autoindenting
set smartindent

" Use UTF-8 encoding
set encoding=utf-8

" Can't remember why is this in
" or from where did I pick it up
let bash_is_sh=1

" ==== Display settings ====
" P - whatever is yanked is automatically put in the system clipboard
" m - show menu bar
set guioptions=Pm

" The ruler shows line, column numbers
" and relative position of the cursor
set ruler

" Show line numbers
set number

" Show in what mode we are
set showmode
" Show command entered in bottom right
set showcmd
" Remember the last 100 commands on the command-line
set history=100

" Tab settings
" One tab is 4 space
set tabstop=4
" Number of spaces for (auto)indent
set shiftwidth=4
" Round indent to multiple of shiftwidth
set shiftround
" Expand tabs to spaces
set expandtab
set softtabstop=4

" Syntax!
" Turn on syntax highlightning
syntax on
colorscheme desert

" Turn on command-line completion
set wildmenu
" List all matches and complete till longest common string
set wildmode=list:longest

" Always have a status line
set laststatus=2

" Hide mouse when typing
set mousehide

" When scrolling up/down the page, number of lines when scrolling starts
set scrolloff=8

" change how the cursor looks
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Show cursorline for the active buffer
" Hide cursorline for inactive buffers
augroup CursorLine
    au!
    au WinLeave * setlocal nocursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
augroup End

" Set font
set guifont=DejaVu\ Sans\ Mono\ 12

function! SetBigFont()
    set guifont=DejaVu\ Sans\ Mono\ 12
endfun

function! SetSmallFont()
    set guifont=DejaVu\ Sans\ Mono\ 10
endfun

" ==== End display settings ====

" Make backspace behave normally
set backspace=2

" Space, the Leader!
let mapleader="\<space>"

" ==== Search/yank settings ====
" Yank/delete copies to system clipboard
set clipboard=unnamed

" Search settings
" Ignore case when searching
set ignorecase
" Ignore ignorecase when search pattern contains uppercase chars
set smartcase
" Incremental search - start highlighting search results as the
" search string is typed
set incsearch
" Highlight search results
set hlsearch

" Normal, non-recursive map
" Clear the search buffer
nnoremap <leader>, :noh<cr>

" Make n always search forward
" Make N always search backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" ==== End search/yank settings ====


" consider
" set selection=old

" ==== Plugins settings ====
"
" ==== NERDTree settings ====
nnoremap <silent> <c-n> :NERDTreeToggle<CR>
let NERDTreeMapHelp='<f1>'
let NERDTreeIgnore = ['\.pyc$', '__init__.py', '__pycache__']
" ==== End NERDtree settings ====
"
" ==== CtrlP settings ====
" Open CtrlP buffers
map <tab> :CtrlPBuffer<cr>
map <leader>tb :CtrlPBufTag<cr>
map <leader>ta :CtrlPTag<cr>
" Jump to definition
map <leader>jd :CtrlPTag<cr><C-\>w
" Things to ignore with CtrlP
let g:ctrlp_custom_ignore = 'vendor/\|tests\/log\|git\|env\|build/\|dist/\|__pycache__\|docs\/build/\|public_html\/api/\|public_html\/docs/\|*.pyc'
" ==== End CtrlP settings ====
"
" ==== Easymotion settings ====
" Disable default easymotion mappings
let g:EasyMotion_do_mapping = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
nmap <leader>s <Plug>(easymotion-s)
vmap <leader>s <Plug>(easymotion-s)
" ==== End Easymotion settings ====
"
" ==== hardtime settings ====
" Turn on hardtime
let g:hardtime_default_on = 1
" Allow different movement key
let g:hardtime_allow_different_key = 1
" Max 3 of the same movement allowed at a time
let g:hardtime_maxcount = 3
" ==== End hardtime settings ====
"
" ==== rooter settings ====
let g:rooter_silent_chdir=1
" ==== End rooter settings ====
"
" ==== PreserveNoEOL settings ====
let g:PreserveNoEOL=0
" ==== End Preserver NoEOL settings ====
"
" ==== tagbar settings ====
" Open tagbar with F8
nnoremap <F8> :TagbarToggle<CR>
" Location of phpctags bin
let g:tagbar_phpctags_bin='~/.vim/phpctags'
" ==== End tagbar settings ====
"
" ==== gutentags settings ====
" Exclude css, html, js files from generating tag files
let g:gutentags_exclude = ['*.css', '*.html', '*.js']
" Where to store tag files
let g:gutentags_cache_dir = '~/.vim/gutentags'
" ==== End gutentags settings ====
"
" ==== lightline settings ====
let g:lightline = {
    \ 'active': {
    \   'left': [['mode'], ['readonly', 'filename', 'modified'], ['tagbar', 'gutentags']],
    \   'right': [['lineinfo'], ['filetype']]
    \ },
    \ 'inactive': {
    \   'left': [['absolutepath']],
    \   'right': [['lineinfo'], ['filetype']]
    \ },
    \ 'component': {
    \   'lineinfo': '%l\%L [%p%%], %c, %n',
    \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
    \   'gutentags': '%{gutentags#statusline("[Generating...]")}',
    \ },
    \ }
" ==== End lightline settings ====
"
" ==== End plugin settings ====

" ==== Automatic ====
" Automatically change cwd to the directory of the file in the current buffer
autocmd BufEnter * lcd %:p:h

" Set file types for some of the PHP related extensions
autocmd BufNewFile,BufRead *.inc set ft=php
autocmd BufNewFile,BufRead *.phtml set ft=phtml
autocmd BufNewFile,BufRead *.tpl set ft=phtml

" since installing vim-indent-object
" PHP block comments got broken
" this whatever is fixes it
" looks like this is not needed anymore
" granted, not using vim-indent-object
" au FileType php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
" au FileType php setlocal formatoptions+=cro

" ==== End automatic ====

" ==== Custom functions ====
function! FixSyntax()
    " nmap <silent> <leader><leader>fs :syntax sync fromstart<cr>
    syntax sync fromstart
endfun

function! OpenTestFile()
    let b:file = expand("%:p:r")
    let b:root_dir = getbufvar('%', 'rootDir')
    let b:tests_dir = b:root_dir . "/tests"
    let b:test_file = substitute(b:file, b:root_dir, b:tests_dir, "") . "Test.php"
    exe ":vsp " b:test_file
endfun

function! CopyPasteMethodBody(from_line, to_line)
    execute a:from_line
    normal! yiB
    execute a:to_line
    normal! p
endfun

function! IndentHtmlFile()
    set ft=html
    normal! ggVG=<cr>
    set ft=php
endfun

" ==== End custom functions ====

" ==== Remappings ====
" edit .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<cr>
" source .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" check with ctrl+l the current file for php syntax errors
autocmd FileType php noremap <C-l> :!/usr/bin/php -l %<cr>

" Swap the current line and the line below
nmap <leader>clb dd:pu<cr>
" Swap the current line and the line above
nmap <leader>cla ddkP<cr>

" Fix indent in curly Braces
noremap <leader>fiB viB=<cr>k
" Fix indent in [square braces
noremap <leader>fi[ vi[j=<cr>k

" Call OpenTestFile() custom function
nnoremap <leader>otf :call OpenTestFile()<cr>

" ==== End remappings ====
