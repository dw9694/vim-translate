" Vim global plugin for translating text
" Last Change:	2020 Feb 26
" Maintainer:  	David Webb https://github.com/dw9694/vim-translate
" License:	    This file is placed in the public domain.

if exists("g:loaded_translate")
  finish
endif
let g:loaded_translate = 1

let s:save_cpo = &cpo
set cpo&vim


"""""""""""""""""""""""""
func! _Translate()
py3 << EOF
import vim
from googletrans import Translator

# Visual selected text stored in register "+"
selected = vim.eval('@+')
text = selected.replace('\n', ' ')

response = Translator().translate(text, dest='ru')
print(response.text)

EOF
endfunc

vmap <leader>u "+y:call _Translate()<CR>

"""""""""""""""""""""""""


let &cpo = s:save_cpo
unlet s:save_cpo
