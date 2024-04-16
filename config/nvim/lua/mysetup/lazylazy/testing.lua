return {
  {
    'vim-test/vim-test',
    dependencies = { 'christoomey/vim-tmux-runner' },
    cmd = {
      "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit",
    },
    keys = {
      { '<leader>t', '<cmd>TestNearest<cr>', { silent = true } },
      { '<leader>T', '<cmd>TestFile<cr>', { silent = true } },
      { '<leader>l', '<cmd>TestLast<cr>', { silent = true } }
    },
    config = function()
      vim.g['test#strategy'] = 'vtr'
      vim.g['test#rust#cargotest#test_options'] = {
        nearest = '--nocapture -q'
      }
    end
  }
}
