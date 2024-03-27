vim.keymap.set('n', '<leader><leader>', '<C-^>', {desc = 'Switch between the last two files'})

vim.keymap.set('i', 'jj', '<Esc>', {desc='Exit insert with jj'})

vim.keymap.set('n', '<leader>-', '<cmd>wincmd _<cr><cmd>wincmd |<cr>', {desc='Zoom in current pane'})
vim.keymap.set('n', '<leader>=', '<cmd>wincmd =<cr>', {desc='Zoom out current pane'})

-- Buffer navigation
vim.keymap.set('n', '<leader>a', '<cmd>bnext<CR>', {desc='Move to the next buffer'})
vim.keymap.set('n', '<leader>z', '<cmd>bprevious<CR>', {desc='Move to the previous buffer'})
vim.keymap.set('n', '<leader>bq', '<cmd>bp <BAR> bd #<CR>', {desc='Close the current buffer and move to the previous one'})

-- 'vim-test/vim-test'
-- Test configurations
vim.keymap.set('n', '<Leader>t', '<cmd>TestFile<CR>')
vim.keymap.set('n', '<Leader>s', '<cmd>TestNearest<CR>')
vim.keymap.set('n', '<Leader>l', '<cmd>TestLast<CR>')
vim.keymap.set('n', '<leader>gt', '<cmd>TestVisit<CR>')


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<leadeR>y", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "cp", [["+y]])
vim.keymap.set("n", "cP", [["+Y]])
