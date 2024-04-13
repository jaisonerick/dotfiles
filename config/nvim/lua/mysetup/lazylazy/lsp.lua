return {
  {
    "j-hui/fidget.nvim",
    dependencies = {
      "neovim/nvim-lspconfig"
    },
    config = function()
      require('fidget').setup({
        notification = {
          override_vim_notify = true,
        },
        logger = {
          path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("log")),
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require('lspconfig')
      lspconfig.tsserver.setup({})
      lspconfig.emmet_ls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.prismals.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.clangd.setup({})
      lspconfig.asm_lsp.setup({})
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT'
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
              }
            },
            diagnostics = {
              globals = {'vim'},
            },
            completion = {
              callSnippet = "Replace"
            }
          })
        end,
        settings = {
          Lua = {}
        }
      })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        desc = 'LSP Actions',
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, opts)

          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)


          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)


          vim.keymap.set('n', '<leader>vnh', vim.lsp.buf.signature_help, opts)
        end
      })
    end
  }
  -- "williamboman/mason.nvim",
  -- "williamboman/mason-lspconfig.nvim",
  -- "hrsh7th/nvim-cmp",
  -- "hrsh7th/cmp-nvim-lsp",
}
