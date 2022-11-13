local u = require("utils")

-- close = {"<Esc>", "q"},
-- goto_location = "<Cr>",
-- focus_location = "o",
-- hover_symbol = "<C-space>",
-- toggle_preview = "K",
-- rename_symbol = "r",
-- code_actions = "a",
-- fold = "h",
-- unfold = "l",
-- fold_all = "W",
-- unfold_all = "E",
-- fold_reset = "R",

require("symbols-outline").setup()

u.nmap("<Leader>s", ":SymbolsOutline<CR>")


