return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      italic = 1,
      contrast = "hard",
      invert_selection = 0
    },
    config = function(opts)
      require("gruvbox").setup(opts)

      vim.cmd("colorscheme gruvbox")
    end,
  }
}
