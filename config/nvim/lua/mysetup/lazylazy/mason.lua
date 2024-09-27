return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "emmet_ls", "tailwindcss", "prismals", "rust_analyzer", "clangd", "asm_lsp" },
        handers = {
          function(server)
            require('lspconfig')[server].setup({
              capabilities = capabilities
            })
          end
        }
      })
    end
  }
}


