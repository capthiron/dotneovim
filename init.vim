"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀                    
"                     ___________ _____                     
"_______________________  /___  /____(_)______neovim_______ 
"_  ___/  __ `/__  __ \  __/_  __ \_  /__  ___/  __ \_  __ \
"/ /__ / /_/ /__  /_/ / /_ _  / / /  / _  /   / /_/ /  / / /
"\___/ \__,_/ _  .___/\__/ /_/ /_//_/  /_/    \____//_/ /_/ 
"     2022    /_/                                           
"
"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

"░▒█▀▀█░█▀▀▄░█▀▀░░░░▒█▀▀▄░█░░░░█▀▀░█▀▄░█░▄░█▀▀
"░▒█▄▄█░█▄▄▀░█▀▀░▀▀░▒█░░░░█▀▀█░█▀▀░█░░░█▀▄░▀▀▄
"░▒█░░░░▀░▀▀░▀▀▀░░░░▒█▄▄▀░▀░░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

" Ensure the following tools are installed in the system
let s:exec_list = ['git', 'curl', 'python3', 'rg', 'npm', 'lolcat', 'gopls']

for s:exec in s:exec_list
  if !executable(s:exec)
    echoerr printf('[nvim] `%s` is needed!', s:exec)

    finish
  endif
endfor


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
Plug 'kyazdani42/nvim-tree.lua' "nvin-tree navigation
Plug 'nvim-telescope/telescope.nvim' " The main Telescope plugin
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' } " An optional plugin recommended by Telescope docs
Plug 'nvim-lua/plenary.nvim' " Telescope requires plenary to function
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'tpope/vim-fugitive' " a git wrapper so awesome, it should be illegal
Plug 'junegunn/gv.vim' " a git commit browser
Plug 'lewis6991/gitsigns.nvim' " gitsigns (marks git changes)
Plug 'Pocco81/AutoSave.nvim' " autosave plugin

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

" Unbind default bindings for arrow keys, trust me this is for your own good
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Map Esc, to perform quick switching between Normal and Insert mode
inoremap jk <Esc>

nnoremap <C-t> :NvimTreeToggle<cr>

nnoremap <C-p> :Telescope find_files<cr>
nnoremap <C-b> :Telescope buffers<cr>
nnoremap <C-g> :Telescope live_grep<cr>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>

nnoremap <silent> gd :Telescope lsp_definitions<cr>
nnoremap <silent> gi :Telescope lsp_implementations<cr>
nnoremap <silent> gr :Telescope lsp_references<cr>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:dashboard_default_executive="telescope"

lua require('capthiron')
