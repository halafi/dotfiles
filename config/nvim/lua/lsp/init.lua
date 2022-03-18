local u = require("utils")

local lsp = vim.lsp

local border_opts = { border = "single", focusable = false, scope = "line" }

vim.diagnostic.config({ virtual_text = false, float = border_opts })

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

local api = vim.api

-- null-ls seems better than eslint atm
-- local preferred_formatting_clients = { "eslint" }
local preferred_formatting_clients = { "null-ls" }
local fallback_formatting_client = "null-ls"

-- prevent repeated lookups
local buffer_client_ids = {}

_G.formatting = function(bufnr)
    bufnr = tonumber(bufnr) or api.nvim_get_current_buf()

    local selected_client
    if buffer_client_ids[bufnr] then
        selected_client = lsp.get_client_by_id(buffer_client_ids[bufnr])
    else
        for _, client in ipairs(lsp.buf_get_clients(bufnr)) do
            if vim.tbl_contains(preferred_formatting_clients, client.name) then
                selected_client = client
                break
            end

            if client.name == fallback_formatting_client then
                selected_client = client
            end
        end
    end

    if not selected_client then
        return
    end

    buffer_client_ids[bufnr] = selected_client.id

    local params = lsp.util.make_formatting_params()
    selected_client.request("textDocument/formatting", params, function(err, res)
        if err then
            local err_msg = type(err) == "string" and err or err.message
            vim.notify("global.lsp.formatting: " .. err_msg, vim.log.levels.WARN)
            return
        end

        if not api.nvim_buf_is_loaded(bufnr) or api.nvim_buf_get_option(bufnr, "modified") then
            return
        end

        if res then
            lsp.util.apply_text_edits(res, bufnr, selected_client.offset_encoding or "utf-16")
            api.nvim_buf_call(bufnr, function()
                vim.cmd("silent noautocmd update")
            end)
        end
    end, bufnr)
end


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

  if client.supports_method("textDocument/formatting") then
      vim.cmd([[
      augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePost <buffer> lua formatting(vim.fn.expand("<abuf>"))
      augroup END
      ]])
  end

  require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- npm i -g vscode-langservers-extracted
-- TODO: pyright = {}, rust_analyzer = {}, when needed
local servers = { 'eslint', 'jsonls', 'null-ls', 'tsserver', 'sumneko_lua', 'gopls', 'html' }

for _, server in ipairs(servers) do
  require("lsp." .. server).setup(on_attach, capabilities)
end
