local api = vim.api

local get_map_options = function(custom_options)
    local options = { silent = true }
    if custom_options then
        options = vim.tbl_extend("force", options, custom_options)
    end
    return options
end

local M = {}

M.map = function(mode, target, source, opts)
    vim.keymap.set(mode, target, source, get_map_options(opts))
end

for _, mode in ipairs({ "n", "o", "i", "x", "t", "c" }) do
    M[mode .. "map"] = function(...)
        M.map(mode, ...)
    end
end

M.buf_map = function(bufnr, mode, target, source, opts)
    opts = opts or {}
    opts.buffer = bufnr

    M.map(mode, target, source, get_map_options(opts))
end

M.command = function(name, fn, opts)
    api.nvim_create_user_command(name, fn, opts or {})
end

M.lua_command = function(name, fn)
    M.command(name, "lua " .. fn)
end

M.buf_command = function(bufnr, name, fn, opts)
    api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

M.t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.gfind = function(str, substr, cb, init)
    init = init or 1
    local start_pos, end_pos = str:find(substr, init)
    if start_pos then
        cb(start_pos, end_pos)
        return M.gfind(str, substr, cb, end_pos + 1)
    end
end

M.input = function(keys, mode)
    api.nvim_feedkeys(M.t(keys), mode or "m", true)
end

M.warn = function(msg)
    api.nvim_echo({ { msg, "WarningMsg" } }, true, {})
end

M.is_file = function(path)
    if path == "" then
        return false
    end

    local stat = vim.loop.fs_stat(path)
    return stat and stat.type == "file"
end

M.make_floating_window = function(custom_window_config, height_ratio, width_ratio)
    height_ratio = height_ratio or 0.95
    width_ratio = width_ratio or 0.95

    local height = math.ceil(vim.opt.lines:get() * height_ratio)
    local width = math.ceil(vim.opt.columns:get() * width_ratio)
    local window_config = {
        relative = "editor",
        style = "minimal",
        border = "double",
        width = width,
        height = height,
        row = width / 2,
        col = height / 2,
    }
    window_config = vim.tbl_extend("force", window_config, custom_window_config or {})

    local bufnr = api.nvim_create_buf(false, true)
    local winnr = api.nvim_open_win(bufnr, true, window_config)
    return winnr, bufnr
end

M.get_system_output = function(cmd)
    return vim.split(vim.fn.system(cmd), "\n")
end

return M
