local M = {}

M.setup = function(on_attach, capabilities)
    require("lspconfig").svelte.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "svelte" },
        settings = {
            svelte = {
              plugin = {
                html   = { completions = { enable = true, emmet = false } },
                svelte = { completions = { enable = true, emmet = false } },
                css    = { completions = { enable = true, emmet = true  } },
              },
            },
        },
    })
end

return M
