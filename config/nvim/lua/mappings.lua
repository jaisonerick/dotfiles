vim.keymap.set('n', '<leader><leader>', '<C-^>', {desc = 'Switch between the last two files'})

vim.keymap.set('i', 'jj', '<Esc>', {desc='Exit insert with jj'})

vim.keymap.set('n', '<leader>-', '<cmd>wincmd _<cr><cmd>wincmd |<cr>', {desc='Zoom in current pane'})
vim.keymap.set('n', '<leader>=', '<cmd>wincmd =<cr>', {desc='Zoom out current pane'})

-- Buffer navigation
vim.keymap.set('n', '<leader>a', '<cmd>bnext<CR>', {desc='Move to the next buffer'})
vim.keymap.set('n', '<leader>z', '<cmd>bprevious<CR>', {desc='Move to the previous buffer'})
vim.keymap.set('n', '<leader>bq', '<cmd>bp <BAR> bd #<CR>', {desc='Close the current buffer and move to the previous one'})
vim.keymap.set('n', '<leader>ba', '<cmd>BufOnly<CR>', {desc='Close all buffers but the current'})

-- Plugins Mapping

-- 'vim-test/vim-test'
-- Test configurations
vim.keymap.set('n', '<Leader>t', '<cmd>TestFile<CR>')
vim.keymap.set('n', '<Leader>s', '<cmd>TestNearest<CR>')
vim.keymap.set('n', '<Leader>l', '<cmd>TestLast<CR>')
vim.keymap.set('n', '<leader>gt', '<cmd>TestVisit<CR>')

-- 'scrooloose/nerdtree'
-- Open NerdTree
vim.keymap.set('', '<C-n>', '<cmd>NvimTreeToggle<CR>')
-- Open NERDTree on current file
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>')

-- 'majutsushi/tagbar'
-- vim.keymap.set('n', '<c-t>', '<cmd>TagbarToggle<cr>')

-- 'christoomey/vim-tmux-runner'
-- VTR Mappings
vim.keymap.set('n', '<leader>va', '<cmd>VtrAttachToPane<cr>')
vim.keymap.set('n', '<leader>or', '<cmd>VtrOpenRunner<cr>')
vim.keymap.set('n', '<leader>fr', '<cmd>VtrFocusRunner<cr>')
