return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = false },
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { section = 'keys', padding = 1 },
        {
          section = 'recent_files',
          icon = ' ',
          title = 'Recent Files',
          indent = 2,
          padding = 1,
        },
        {
          icon = ' ',
          title = 'Projects',
          section = 'projects',
          padding = 1,
          indent = 2,
        },
        { section = 'startup' },
      },
    },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}
