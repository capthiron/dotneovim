return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'fredrikaverpil/neotest-golang', version = '*' },
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-golang' {
          go_test_args = { '-v', '-race', '-count=1', '-tags=unit,integration' },
        },
      },
    }

    -- neotest only re-reads test positions on BufAdd/BufWritePost. A file
    -- changed outside Neovim (rebase, checkout) is reloaded without either, so
    -- status signs stayed on the old line numbers. Replay neotest's own
    -- BufWritePost handler for the reloaded buffer.
    vim.api.nvim_create_autocmd('FileChangedShellPost', {
      group = vim.api.nvim_create_augroup('neotest-rediscover-on-reload', { clear = true }),
      callback = function(ev)
        vim.api.nvim_exec_autocmds('BufWritePost', { group = 'neotest.Client', buffer = ev.buf })
      end,
    })
  end,
  keys = {
    { '<leader>Tr', function() require('neotest').run.run() end, desc = '[T]est [r]un nearest' },
    { '<leader>Tf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = '[T]est run [f]ile' },
    { '<leader>Ta', function() require('neotest').run.run(vim.fn.getcwd()) end, desc = '[T]est run [a]ll' },
    { '<leader>Tl', function() require('neotest').run.run_last() end, desc = '[T]est run [l]ast' },
    { '<leader>Td', function() require('neotest').run.run { strategy = 'dap' } end, desc = '[T]est [d]ebug nearest' },
    { '<leader>Ts', function() require('neotest').summary.toggle() end, desc = '[T]est [s]ummary' },
    { '<leader>To', function() require('neotest').output.open { enter = true } end, desc = '[T]est [o]utput' },
  },
}
