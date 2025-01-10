# dotneovim

📹 kickstart.nvim Neovim Guide: [The only video you need to get started with Neovim](https://www.youtube.com/watch?v=m8C0Cq9Uv9o)
📹 lazy.nvim Neovim Guide: [How To Use lazy.nvim for an Amazing And Simple Neovim Config](https://youtu.be/vdn_pKJUda8)

_If you clone the repo into your machine and use the config by copying .config/nvim to your home folder, wait for the plugins, language servers, and parsers to install with lazy.nvim, Mason, and nvim-treesitter. If you are opening a lua file or another file I have language servers configured for, like HTML, CSS, or JavaScript/TypeScript, you might also get an error saying that the server failed to start. This is because Mason hasn't installed it yet. Press enter to continue, Mason will automatically install it._

## Introduction

This Neovim configuration is based on the [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) project, which serves as a starting point for creating a personalized setup. Kickstart.nvim is:

* Small
* Single-file
* Completely Documented

**NOT** a Neovim distribution, but instead a starting point for your configuration.

## Installation

### Install Neovim

Ensure you have the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) or ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) version of Neovim.

### Setup Requires

- True Color Terminal Like: [Ghostty](https://ghostty.org/)
- [Neovim](https://neovim.io/) (Version 0.9 or Later)
- [Nerd Font](https://www.nerdfonts.com/) - I use Iosevka Nerd Font
- [Ripgrep](https://github.com/BurntSushi/ripgrep) - For Telescope Fuzzy Finder
- XCode Command Line Tools
- If working with TypeScript/JavaScript and the TypeScript language server like me, you might need to install Node.

If you're on Mac, like me, you can install WezTerm, Neovim, Ripgrep, and Node with Homebrew.

```bash
brew install --cask ghostty
brew install neovim
brew install ripgrep
brew install node
```

For XCode Command Line Tools do:

```bash
xcode-select --install
```

### Post Installation

Start Neovim

```sh
nvim
```
That's it! Lazy will install all the plugins you have. Use :Lazy to view the current plugin status. Hit q to close the window.

## Plugins

#### Plugin Manager

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - Amazing plugin manager


#### Preferred Colorscheme

- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

#### Essentials

- [echasnovski/mini.surround](https://github.com/echasnovski/mini.surround) - Surround text with brackets, quotes, etc...

#### File Explorer

- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - File explorer

#### Status Line

- [echasnovski/mini.statusline](https://github.com/echasnovski/mini.statusline) - Minimal status line

#### Fuzzy Finder

- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - Dependency for better performance
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy Finder

#### Marking Files With Prime's Harpoon

- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)

#### Autocompletion

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Completion source for text in current buffer
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - Completion source for file system paths
- [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim) - Vs Code Like Icons for autocompletion

#### Snippets

- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Completion source for snippet autocomplete

#### Managing & Installing Language Servers, Linters & Formatters

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

#### LSP Configuration

- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Bridges gap b/w mason & lspconfig
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Easy way to configure lsp servers
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - Smart code autocompletion with lsp

#### Syntax Highlighting & Autoclosing Things

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configuration
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autoclose brackets, parens, quotes, etc...

#### Git

- [tpope/fugitive.vim](https://github.com/tpope/fugitive.vim) - "A Git wrapper so awesome, it should be illegal"
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Show line modifications on left hand side

