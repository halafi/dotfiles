local u = require("utils")

local api = vim.api

local split = function(direction)
    vim.cmd("wincmd " .. direction)
    return api.nvim_get_current_win()
end

-- terminals
-- always start in insert mode
vim.cmd("autocmd TermOpen * startinsert")
-- disable line numbers
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
-- suppress process exited message
vim.cmd("autocmd TermClose term://*lazygit execute 'bdelete! ' . expand('<abuf>')")
vim.cmd("autocmd TermClose term://*lazydocker execute 'bdelete! ' . expand('<abuf>')")
vim.cmd("autocmd TermClose term://*btm execute 'bdelete! ' . expand('<abuf>')")
-- autocommands
-- highlight on yank
vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })')
-- disable continuation of comments to the next line 
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- fix .env filetype detection
vim.cmd("autocmd BufNewFile,BufRead *.env setfiletype sh")
-- fix justfile filetype
vim.cmd("autocmd BufNewFile,BufRead justfile setfiletype make")

-- scratch files
vim.cmd("command! Scratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu")

u.command("LazyGit", "tabnew term://lazygit")
u.nmap("<Leader>g", ":LazyGit<CR>")

-- not migrated to lua
local vim_commands = {}
vim_commands.defaults = {
    [[
      function! QuickFixToggle()
        if empty(filter(getwininfo(), 'v:val.quickfix'))
          copen
        else
          cclose
        endif
      endfunction
    ]],
}

vim_commands.load = function(commands)
  for _, command in ipairs(commands) do
    vim.cmd(command)
  end
end

vim_commands.load(vim_commands.defaults)

local commands = {}

-- like vsplit, but reuses existing splits
api.nvim_create_user_command("Vsplit", function(opts)
    local file = opts.args ~= "" and opts.args or vim.fn.expand("%")

    local current_window = api.nvim_get_current_win()
    -- check for right split
    local split_window = split("l")
    -- no right split; check for left split
    if split_window == current_window then
        split_window = split("h")
    end

    -- no left or right split
    if split_window == current_window then
        vim.cmd("vsplit " .. file)
        return
    end

    local bufnr = vim.fn.bufadd(file)
    api.nvim_win_set_buf(split_window, bufnr)
end, {
    nargs = 1,
    complete = "file",
})

-- same but for split
api.nvim_create_user_command("Split", function(opts)
    local file = opts.args ~= "" and opts.args or vim.fn.expand("%")

    local current_window = api.nvim_get_current_win()
    local split_window = split("k")
    if split_window == current_window then
        split_window = split("j")
    end

    -- no left or right split
    if split_window == current_window then
        vim.cmd("split " .. file)
        return
    end

    local bufnr = vim.fn.bufadd(file)
    api.nvim_win_set_buf(split_window, bufnr)
end, {
    nargs = 1,
    complete = "file",
})

-- opens matching test file
commands.edit_test_file = function(cmd)
    cmd = cmd or "edit"
    if not cmd:find("$FILE") then
        cmd = cmd .. " $FILE"
    end

    local done = function(file)
        vim.cmd(cmd:gsub("$FILE", file))
    end

    local root, ft = vim.pesc(vim.fn.expand("%:t:r")), vim.bo.filetype

    local patterns = {}
    if ft == "lua" then
        table.insert(patterns, "_spec")
    elseif ft == "typescript" or ft == "typescriptreact" then
        table.insert(patterns, "%.test")
        table.insert(patterns, "%.spec")
    end

    local final_patterns = {}
    for _, pattern in ipairs(patterns) do
        -- go from test file to non-test file
        if root:match(pattern) then
            pattern = root:gsub(vim.pesc(pattern), "")
        else
            pattern = root .. pattern
        end
        -- make sure extension matches
        pattern = pattern .. "%." .. vim.fn.expand("%:e") .. "$"
        table.insert(final_patterns, pattern)
    end

    -- check buffers first
    for _, b in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        for _, pattern in ipairs(final_patterns) do
            if b.name:match(pattern) then
                done(b.name)
                return
            end
        end
    end

    local scandir = function(path, depth, next)
        require("plenary.scandir").scan_dir_async(path, {
            depth = depth,
            search_pattern = final_patterns,
            on_exit = vim.schedule_wrap(function(found)
                if found[1] then
                    done(found[1])
                    return
                end

                if not next then
                    u.warn("test_file: corresponding file not found for file " .. vim.fn.expand("%:t"))
                    return
                end

                next()
            end),
        })
    end

    -- check same dir files first, then cwd
    scandir(vim.fn.expand("%:p:h"), 1, function()
        scandir(vim.fn.getcwd(), 5)
    end)
end

vim.cmd("command! -complete=command -nargs=* TestFileOpen lua global.commands.edit_test_file(<f-args>)")
u.nmap("<Leader>tv", ":TestFileOpen vsplit<CR>")

-- commands.open_on_github = function(count, start_line, end_line)
--     local remote = u.get_system_output("git remote -v")[1]
--     if remote == "" then
--         u.warn("not in a git repo")
--         return
--     end
--     local username, repo = remote:match(":(%S+)/(%S+)%.")
--     if not (username and repo) then
--         u.warn("failed to get repo info")
--         return
--     end
--
--     local branch = u.get_system_output("git rev-parse --abbrev-ref --symbolic-full-name HEAD")[1]
--     if branch == "HEAD" then
--         branch = u.get_system_output("git rev-parse HEAD")[1]
--     end
--     local repo_root = u.get_system_output("git rev-parse --show-toplevel")[1] .. "/"
--     local path = vim.api.nvim_buf_get_name(0):gsub(vim.pesc(repo_root), "")
--
--     local url = table.concat({ "https://", username, repo, "blob", branch, path }, "/")
--     if count > 0 then
--         local line_template = start_line == end_line and "#L%d" or "#L%d-L%d"
--         url = url .. string.format(line_template, start_line, end_line)
--     end
--
--     vim.fn.system("open " .. url)
-- end

-- vim.cmd("command! -range GBrowse lua global.commands.open_on_github(<count>, <line1>, <line2>)")

global.commands = commands

return commands

