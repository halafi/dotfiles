local lspkind = require('lspkind')
local cmp = require'cmp'

cmp.setup {
      snippet = {
         expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
         end,
      },
      mapping = {
           ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
           ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
           ['<C-l>'] = cmp.mapping.complete(),
           ['<ESC>'] = cmp.mapping.close(),
           ['<TAB>'] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Replace,
             select = true,
           }),
           ['<enter>'] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Replace,
             select = true,
           })
      },
      formatting = {
         format = lspkind.cmp_format {
            with_text = true,
            menu = {
               buffer   = "[buf]",
               nvim_lsp = "[LSP]",
               path     = "[path]",
            },
         },
      },
      sources = {
         { name = "nvim_lsp"},
         { name = "path" },
         { name = "buffer" , keyword_length = 5},
         { name = "vsnip", priority = 9999 },

      },
      experimental = {
         ghost_text = true
      }
}
