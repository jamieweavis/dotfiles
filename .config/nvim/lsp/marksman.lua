-- marksman — https://github.com/artempyanykh/marksman
-- Binary from Homebrew. Loaded by vim.lsp.enable in lua/plugins/lsp.lua.

return {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown', 'markdown.mdx' },
  root_markers = { '.marksman.toml', '.git' },
}
