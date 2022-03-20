local M = {}

function M.setup()
  local dap_install = require "dap-install"
  dap_install.config("codelldb", {}) -- loads default config
end

return M
