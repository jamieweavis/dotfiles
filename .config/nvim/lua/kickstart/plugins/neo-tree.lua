-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    --'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    renderers = {
      file = {
        { 'indent' },
        -- { "icon" },
        {
          'container',
          content = {
            {
              'name',
              zindex = 10,
            },
            {
              'symlink_target',
              zindex = 10,
              highlight = 'NeoTreeSymbolicLinkTarget',
            },
            { 'clipboard', zindex = 10 },
            { 'bufnr', zindex = 10 },
            { 'modified', zindex = 20, align = 'right' },
            { 'diagnostics', zindex = 20, align = 'right' },
            { 'git_status', zindex = 10, align = 'right' },
            { 'file_size', zindex = 10, align = 'right' },
            { 'type', zindex = 10, align = 'right' },
            { 'last_modified', zindex = 10, align = 'right' },
            { 'created', zindex = 10, align = 'right' },
          },
        },
      },
    },
  },
}
