local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup {
      snippet = {
         expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
         end,
      },
      mapping = {
      --     ['<C-g>'] = cmp.mapping(function(fallback)
      --   vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
      -- end),
           ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
           ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
           ['<C-l>'] = cmp.mapping.complete(),
           ['<ESC>'] = cmp.mapping.close(),
           ['<TAB>'] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Insert,
             select = true,
           }),
           ['<enter>'] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Insert,
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
         { name = "vsnip", priority = 9999 },
         { name = "path", keyword_length = 3 },
         { name = "nvim_lsp", keyword_length = 3 },
         { name = "buffer" , keyword_length = 5 },
         -- { name = 'copilot', priority = 9999 }
      },
      -- experimental = {
         -- ghost_text = true
         -- ghost_text = false -- this feature conflict to the copilot.vim's preview.
      -- }
}

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--  mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--       -- { name = 'nvim_lsp', priority = 9999, keyword_length = 3 },
--       { name = 'buffer' },
--     }
-- })

cmp.setup.cmdline({ '/', '?' }, {
  sources = cmp.config.sources({
   -- { name = 'nvim_lsp', priority = 9999, keyword_length = 3 },
    { name = 'buffer' }
  })
})
