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
        { section = 'keys', padding = 1 },
        { section = 'recent_files', padding = 1 },
        { section = 'projects', padding = 1 },
        { section = 'startup', padding = 1 },
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
