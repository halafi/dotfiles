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
    -- u.buf_map(bufnr, "n", "ga", function()
    --     vim.lsp.buf.code_action() -- range
    -- end)

    -- old
    -- u.buf_map(bufnr, "n", "gi", ":LspRename<CR>")
    -- u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    -- u.buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    -- u.buf_map(bufnr, "n", "gi", ":LspImplementation<CR>")
    -- u.buf_map(bufnr, "n", "gR", ":LspRefs<CR>")
    -- u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
    -- u.buf_map(bufnr, "n", "[d", ":LspDiagPrev<CR>")
    -- u.buf_map(bufnr, "n", "]d", ":LspDiagNext<CR>")
    -- u.buf_map(bufnr, "n", "<leader>d", ":LspDiagLine<CR>")
    -- https://github.com/nvimdev/lspsaga.nvim
    u.buf_map(bufnr, "n", "ga", "<cmd>Lspsaga code_action<CR>")
    u.buf_map(bufnr, "n", "gi", "<cmd>Lspsaga rename<CR>")
    u.buf_map(bufnr, "n", "gI", "<cmd>Lspsaga rename ++project<CR>")
    u.buf_map(bufnr, "n", "gD", "<cmd>Lspsaga peek_definition<CR>")
    u.buf_map(bufnr, "n", "gd", "<cmd>Lspsaga goto_definition<CR>")
    u.buf_map(bufnr, "n", "gT", "<cmd>Lspsaga peek_type_definition<CR>")
    u.buf_map(bufnr, "n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
    u.buf_map(bufnr, "n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
    u.buf_map(bufnr, "n", "gR", "<cmd>Lspsaga lsp_finder<CR>")
    u.buf_map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>")
    u.buf_map(bufnr, "n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    u.buf_map(bufnr, "n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    u.buf_map(bufnr, "n", "[D", function ()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    u.buf_map(bufnr, "n", "]D", function ()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)
    u.buf_map(bufnr, "n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
    u.buf_map(bufnr, "n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
    u.buf_map(bufnr, "n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
    u.buf_map(bufnr, "n", "<leader>o", "<cmd>Lspsaga outline<CR>")
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
