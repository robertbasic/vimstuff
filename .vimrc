set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'Lokaltog/vim-easymotion'

Plugin 'bronson/vim-trailing-whitespace'

Plugin 'takac/vim-hardtime'

Plugin 'airblade/vim-rooter'

Plugin 'vimwiki/vimwiki'

Plugin 'vim-scripts/PreserveNoEOL'

Plugin 'michaeljsmith/vim-indent-object'

Plugin '2072/PHP-Indenting-for-VIm'

Plugin 'itchyny/lightline.vim'

Plugin 'majutsushi/tagbar'

Plugin 'vim-php/tagbar-phpctags.vim'

Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()

filetype plugin indent on

set encoding=utf-8

let bash_is_sh=1

set guioptions=em

" edit .vimrc
nmap <silent> ,ev :e $MYVIMRC<cr>
" source .vimrc
nmap <silent> ,sv :so $MYVIMRC<cr>

set showmode
set showcmd

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

syntax on
colorscheme desert

" set cindent
set smartindent

set ruler

set clipboard=unnamed

" show line numbers
" set relativenumber
set number

" helps with <Tab> completing file names
set wildmenu
set wildmode=list:longest

" search setup
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

let mapleader="\<space>"

" shortcut to clear the search buffer
nnoremap ,<space> :noh<cr>

" hides buffers instead of unloading them
set hidden

" looks of the status line
" set stl=%F\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

set laststatus=2

" hide the mouse when typing
set mousehide

set history=100

" when scrolling up/down the page, number of lines when scrolling starts
set scrolloff=8

" change how the cursor looks
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set guifont=DejaVu\ Sans\ Mono\ 12

set backspace=2

" automatically change cwd to the directory of the file in the current buffer
autocmd BufEnter * lcd %:p:h
" shortcut to change to the directory of the file in the current buffer
nnoremap <leader>cwd :lcd %:p:h<cr>

autocmd BufNewFile,BufRead *.inc set ft=php
autocmd BufNewFile,BufRead *.phtml set ft=phtml
autocmd BufNewFile,BufRead *.tpl set ft=phtml

" check with ctrl+l the current file for php syntax errors
autocmd FileType php noremap <C-l> :!/usr/bin/php -l %<cr>

" NERDTree settings
nmap <silent> <c-n> :NERDTreeToggle<CR>
let NERDTreeMapHelp='<f1>'
let NERDTreeIgnore = ['\.pyc$', '__init__.py', '__pycache__']

" sync syntax
nmap <silent> <leader><leader>fs :syntax sync fromstart<cr>

let g:PreserveNoEOL=0

nmap <silent> <leader><leader>sbf :set guifont=DejaVu\ Sans\ Mono\ 12<cr>
nmap <silent> <leader><leader>ssf :set guifont=DejaVu\ Sans\ Mono\ 10<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <leader>j <Plug>(easymotion-j)
vmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
vmap <leader>k <Plug>(easymotion-k)
nmap <leader>s <Plug>(easymotion-s)
vmap <leader>s <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount=3

map <tab> :CtrlPBuffer<cr>
map <leader>tb :CtrlPBufTag<cr>
map <leader>ta :CtrlPTag<cr>
map <leader>jd :CtrlPTag<cr><C-\>w
"unlet g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = 'vendor/\|tests\/log\|git\|env\|build/\|dist/\|__pycache__\|docs\/build/\|public_html\/api/\|public_html\/docs/\|*.pyc'

augroup CursorLine
    au!
    au WinLeave * setlocal nocursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
augroup End

nmap <leader>cl dd:pu<CR>

" indent paragraph
map <leader>ip vip><CR>k
" outdent paragraph
map <leader>op vip<<CR>k
" indent curly braces
map <leader>ic vi{><CR>k
" outdent curly braces
map <leader>oc vi{<<CR>k
" fix indent in curly braces
map <leader>fic vi{=<CR>k
" fix indent in square brackets
map <leader>fis vi[j=<CR>k

" yank current php method
map <leader>ycm ?<space>function<space><CR>Vj%y<CR>:noh<CR>
" move to next php method
map <leader>npm /<space>function<space><CR>2w:noh<CR>

" wrap current line in <p></p> (for blog posts)
map <leader>pwp O<p><ESC>2ji</p><CR><ESC>

" delete to null register (zap it!)
"noremap z "_d
"noremap Z "_D

map <leader>wos :VimwikiIndex<cr> :VimwikiGoto Scrap<cr>

" since installing vim-indent-object
" PHP block comments got broken
" this whatever is fixes it
au FileType php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
au FileType php setlocal formatoptions+=cro

map <leader>fpc :setlocal comments=s1:/*,mb:*,ex:*/,://,:#<cr>:setlocal formatoptions+=cro<cr>

let g:rooter_silent_chdir=1

" take
" a_very_long_line(with_parenthesis)
" and turn it into
" a_very_long_line(
"     with_parenthesis
" )
" useful for python long lines
map <leader>l79 ^f(a<cr><esc><<$i<cr><esc><<

nmap <F8> :TagbarToggle<CR>

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

function! OpenTestFile()
    let b:file = expand("%:p:r")
    let b:root_dir = getbufvar('%', 'rootDir')
    let b:tests_dir = b:root_dir . "/tests"
    let b:test_file = substitute(b:file, b:root_dir, b:tests_dir, "") . "Test.php"
    exe ":vsp " b:test_file
endfun

map <leader>otf :call OpenTestFile()<cr>

map <leader>ihf :set ft=html<cr>ggVG=<cr>:set ft=php<cr>

let g:gutentags_exclude = ['*.css', '*.html', '*.js']
let g:gutentags_cache_dir = '~/.vim/gutentags'

let g:tagbar_phpctags_bin='~/.vim/phpctags'

nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

function! CopyPasteMethodBody(from_line, to_line)
    execute a:from_line
    normal! yiB
    execute a:to_line
    normal! p
endfun
