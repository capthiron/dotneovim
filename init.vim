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


"░▒█▀▀█░█░░█░▒█░█▀▀▀░░▀░░█▀▀▄░█▀▀
"░▒█▄▄█░█░░█░▒█░█░▀▄░░█▀░█░▒█░▀▀▄
"░▒█░░░░▀▀░░▀▀▀░▀▀▀▀░▀▀▀░▀░░▀░▀▀▀

call plug#begin('~/.config/nvim/plugged')

Plug 'shaunsingh/nord.nvim' " nord theme
Plug 'neovim/nvim-lspconfig' " lsp config
Plug 'nvim-lualine/lualine.nvim' " lualine status bar
Plug 'kyazdani42/nvim-web-devicons' " lualine icons
Plug 'preservim/nerdtree' " nerdtree explorer
Plug 'nvim-lua/plenary.nvim' " Telescope requires plenary to function
Plug 'nvim-telescope/telescope.nvim' " The main Telescope plugin
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' } " An optional plugin recommended by Telescope docs
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'tpope/vim-fugitive' " vim-fugitive (git)
Plug 'lewis6991/gitsigns.nvim' " gitsigns (marks git changes)

" autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For luasnip users.
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

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-b> :Telescope buffers<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

lua require('capthiron')
