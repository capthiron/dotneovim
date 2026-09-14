return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- lazygit runs in a terminal buffer, so the global terminal-mode <Esc> mapping
  -- swallows the key before lazygit ever sees it. Restore both <Esc> and <Esc><Esc>
  -- buffer-locally: without the second one, every Esc waits for timeoutlen to see
  -- whether a second Esc follows.
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'lazygit',
      callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('t', '<Esc>', '<Esc>', opts)
        vim.keymap.set('t', '<Esc><Esc>', '<Esc><Esc>', opts)
      end,
    })
  end,
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
}
