local u = require("utils")

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        bufnr = bufnr,
    })
end

local M = {
  on_attach = function(client, bufnr)
    -- commands
    u.buf_command(bufnr, "LspDef", vim.lsp.buf.definition)
    u.buf_command(bufnr, "LspHover", vim.lsp.buf.hover)
    u.buf_command(bufnr, "LspRename", vim.lsp.buf.rename)
    u.buf_command(bufnr, "LspRefs", vim.lsp.buf.references)
    u.buf_command(bufnr, "LspTypeDef", vim.lsp.buf.type_definition)
    u.buf_command(bufnr, "LspImplementation", vim.lsp.buf.implementation)
    u.buf_command(bufnr, "LspDiagPrev", vim.diagnostic.goto_prev)
    u.buf_command(bufnr, "LspDiagNext", vim.diagnostic.goto_next)
    u.buf_command(bufnr, "LspDiagLine", vim.diagnostic.open_float)
    u.buf_command(bufnr, "LspSignatureHelp", vim.lsp.buf.signature_help)
    u.buf_command(bufnr, "LspDiagQuickfix", vim.diagnostic.setqflist)

    -- bindings
    u.buf_map(bufnr, "n", "ga", function()
        vim.lsp.buf.code_action() -- range
    end)
    u.buf_map(bufnr, "n", "gi", ":LspRename<CR>")
    u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    u.buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    -- u.buf_map(bufnr, "n", "gi", ":LspImplementation<CR>")
    u.buf_map(bufnr, "n", "gR", ":LspRefs<CR>")
    u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
    u.buf_map(bufnr, "n", "[d", ":LspDiagPrev<CR>")
    u.buf_map(bufnr, "n", "]d", ":LspDiagNext<CR>")
    u.buf_map(bufnr, "n", "<leader>d", ":LspDiagLine<CR>")
    u.buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    -- fixes
    u.buf_map(bufnr, "n", "<Leader>q", ":LspDiagQuickfix<CR>")

    if client.supports_method("textDocument/formatting") then
        local formatting_cb = function()
            lsp_formatting(bufnr)
        end
        u.buf_command(bufnr, "LspFormatting", formatting_cb)
        u.buf_map(bufnr, "n", "<leader>f", formatting_cb)
    end

    require("illuminate").on_attach(client)
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities()
}

return M;
