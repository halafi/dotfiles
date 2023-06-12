local u = require("utils")

require("lspsaga").setup({
    ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "💡",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        kind = {},
      },
      lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    }
    -- preview = {
    --     lines_above = 0,
    --     lines_below = 10,
    -- },
    -- scroll_preview = {
    --     scroll_down = "<C-f>",
    --     scroll_up = "<C-b>",
    -- },
    -- request_timeout = 2000
})

