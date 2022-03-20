local M = {}

function M.setup()
  -- https://github.com/simrat39/rust-tools.nvim#a-better-debugging-experience
-- /Users/filiphalas/.vscode/extensions/vadimcn.vscode-lldb-1.7.0
  -- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
  local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "codelldb/"
  -- local codelldb_path = extension_path .. "adapter/codelldb"
  -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  local codelldb_path = dbg_path .. "extension/adapter/codelldb"
  local liblldb_path = dbg_path .. "extension/lldb/lib/liblldb.so"
  local opts = {
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
  require("rust-tools").setup { opts }
end

return M
