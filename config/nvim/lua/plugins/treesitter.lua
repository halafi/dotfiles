require'nvim-treesitter.configs'.setup {
  textsubjects = {
      enable = true,
      keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
      }
  },
  autotag = { enable = true },
  matchup = { enable = true },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "svelte",
    "html",
    "scss",
    "prisma",
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
