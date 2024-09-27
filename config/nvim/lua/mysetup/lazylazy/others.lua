return  {
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end
  },
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
  },
  {
    "junegunn/vim-easy-align",
    config = function()
      vim.cmd([[
      xmap ga <Plug>(EasyAlign)
      nmap ga <Plug>(EasyAlign)
      ]])
    end
  }
}
