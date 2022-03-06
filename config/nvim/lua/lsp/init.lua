local u = require("utils")
local nvim_lsp = require('lspconfig')
local null_ls = require("null-ls")

local lsp = vim.lsp
local api = vim.api

local border_opts = { border = "single", focusable = false, scope = "line" }

vim.diagnostic.config({ virtual_text = false, float = border_opts })

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

-- customization
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(client, bufnr)
  -- commands
  u.lua_command("LspDef",  "vim.lsp.buf.definition()")
  u.lua_command("LspFormatting", "vim.lsp.buf.formatting()")
  u.lua_command("LspCodeAction", "vim.lsp.buf.code_action()")
  u.lua_command("LspHover", "vim.lsp.buf.hover()")
  u.lua_command("LspRename", "vim.lsp.buf.rename()")
  u.lua_command("LspRefs", "vim.lsp.buf.references()")
  u.lua_command("LspTypeDef", "vim.lsp.buf.type_definition()")
  u.lua_command("LspImplementation", "vim.lsp.buf.implementation()")
  u.lua_command("LspDiagPrev", "vim.diagnostic.goto_prev()")
  u.lua_command("LspDiagNext", "vim.diagnostic.goto_next()")
  u.lua_command("LspDiagLine", "vim.diagnostic.open_float()")
  u.lua_command("LspSignatureHelp", "vim.lsp.buf.signature_help()")
  u.lua_command("LspDiagQuickfix", "vim.diagnostic.setqflist()")

  -- bindings
  u.buf_map(bufnr, "n", "<leader>f", ":LspFormatting<CR>")
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
  u.buf_map(bufnr, "n", "<leader>ca", ":LspCodeAction<CR>")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- npm i -g vscode-langservers-extracted
local servers = { 'eslint', 'jsonls', 'null-ls', 'tsserver', 'gopls' }

for _, server in ipairs(servers) do
  require("lsp." .. server).setup(on_attach, capabilities)
end
