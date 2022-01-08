local autopairs = require("nvim-autopairs")
local u = require("utils")

autopairs.setup({
    check_ts = true,
    map_cr = true,
    -- fast_wrap = {
    --     map = "<M-e>",
    -- },
})

local disabled = false
local enable = function()
    autopairs.enable()
    disabled = false
end
local disable = function()
    autopairs.disable()
    disabled = true
end

global.toggle_autopairs = function()
    if disabled then
        print("autopairs enabled")
        enable()
        return
    end

    print("autopairs disabled")
    disable()
    vim.cmd("autocmd InsertLeave * ++once lua global.reset_autopairs()")
end

global.reset_autopairs = function()
    if disabled then
        enable()
    end
end

-- toggle pair completion
u.nmap("<M-p>", "<cmd> lua global.toggle_autopairs()<CR>")
u.imap("<M-p>", "<cmd> lua global.toggle_autopairs()<CR>")

