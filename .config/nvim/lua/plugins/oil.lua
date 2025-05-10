return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    float = {
      padding = 2,
      max_width = 0.4,
      max_height = 0.4,
    },
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  lazy = false,
}
