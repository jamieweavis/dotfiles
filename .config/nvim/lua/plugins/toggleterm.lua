return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'float',
    open_mapping = [[<leader>=]],
    float_opts = {
      border = 'curved',
      width = function()
        return math.floor(vim.o.columns * 0.7)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.7)
      end,
    },
  },
}
