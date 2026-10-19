return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'BufReadPost',
  opts = {
    -- Keeps the sticky header from taking over small splits.
    max_lines = 3,
  },
}
