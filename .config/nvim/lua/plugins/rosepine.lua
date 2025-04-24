return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    vim.cmd.colorscheme 'rose-pine-moon'
  end,
}
