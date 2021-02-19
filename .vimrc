syntax on

set noerrorbells
set tabstop=3 softtabstop=3
set shiftwidth=3
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set relativenumber
set hidden

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'srcery-colors/srcery-vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1,
  \       'override' : {
  \         'linenumber_fg' : ['', '069']
  \       }
  \     }
  \   }
  \ }
set background=dark
colorscheme PaperColor

hi Normal ctermbg=NONE

if executable('rg')
   let g:rg_derive_root='true'
endif

let g:netrw_browser_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let mapleader=" "
let NERDTreeShowHidden=1

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :NERDTree<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>n :bn<CR>
nnoremap <leader>x :wincmd x<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <silent> <C-p> :Files <CR>
