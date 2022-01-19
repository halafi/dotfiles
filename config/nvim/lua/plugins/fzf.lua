local u = require("utils")

require("fzf-lua").setup({
    winopts = {
        preview = {
            scrollbar = false,
            horizontal = 'right:50%',
        },
    },
    fzf_opts = {
        ["--layout"] = "default",
    },
    files = {
        actions = {
            ["ctrl-f"] = function(selected)
                vim.cmd(string.format("edit %s | TestFile Vsplit", selected[1]))
            end,
            ["ctrl-v"] = function(selected)
                vim.cmd("Vsplit " .. selected[1])
            end,
            ["ctrl-s"] = function(selected)
                vim.cmd("Split " .. selected[1])
            end,
        },
    },
})

-- fzf
-- u.nmap('<leader>s', ':RG<cr>')
-- vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
-- vim.g.fzf_preview_command = 'bat --color=always --plain {-1}'
-- :Rg but ignore filenames
-- vim.cmd("command! -bang -nargs=* RG call fzf#vim#grep(\"rg --column --line-number --no-heading --color=always --smart-case \".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)")

-- fzf.vim-like commands
u.command("Files", "FzfLua files")
u.command("Rg", "FzfLua live_grep_resume")
u.command("BLines", "FzfLua grep_curbuf")
u.command("History", "FzfLua oldfiles")
u.command("Buffers", "FzfLua buffers")
u.command("BCommits", "FzfLua git_bcommits")
u.command("Commits", "FzfLua git_commits")
u.command("HelpTags", "FzfLua help_tags")
u.command("Colors", "FzfLua colorschemes")
u.command("Commands", "FzfLua commands")
-- u.command("ManPages", "FzfLua man_pages")

u.nmap("<c-p>", "<cmd>Files<CR>")
u.nmap("<c-b>", "<cmd>Buffers<CR>")
u.nmap("<Leader>fs", "<cmd>Rg<CR>")
u.nmap("<Leader>fo", "<cmd>History<CR>")
u.nmap("<Leader>fh", "<cmd>HelpTags<CR>")
-- u.nmap("<Leader>fl", "<cmd>BLines<CR>")
u.nmap("<Leader>fc", "<cmd>BCommits<CR>")
u.nmap("<Leader>aa", "<cmd>Commands<CR>")
u.nmap("<leader><leader>", "<cmd>Buffers<CR>")

u.lua_command("LspDef", "require('fzf-lua').lsp_definitions({ jump_to_single_result = true })")
u.command("LspRef", "FzfLua lsp_references")
u.command("LspSym", "FzfLua lsp_workspace_symbols")
u.command("LspAct", "FzfLua lsp_code_actions")
