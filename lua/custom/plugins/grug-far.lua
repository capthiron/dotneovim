return {
  'MagicDuck/grug-far.nvim',
  cmd = 'GrugFar',
  opts = {},
  keys = {
    {
      '<leader>sR',
      function() require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } } end,
      desc = '[S]earch and [R]eplace in project',
    },
  },
}
