return {
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")

      local cmp = require('cmp')

      cmp.setup({
        sources = cmp.config.sources({
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'nvim_lsp_signature_help' },
        }, {
          { name = 'buffer' },
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = {'menu', 'abbr', 'kind' },
          format = function(entry, vim_item)
            vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
          end
        },
        mapping = {
          ['<C-y>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
          ['<C-e>'] = cmp.mapping.abort(),

          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({behavior = 'insert'})
            else
              cmp.complete()
            end
          end),

          ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item({behavior = 'insert'})
            else
              cmp.complete()
            end
          end),

          ["<C-u>"] = cmp.mapping.select_prev_item({behavior = 'select', count = 4}),
          ["<C-d>"] = cmp.mapping.select_next_item({behavior = 'select', count = 4}),
          ["U"] = cmp.mapping.scroll_docs(-4),
          ["D"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete()
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
    end
  }
}
