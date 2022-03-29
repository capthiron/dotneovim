"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀                    
"                     ___________ _____                     
"_______________________  /___  /____(_)______neovim_______ 
"_  ___/  __ `/__  __ \  __/_  __ \_  /__  ___/  __ \_  __ \
"/ /__ / /_/ /__  /_/ / /_ _  / / /  / _  /   / /_/ /  / / /
"\___/ \__,_/ _  .___/\__/ /_/ /_//_/  /_/    \____//_/ /_/ 
"     2022    /_/                                           
"
"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

"░▒█░░▒█░█▀▀▄░█▀▀▄░░▀░░█▀▀▄░█▀▀▄░█░░█▀▀░█▀▀
"░░▒█▒█░░█▄▄█░█▄▄▀░░█▀░█▄▄█░█▀▀▄░█░░█▀▀░▀▀▄
"░░░▀▄▀░░▀░░▀░▀░▀▀░▀▀▀░▀░░▀░▀▀▀▀░▀▀░▀▀▀░▀▀▀

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
let mapleader = " " " map leader to Space


"░▒█▀▀█░█░░█░▒█░█▀▀▀░░▀░░█▀▀▄░█▀▀
"░▒█▄▄█░█░░█░▒█░█░▀▄░░█▀░█░▒█░▀▀▄
"░▒█░░░░▀▀░░▀▀▀░▀▀▀▀░▀▀▀░▀░░▀░▀▀▀

call plug#begin('~/.config/nvim/plugged')

Plug 'shaunsingh/nord.nvim' " nord theme
Plug 'glepnir/dashboard-nvim' " dashboard-nvim
Plug 'neovim/nvim-lspconfig' " lsp config
Plug 'onsails/lspkind-nvim' " lsp kind annotations (e. g. variable, function, etc.)
Plug 'nvim-lualine/lualine.nvim' " lualine status bar
Plug 'kyazdani42/nvim-web-devicons' " lualine icons
Plug 'preservim/nerdtree' " nerdtree explorer
Plug 'nvim-telescope/telescope.nvim' " The main Telescope plugin
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' } " An optional plugin recommended by Telescope docs
Plug 'nvim-lua/plenary.nvim' " Telescope requires plenary to function
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'tpope/vim-fugitive' " vim-fugitive (git)
Plug 'lewis6991/gitsigns.nvim' " gitsigns (marks git changes)

" autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" snippets 
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()


"░▀▀█▀▀░█░░░░█▀▀░█▀▄▀█░█▀▀
"░░▒█░░░█▀▀█░█▀▀░█░▀░█░█▀▀
"░░▒█░░░▀░░▀░▀▀▀░▀░░▒▀░▀▀▀

colorscheme nord


"░▒█░▄▀░█▀▀░█░░█░█▀▀▄░░▀░░█▀▀▄░█▀▄░░▀░░█▀▀▄░█▀▀▀░█▀▀
"░▒█▀▄░░█▀▀░█▄▄█░█▀▀▄░░█▀░█░▒█░█░█░░█▀░█░▒█░█░▀▄░▀▀▄
"░▒█░▒█░▀▀▀░▄▄▄▀░▀▀▀▀░▀▀▀░▀░░▀░▀▀░░▀▀▀░▀░░▀░▀▀▀▀░▀▀▀

nnoremap <C-f> :NERDTreeFocus<cr>
nnoremap <C-n> :NERDTree<cr>
nnoremap <C-t> :NERDTreeToggle<cr>

nnoremap <C-p> :Telescope find_files<cr>
nnoremap <C-b> :Telescope buffers<cr>
nnoremap <C-g> :Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:dashboard_default_executive="telescope"

lua require('capthiron')
