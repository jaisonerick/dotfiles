return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
    keys = { "<C-p>", "<leader>ps", "<leader>k", "<leader>bl", "<leader>vh", "<leader>vh" },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_config = {
            anchor = "S",
            height = 20
          },
          mappings = {
            i = {
              ["<C-k>"] = "move_selection_previous", 
              ["<C-j>"] = "move_selection_next", 
              ["<C-o>"] = "select_default", 
              ["<C-v>"] = "select_vertical", 
              ["<C-s>"] = "select_horizontal", 
            }
          }
        }
      })
      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.live_grep({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set('n', '<leader>k', function()
        builtin.grep_string({ word_match = '-w' })
      end)
      vim.keymap.set('n', '<leader>bl', builtin.buffers, {})
      vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
      vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
  }
}
