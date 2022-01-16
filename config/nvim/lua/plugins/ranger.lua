local u = require("utils")

vim.g.ranger_map_keys = 0

-- new tab not working
u.nmap("<leader>r", ":RangerNewTab<CR>")
