return  {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      close_if_last_window = true,
      window = {
        mappings = {
          ["o"] = { "open", nowait = true },
          ["v"] = "open_vsplit",
          ["s"] = "open_split",
          ["x"] = "close_node",
          ["m"] = { "show_help", nowait=false, config = { title = "Change", prefix_key = "m" }},
          ["md"] = "delete",
          ["mr"] = "rename",
          ["mm"] = { "move", config = { show_path = "relative" } },
          ["ma"] = "add",
        }
      },
      filesystem = {
        hide_gitignored = false,
        follow_current_file = {
          enabled = false
        },
        window = {
          mappings = {
            ["oc"] = "none",
            ["od"] = "none",
            ["og"] = "none",
            ["om"] = "none",
            ["on"] = "none",
            ["os"] = "none",
            ["ot"] = "none",
          }
        },
      },
    },
    keys = {
      { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
      { "<leader>n", "<cmd>Neotree filesystem reveal<cr>", desc = "Neotree" }
    }
  }
}
