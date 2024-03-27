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
    keys = {
      { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
      { "<leader>n", "<cmd>Neotree filesystem reveal<cr>", desc = "Neotree" }
    },
    config = function()
       -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      require('neo-tree').setup({
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "",-- this can only be used in the git_status source
              renamed   = "",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            }
          },
        },

        window = {
          position = "left",
          width = 40,
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
            ["r"] = "refresh",
          }
        },
        filesystem = {
          hide_gitignored = false,
          use_libuv_file_watcher = false,
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
      })
    end,
  }
}
