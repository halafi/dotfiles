local null_ls = require("null-ls")

local sources = {
  -- builtins.formatting.black.with({ extra_args = { "--fast" } }),
  -- builtins.diagnostics.flake8,
  -- null_ls.builtins.diagnostics.eslint_d,
  -- null_ls.builtins.code_actions.eslint_d,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.diagnostics.tsc,
  -- null_ls.builtins.code_actions.gitsigns,
}

local M = {}

M.setup = function(on_attach)
    null_ls.setup({
        -- debug = true,
        sources = sources,
        on_attach = on_attach,
    })
end

return M

