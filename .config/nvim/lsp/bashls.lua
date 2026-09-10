-- bash-language-server — https://github.com/bash-lsp/bash-language-server
-- Binary from Homebrew. Loaded by vim.lsp.enable in lua/plugins/lsp.lua.

return {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' },
  root_markers = { '.git' },
  settings = {
    bashIde = {
      -- Non-recursive on purpose. The upstream default is '**/*@(...)', which makes
      -- the server walk the whole home directory if you open a stray ~/foo.sh.
      globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
    },
  },
}
