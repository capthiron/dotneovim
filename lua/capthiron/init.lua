require('capthiron/autosave')
require('capthiron/gitsigns')
require('capthiron/harpoon')
require('capthiron/lsp')
require('capthiron/lspkind')
require('capthiron/lualine')
require('capthiron/mason')
require('capthiron/nvimautopairs')
require('capthiron/nvimcmp')
require('capthiron/nvimtree')
require('capthiron/telescope')
require('capthiron/treesitter')


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")
