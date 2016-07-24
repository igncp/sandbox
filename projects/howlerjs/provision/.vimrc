execute pathogen#infect()
filetype plugin indent on
syntax on

set nobackup
set noswapfile
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set cursorline
set autoindent

let g:vim_markdown_folding_disabled = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Space> @d

inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
