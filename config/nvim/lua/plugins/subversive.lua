local u = require("utils")

local opts = { noremap = false }

-- = to substitute (replace with register contents)
u.nmap("=", "<Plug>(SubversiveSubstitute)", opts)
u.xmap("==", "<Plug>(SubversiveSubstituteLine)", opts)
-- u.nmap("S", "<Plug>(SubversiveSubstituteToEndOfLine)", opts)

-- + to substitute word in 1st motion over 2nd motion
u.nmap("+", "<Plug>(SubversiveSubstituteRange)", opts)
u.xmap("+", "<Plug>(SubversiveSubstituteRange)", opts)
-- substitute current word over motion
u.nmap("++", "<Plug>(SubversiveSubstituteWordRange)", opts)

