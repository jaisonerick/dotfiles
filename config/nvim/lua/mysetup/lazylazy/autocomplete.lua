return {
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
            { name = 'buffer' },
          }),
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.confirm({select = false}),
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
          ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),

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
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
      })
    end
  }
}
