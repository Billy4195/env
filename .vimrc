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

inoremap (( ()<Esc>i
inoremap )) <Esc>la
inoremap [[ []<Esc>i
inoremap ]] <Esc>la
inoremap {{ {}<Esc>i
inoremap }} <Esc>la
inoremap "" ""<Esc>i
inoremap d" <Esc>la
inoremap '' ''<Esc>i
inoremap d' <Esc>la
inoremap {<CR> {<CR>}<Esc>ko

noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

let mapleader=';'

nmap <leader>1 0
nmap <leader>2 ^
nmap <leader>0 $

nmap <leader>w :w<CR>
nmap <leader>Q :q!<CR>
nmap <leader>q :q<CR>
nmap <leader>s :wq<CR>
nmap <leader>n w
