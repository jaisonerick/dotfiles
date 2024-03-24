-- vim.g.fzf_preview_default_fzf_options = {
--   '--layout' = 'default',
--   '--preview-window' = 'wrap',
--   '--info' = 'hidden'
-- }
--
--
-- vim.g.fzf_preview_direct_window_option = 'horizontal belowright 20new'
-- vim.g.fzf_preview_default_fzf_options = '--layout=default --preview-window=wrap --info=hidden'
-- vim.g.fzf_preview_direct_window_option = 'horizontal belowright 20new'

-- FZF
vim.keymap.set({'n', 'x'}, '<c-p>', "<cmd>lua require('fzf-lua').files()<CR>", { silent = true, desc = 'Search files'})
vim.keymap.set('n', '<leader>k', "<cmd>lua require('fzf-lua').grep_cword()<CR>", { silent = true, desc = 'Search current word'})
vim.keymap.set('n', '<leader>bl', "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true, desc = 'Search buffers'})
vim.keymap.set('n', '<leader>gs', "<cmd>lua require('fzf-lua').git_status()<CR>", { silent = true, desc = 'Search git status'})
