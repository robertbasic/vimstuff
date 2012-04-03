" Vim global plugin to display commands in a sidebar
"
" For now just add key/value pairs in the 'shorts' dict " down below.
" Might move that to some file at one point. Might.
"
" Maintainer: Robert Basic <robertbasic.com@gmail.com>
" Version: 1.0
" License: This file is placed in the public domain.

if !has("python")
    finish
endif

function! Vimshorts()

python << endpython

import vim

shorts = {
    '<c-w> hjkl': 'Move between splits',
    '<c-w> HJKL': 'Move split around',
    '<c-w> r': 'Swap splits',
    '<c-w> v': 'Split vertical',
    '<c-w> s': 'Split horizontal',
    '"+y': 'Copy sel to sys clip',
    '<c-n>': 'Toggle NERDTree',
    'w': 'Next word',
    'b': 'Previous word',
    'J': 'Join curr and next line'
}

# create a new buffer on the right side
# 30 columns wide
vim.command("silent! exec 'botright vertical 30 new'")
vim.command("silent! exec 'buffer vimshorts'")

# set some stuff for this new buffer
# just so it does not bother us with saving this buffer
vim.command("setlocal noswapfile")
vim.command("setlocal buftype=nofile")
vim.command("setlocal bufhidden=hide")
#vim.command("setlocal nowrap")
vim.command("setlocal foldcolumn=0")
vim.command("setlocal nobuflisted")
vim.command("setlocal nospell")
vim.command("setlocal nonu")

# title thingy
vim.current.buffer[0] = "========= vimshorts ========="

for k,v in sorted(shorts.iteritems()):
    vim.current.buffer.append(" %s => %s" % (k, v,))

endpython

endfunction

:call Vimshorts()
