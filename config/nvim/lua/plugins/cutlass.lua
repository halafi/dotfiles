local u = require("utils")

local opts = { noremap = true }

-- m to "cut" (original delete operation)
u.nmap("m", "d", opts)
u.xmap("m", "d", opts)
u.nmap("mm", "dd", opts)
u.nmap("M", "D", opts)

-- gm for marks
u.nmap("gm", "m", opts)
