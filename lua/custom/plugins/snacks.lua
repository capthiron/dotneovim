return {
  'folke/snacks.nvim',
  opts = {
    -- Notes only: by default the pad inherits the current buffer's filetype
    -- (and with it LSP and format-on-save).
    scratch = { ft = 'markdown' },
    -- The scratch style maps NormalFloat to Normal, which transparent.nvim
    -- clears. Keeping NormalFloat gives the pad the theme's solid float background.
    styles = { scratch = { wo = { winhighlight = 'NormalFloat:NormalFloat' } } },
  },
  keys = {
    -- Scratch pads persist per cwd + git branch; a count opens another one (2<leader>.).
    { '<leader>.', function() Snacks.scratch() end, desc = 'Toggle scratch buffer' },
    { '<leader>S', function() Snacks.scratch.select() end, desc = 'Select scratch buffer' },
  },
}
