local u = require("utils")

vim.g.yoinkMoveCursorToEndOfPaste = true
vim.g.yoinkIncludeDeleteOperations = true

local opts = { noremap = false }

u.nmap("p", "<plug>(YoinkPaste_p)", opts)
u.nmap("P", "<plug>(YoinkPaste_P)", opts)

u.nmap("gp", "<plug>(YoinkPaste_gp)", opts)
u.nmap("gP", "<plug>(YoinkPaste_gP)", opts)

u.nmap("[y", "<Plug>(YoinkPostPasteSwapBack)", opts)
u.nmap("]y", "<Plug>(YoinkPostPasteSwapForward)", opts)

u.nmap("y", "<Plug>(YoinkYankPreserveCursorPosition)", opts)
u.xmap("y", "<Plug>(YoinkYankPreserveCursorPosition)", opts)

u.nmap("<c-=>", "<plug>(YoinkPostPasteToggleFormat)", opts)
