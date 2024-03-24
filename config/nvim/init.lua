-- Requirement from Lazy.vim to define leader here
vim.g.mapleader = ','

-- Requiremente from nvim-tree to disable netrw here
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('settings')
require('mappings')
-- require('coc')
require('fzf')
require('plugins.lsp')
require('plugins.autocomplete')
require('plugins.treesitter')

