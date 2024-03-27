vim.keymap.set('n', '<leader><leader>', '<C-^>', {desc = 'Switch between the last two files'})

vim.keymap.set('i', 'jj', '<Esc>', {desc='Exit insert with jj'})

vim.keymap.set('n', '<leader>-', '<cmd>wincmd _<cr><cmd>wincmd |<cr>', {desc='Zoom in current pane'})
vim.keymap.set('n', '<leader>=', '<cmd>wincmd =<cr>', {desc='Zoom out current pane'})

-- Buffer navigation
vim.keymap.set('n', '<leader>a', '<cmd>bnext<CR>', {desc='Move to the next buffer'})
vim.keymap.set('n', '<leader>z', '<cmd>bprevious<CR>', {desc='Move to the previous buffer'})
vim.keymap.set('n', '<leader>bq', '<cmd>bp <BAR> bd #<CR>', {desc='Close the current buffer and move to the previous one'})


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>y", [["_dP]])

vim.keymap.set({"n", "v"}, "cp", [["+zy]])
vim.keymap.set("n", "cP", [["+Y]])

vim.keymap.set("n", "cv", [["+]p]])
vim.keymap.set("n", "cV", [[<cmd>pu +<cr>]])


vim.api.nvim_create_user_command('Remove', function(opts)
  local file_path = vim.fn.expand('%')

  local success, err = os.remove(file_path)
  if success then
    vim.api.nvim_buf_delete(0, {force = true})
    print("File removed: " .. file_path)
  else
    print("Error removing file: " .. err)
  end
end, { nargs = 0 })
