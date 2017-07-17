set expandtab
set cursorline
set shiftwidth=4
set tabstop=4
set softtabstop=4
set ai

set bg=light

filetype indent on
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap {{ {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap {<CR> {<CR>}<Esc>ko

noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>
