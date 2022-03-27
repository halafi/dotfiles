local u = require("utils")

local M = {}

local common = require("lsp.common")

-- sets up rust_analyzer
function M.setup()
  -- https://github.com/simrat39/rust-tools.nvim#a-better-debugging-experience
-- /Users/filiphalas/.vscode/extensions/vadimcn.vscode-lldb-1.7.0
  -- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
  -- local codelldb_path = extension_path .. "adapter/codelldb"
  -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

  -- debugging
  -- local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "codelldb/"
  -- local codelldb_path = dbg_path .. "extension/adapter/codelldb"
  -- local liblldb_path = dbg_path .. "extension/lldb/lib/liblldb.so"

  require("rust-tools").setup({ 
    server = {
      on_attach = common.on_attach,
      capabilities = common.capabilities,
    },
    -- dap = {
    --   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    -- },
  })

end

return M
