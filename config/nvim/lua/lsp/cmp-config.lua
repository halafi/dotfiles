local lspkind = require('lspkind')
local cmp = require'cmp'

cmp.setup {
      snippet = {
         expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
         end,
      },
      mapping = {
          ['<C-g>'] = cmp.mapping(function(fallback)
        vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
      end),
           ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
           ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
           ['<C-l>'] = cmp.mapping.complete(),
           ['<ESC>'] = cmp.mapping.close(),
           ['<TAB>'] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Insert,
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
         { name = "vsnip", keyword_length = 2, priority = 9998 },
         { name = "path", keyword_length = 3 },
         { name = "nvim_lsp", keyword_length = 3 },
         { name = "buffer" , keyword_length = 5 },
         -- { name = 'copilot', priority = 9999 }
      },
      experimental = {
         -- ghost_text = true
         -- ghost_text = false -- this feature conflict to the copilot.vim's preview.
      }
}
