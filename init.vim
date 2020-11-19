call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'christianchiarulli/nvcode-color-schemes.vim'

call plug#end()

colorscheme nvcode
set expandtab
set tabstop=4
set shiftwidth=4

"# Mapping
map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <A-r> :source $MYVIMRC<CR>
"# Mapping quick switch windows
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-l> :wincmd l<CR>

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
EOF

function StartUp()
    if ''==@%
        NERDTree
    endif
endfunction
autocmd VimEnter * call StartUp()

