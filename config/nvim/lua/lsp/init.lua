local lsp = vim.lsp

local border_opts = { border = "single", focusable = false, scope = "line" }

vim.diagnostic.config({ virtual_text = false, underline = false, float = border_opts })

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

-- customization
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- <mason> TODO: use mason to install more language servers
local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
mason.setup({})
lspconfig.setup {
  ensure_installed = { 
    -- "lua_ls",
    "tailwindcss" 
  },
}
-- </ mason>

-- rust is handled by rust-tools
local servers = { 'eslint', 'jsonls', 'null-ls', 'svelte', 'tsserver', 'tailwindcss', --[[ 'sumneko_lua' ]] --[[ 'pyright' ]] 'elixir', 'gopls', 'html' }

local common = require("lsp.common")

for _, server in ipairs(servers) do
  require("lsp." .. server).setup(common.on_attach, common.capabilities)
end

