local u = require("utils")

require("fzf-lua").setup({
    winopts = {
        width = 0.85,
        preview = {
            default = 'bat', -- faster than normal
            delay = 20, -- bat is fast
            scrollbar = false,
            horizontal = 'right:45%',
            border = 'noborder',
            winopts = {
                number = false,
            },
        },
    },
    fzf_opts = {
        ["--layout"] = "default",
    },
    previewers = {
        bat = {
          cmd = "bat",
          args = "--style=changes,numbers --color always",
          theme = 'Dracula', -- bat preview theme (bat --list-themes)
        },
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

u.command("Files", "FzfLua files")
u.command("Rg", "FzfLua live_grep_native")
u.command("Rgr", "FzfLua live_grep_resume")
u.command("BLines", "FzfLua grep_curbuf")
u.command("History", "FzfLua oldfiles")
u.command("Buffers", "FzfLua buffers")
u.command("BCommits", "FzfLua git_bcommits")
u.command("Commits", "FzfLua git_commits")
u.command("HelpTags", "FzfLua help_tags")
u.command("Colors", "FzfLua colorschemes")
u.command("Commands", "FzfLua commands")

u.nmap("<c-p>", "<cmd>Files<CR>")
u.nmap("<Leader>fr", "<cmd>Rgr<CR>")
u.nmap("<Leader>fs", "<cmd>Rg<CR>")
u.nmap("<Leader>fo", "<cmd>History<CR>")
u.nmap("<Leader>fh", "<cmd>HelpTags<CR>")
u.nmap("<Leader>fc", "<cmd>BCommits<CR>")
u.nmap("<Leader>aa", "<cmd>Commands<CR>")
u.nmap("<Leader><Leader>", "<cmd>Buffers<CR>")
