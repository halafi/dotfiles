local u = require("utils")

local opts = { noremap = false }

-- s to substitute (replace with register contents)
u.nmap("s", "<Plug>(SubversiveSubstitute)", opts)
u.xmap("ss", "<Plug>(SubversiveSubstituteLine)", opts)
u.nmap("S", "<Plug>(SubversiveSubstituteToEndOfLine)", opts)

-- leader s to substitute word in 1st motion over 2nd motion
u.nmap("<leader>s", "<Plug>(SubversiveSubstituteRange)", opts)
u.xmap("<leader>s", "<Plug>(SubversiveSubstituteRange)", opts)
-- substitute current word over motion
u.nmap("<leader>ss", "<Plug>(SubversiveSubstituteWordRange)", opts)
