local u = require("utils")

local api = vim.api

-- shared
local send_tmux_cmd = function(cmd)
    local stdout = vim.split(vim.fn.system("tmux " .. cmd), "\n")
    return stdout, vim.v.shell_error
end

local get_pane_id = function()
    return send_tmux_cmd('display-message -p "#{pane_id}"')[1]
end

local M = {}

-- move between tmux splits and neovim windows
local tmux_directions = { h = "L", j = "D", k = "U", l = "R" }

local send_move_cmd = function(direction)
    send_tmux_cmd("selectp -" .. tmux_directions[direction])
end

M.move = function(direction)
    local current_win = api.nvim_get_current_win()
    vim.cmd("wincmd " .. direction)

    if api.nvim_get_current_win() == current_win then
        send_move_cmd(direction)
    end
end

u.nmap("<C-h>", ":lua require'tmux'.move('h')<CR>")
u.nmap("<C-j>", ":lua require'tmux'.move('j')<CR>")
u.nmap("<C-k>", ":lua require'tmux'.move('k')<CR>")
u.nmap("<C-l>", ":lua require'tmux'.move('l')<CR>")

-- send commands to linked tmux pane
local linked_pane_id, last_cmd

local pane_is_valid = function()
    if not linked_pane_id then
        return false
    end

    local _, status = send_tmux_cmd("has-session -t " .. linked_pane_id)
    if status > 0 then
        return false
    end

    return true
end

local send_raw_keys = function(keys)
    send_tmux_cmd(string.format("send-keys -t %s %s", linked_pane_id, keys))
end

local send_keys = function(keys)
    send_raw_keys(string.format('"%s" Enter', keys))
end

M.send_command = function(cmd)
    cmd = cmd or vim.fn.input("command: ", "", "shellcmd")
    if not cmd or cmd == "" then
        return
    end

    if not pane_is_valid() then
        local nvim_pane_id = get_pane_id()

        send_tmux_cmd("split-window -p 20")
        linked_pane_id = get_pane_id()

        send_tmux_cmd("select-pane -t " .. nvim_pane_id)
    else
        send_raw_keys("C-c")
    end

    send_keys(cmd)
    last_cmd = cmd
end

M.send_last_command = function()
    M.send_command(last_cmd)
end

M.kill = function()
    if not pane_is_valid() then
        return
    end

    send_tmux_cmd("kill-pane -t " .. linked_pane_id)
end

M.run_file = function(ft)
    ft = ft or vim.bo.ft
    local cmd
    if ft == "javascript" then
        cmd = "node"
    end
    if ft == "go" then
        cmd ="go run"
    end
    if ft == "elixir" then
        cmd ="elixir"
    end
    if ft == "rust" then
        cmd =("cargo build && cargo run")
        --
        -- local binary_name = vim.fn.expand("%:r")
        -- cmd =("rustc " .. api.nvim_buf_get_name(0) .. " && " .. binary_name)
        M.send_command(cmd)
        return
    end
    assert(cmd, "no command found for filetype " .. ft)

    M.send_command(cmd .. " " .. api.nvim_buf_get_name(0))
end

u.nmap("<Leader>tn", ":lua require'tmux'.send_command()<CR>")
u.nmap("<Leader>tt", ":lua require'tmux'.send_last_command()<CR>")
u.nmap("<Leader>tr", ":lua require'tmux'.run_file()<CR>")

-- automatically kill pane on exit
vim.cmd("autocmd VimLeave * silent! lua require'tmux'.kill()")

-- testing wrappers
local test_commands = {
    file = {
        lua = "FILE=%s make test-file",
        typescript = "npx jest -c apps/app/jest.config.js %s --watch",
        typescriptreact = "npx jest -c apps/app/jest.config.js %s --watch",
        elixir = "mix test %s",
    },
    suite = {
        lua = "make test",
        typescript = "npx nx run app:test-all",
        typescriptreact = "npx nx run app:test-all",
        elixir = "mix test",
    },
}

M.test = function()
    local test_command = test_commands.file[vim.bo.ft]
    assert(test_command, "no test command found for filetype " .. vim.bo.ft)

    M.send_command(string.format(test_command, api.nvim_buf_get_name(0)))
end

M.test_suite = function()
    M.send_command(test_commands.suite[vim.bo.ft])
end

u.nmap("<Leader>tf", ":lua require'tmux'.test()<CR>")
u.nmap("<Leader>ts", ":lua require'tmux'.test_suite()<CR>")

return M
