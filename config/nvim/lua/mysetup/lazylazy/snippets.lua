return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({ paths = {"./snippets"} })
      local ls = require("luasnip")
      ls.log.set_loglevel("debug")
      ls.setup({
        enable_autosnippets = true
      })

      vim.keymap.set('n', '<leader>s', function()
        require("luasnip.loaders").edit_snippet_files({
          edit = function(file)
            vim.cmd("vsp " .. file)
          end
        })
      end)

      vim.keymap.set({"i"}, "<C-V>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})
    end
  }
}
