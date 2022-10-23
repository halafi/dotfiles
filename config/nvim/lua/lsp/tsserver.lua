local u = require("utils")

local M = {}

M.setup = function(on_attach, capabilities)
    require("typescript").setup({
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            u.buf_map(bufnr, "n", "gO", ":TypescriptAddMissingImports<CR>")
            -- u.buf_map(bufnr, "n", "gO", ":TypescriptOrganizeImports<CR>")
            u.buf_map(bufnr, "n", "gI", ":TypescriptRenameFile<CR>")
            -- u.buf_map(bufnr, "n", "gd", ":TypescriptGoToSourceDefinition<CR>")
        end,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    })
end

return M
