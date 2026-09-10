vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'

vim.cmd.colorscheme 'vscode-dark-2026'

require 'lazy-bootstrap'
require 'lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
