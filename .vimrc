syntax on

set noerrorbells 
set tabstop=2 softtabstop=2
set shiftwidth=2
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
set guicursor=

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'ekalinin/Dockerfile.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
   augroup WSLYank
      autocmd!
      autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
   augroup END
endif

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
hi Visual ctermbg=LightGreen

if executable('rg')
   let g:rg_derive_root='true'
endif

let g:netrw_browser_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let mapleader=" "
let NERDTreeShowHidden=1

nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
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
nnoremap <leader>s :wincmd s<CR>
nnoremap <silent> <C-p> :Files <CR>
nnoremap <silent> <C-f> :Ag <CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
  
if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[0 q"
  " insert mode
  let &t_SI .= "\<Esc>[6 q"
endif
