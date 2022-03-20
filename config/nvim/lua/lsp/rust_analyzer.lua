local M = {
    setup = function(on_attach, capabilities)
        local lspconfig = require("lspconfig")

        lspconfig["rust_analyzer"].setup({
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
             checkOnSave = {
                command = "clippy"
            },
        })
    end,
}


return M

