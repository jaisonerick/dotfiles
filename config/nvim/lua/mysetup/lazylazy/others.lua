return  {
  { 
    'numToStr/Comment.nvim',
    opts = {
      padding = true,
    },
    lazy = false
  },
  {
    "numtostr/BufOnly.nvim",
    cmd = "BufOnly",
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>ba', '<cmd>BufOnly<CR>', { noremap = true, silent = true })
    end
  }
}
