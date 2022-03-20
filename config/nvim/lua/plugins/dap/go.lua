local M = {}

-- should work out of the box if dlv is in $PATH
function M.setup()
  require("dap-go").setup()
end

return M
