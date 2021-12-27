local nvim_lsp = require('lspconfig')
local null_ls = require("null-ls")

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = false
--     }
-- )
-- customization
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

  buf_map(bufnr, "n", "<leader>f", ":LspFormatting<CR>")
  buf_map(bufnr, "n", "gd", ":LspDef<CR>")
  buf_map(bufnr, "n", "gi", ":LspImplementation<CR>")
  buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
  buf_map(bufnr, "n", "<leader>rn", ":LspRename<CR>")

  buf_map(bufnr, "n", "K", ":LspHover<CR>")
  buf_map(bufnr, "n", "[d", ":LspDiagPrev<CR>")
  buf_map(bufnr, "n", "]d", ":LspDiagNext<CR>")

  buf_map(bufnr, "n", "gR", ":LspRefs<CR>")
  buf_map(bufnr, "n", "ca", ":LspCodeAction<CR>")
  buf_map(bufnr, "n", "<leader>d", ":LspDiagLine<CR>")
  buf_map(bufnr, "i", "<C-k>", "<cmd> LspSignatureHelp<CR>")

  if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

nvim_lsp.tsserver.setup{
    on_attach = function(client, bufnr)
        -- prettier
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)

        -- buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "<leader>refi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "<leader>ic", ":TSLspImportCurrent<CR>")
        buf_map(bufnr, "n", "<leader>ia", ":TSLspImportAll<CR>")

        on_attach(client, bufnr)
    end,
}

null_ls.setup({
  sources = {
    -- builtins.formatting.black.with({ extra_args = { "--fast" } }),
	  -- builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettier,
    -- stylelint diagnostics / formatting do not work well, need to migrate to stylelint 14
    -- null_ls.builtins.diagnostics.stylelint.with({
    --   filetypes = { "scss", "less", "css", "sass", "typescriptreact", "typescript" },
    --   command = "stylelint",
    --   args = { "--formatter", "json", "$FILENAME" },
    -- }),
    -- null_ls.builtins.code_actions.gitsigns
  },
})

-- nvim_lsp["null-ls"].setup({
  -- on_attach = on_attach,
-- })

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in ipairs(servers) do
  -- nvim_lsp[lsp].setup {
    -- on_attach = on_attach,
    -- flags = {
      -- debounce_text_changes = 150,
    -- }
  -- }
-- end


