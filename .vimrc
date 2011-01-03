set nocompatible

let bash_is_sh=1

set guioptions=ac

" edit .vimrc
nmap <silent> ,ev :e $MYVIMRC<cr>
" source .vimrc
nmap <silent> ,sv :so $MYVIMRC<CR>

set showmode
set showcmd

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

syntax on
colorscheme torte

set autoindent

set ruler

" line numbers
set number
" toggle relative numbers
noremap ,rn :RN<cr>

set wildmenu
set wildmode=list:longest

" a few remaps
map! jj <ESC>
nnoremap :W<cr> :w<cr>
nnoremap <tab><tab> %
vnoremap <tab><tab> %

" search setup
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set incsearch
" shortcut to clear the search buffer
nnoremap ,<space> :noh<cr>

set encoding=utf-8

set hidden

set ch=1

" looks of the status line
set stl=%F\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

set laststatus=2

" hide the mouse when typing
set mousehide

" timeout between key combinations, like jj
set timeoutlen=500

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

set backspace=2

" automatically change cwd to the directory of the file in the current buffer
autocmd BufEnter * lcd %:p:h
" shortcut to change to the directory of the file in the current buffer
nnoremap ,cwd :lcd %:p:h<cr>

filetype plugin on
filetype indent on
runtime! $HOME/.vim/ftdetect/*.vim

autocmd BufNewFile,BufRead *.inc set ft=php
autocmd BufNewFile,BufRead *.phtml set ft=php
autocmd BufNewFile,BufRead *.tpl set ft=html

" check with ctrl+l the current file for php syntax errors
autocmd FileType php noremap <C-l> :!/usr/bin/php -l %<cr>
" highlight php variables
autocmd FileType php CursorMoved * silent! exe printf('match IncSearch /$\<%s\>/', expand('<cword>'))

" NERDTree settings
nmap <F7> :NERDTreeToggle<CR>
nmap ,fb :NERDTreeToggle<cr>
