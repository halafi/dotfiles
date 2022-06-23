local M = {
    setup = function(on_attach, capabilities)
        local lspconfig = require("lspconfig")

        lspconfig["elixirls"].setup({
            cmd = { vim.loop.os_homedir().."/.config/elixir-ls/language_server.sh" };
            on_attach = function(client, bufnr)
                client.server_capabilities.document_formatting = true
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
            settings = {
                format = {
                    enable = true,
                },
            },
        })
    end,
}

return M
