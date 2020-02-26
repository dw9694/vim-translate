func! _Translate()
py3 << EOF
import vim
from googletrans import Translator

selected = vim.eval('@+')  # visual selected text stored in register +
text = selected.replace('\n', ' ')

response = Translator().translate(text, dest='ru')
print(response.text)

EOF
endfunc

vmap <leader>u "+y:call _Translate()<CR>
