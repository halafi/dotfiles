local nvim_lsp = require('lspconfig')
local filetypes = {
  typescript = {'stylelint'},
  typescriptreact = {'stylelint'},
}
local linters = {
  stylelint = {
    sourceName = 'stylelint',
    command = 'stylelint',
    args = {'--formatter', 'compact', '%filepath'},
    rootPatterns = {'.stylelintrc'},
    debounce = 100,
    formatPattern = {
      [[: line (\d+), col (\d+), (warning|error) - (.+?) \((.+)\)]],
      {
        line = 1,
        column = 2,
        security = 3,
        message = {4, ' [', 5, ']'},
      },
    },
    securities = {
      warning = 'warning',
      error = 'error',
    },
  },
}

local formatters = {
  stylelint = {
    command = 'stylelint',
    args = {'--fix', '--stdin', '--stdin-filename', '%filepath'},
  }
}

local formatFiletypes = {
  typescript = {'stylelint'},
  typescriptreact = {'stylelint'},
}

nvim_lsp.diagnosticls.setup {
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
    formatters = formatters,
    formatFiletypes = formatFiletypes,
  }
}
