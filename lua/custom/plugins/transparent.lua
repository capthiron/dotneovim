return {
  'xiyaowong/transparent.nvim',
  -- Must load at startup so the persisted on/off state is applied on VimEnter.
  lazy = false,
  opts = {
    -- clear_prefix('NeoTree') would clear these even while transparency is off.
    extra_groups = {
      'NeoTreeNormal',
      'NeoTreeNormalNC',
      'NeoTreeEndOfBuffer',
      'RenderMarkdownCode',
      'RenderMarkdownCodeBorder',
    },
  },
  keys = {
    { '<leader>tt', '<cmd>TransparentToggle<CR>', desc = '[T]oggle [t]ransparent background' },
  },
}
