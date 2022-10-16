local u = require("utils")

local M = {}

local common = require("lsp.common")

-- sets up rust_analyzer
function M.setup()
  require("rust-tools").setup({ 
    server = {
      on_attach = common.on_attach,
      capabilities = common.capabilities,
    },
  })

end

return M
