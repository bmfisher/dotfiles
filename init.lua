-- Globals
vim.g.mapleader = " "
vim.g.netrw_browser_split = 2
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.NERDTreeShowHidden = 1
vim.g.isort_command = 'isort'

-- Vim options
vim.opt.errorbells = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = '/Users/brandonfisher/.vim/undodir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.guicursor = ''
vim.opt.clipboard = 'unnamed'
vim.opt.scrolloff = 10
vim.opt.completeopt={"menu","menuone","noselect"}
vim.opt.foldmethod = 'indent'
vim.cmd([[:set foldlevel=99]])

-- Keymaps
vim.api.nvim_set_keymap("n", "<leader>y", ":vertical resize -5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>u", ":resize -5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>i", ":resize +5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>o", ":vertical resize +5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":wincmd h<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>j", ":wincmd j<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>k", ":wincmd k<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":wincmd l<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pv", ":NERDTree<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":bn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":wincmd x<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>v", ":wincmd v<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>s", ":wincmd s<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hl", ":noh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cl", ":lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ff", ":lua require'telescope.builtin'.live_grep{ vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '-i', '--with-filename', '--line-number', '--column', '--smart-case', '-uu' }}<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fa", ":Files <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fz", ":Ag <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>lt", ":set background=light<CR>:hi Visual ctermbg=darkblue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dk", ":set background=dark<CR>:hi Visual ctermbg=LightGreen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":lua require'telescope.builtin'.buffers()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>z", ":lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":e term://zsh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fo", ":foldopen!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fc", ":foldclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f1", ":set foldlevel=0<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f2", ":set foldlevel=2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f3", ":set foldlevel=4<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>uf", ":set foldlevel=99<CR>", { noremap = true })

vim.cmd([[
:tnoremap <Esc> <C-\><C-n>
]])



-- Install plugins
vim.cmd([[
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'tpope/vim-fugitive'

call plug#end()
]])

require('my-treesitter')
require('my-lsp')
require('my-nvim-cmp')
require('my-dap')



-- Colorscheme
vim.cmd([[
colorscheme Papercolor
hi Visual ctermbg=LightGreen
]])
