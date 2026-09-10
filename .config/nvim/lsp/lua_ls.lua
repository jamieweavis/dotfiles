-- lua-language-server — https://github.com/luals/lua-language-server
-- Binary from Homebrew. Loaded by vim.lsp.enable in lua/plugins/lsp.lua.
--
-- No workspace library setup here: lazydev.nvim injects the Neovim runtime and
-- plugin types on demand, which is cheaper than pulling in all of 'runtimepath'.

return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },

  -- Each nested group gets equal priority, so a .luarc.json and a .stylua.toml at
  -- different depths do not fight over which is the root.
  root_markers = {
    { '.emmyrc.json', '.luarc.json', '.luarc.jsonc' },
    { '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml' },
    { '.git' },
  },

  settings = {
    Lua = {
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
      completion = { callSnippet = 'Replace' },
    },
  },
}
