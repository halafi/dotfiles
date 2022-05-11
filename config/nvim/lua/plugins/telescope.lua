local telescope = require("telescope")
local telescope_actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

local u = require("utils")

--https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
    defaults = {
        -- use if needed
        file_ignore_patterns = { ".hbs" }, -- ".spec" },
        -- file_ignore_patterns = { "apps/app", "apps/api", "backoffice-client", "libs/business-metrics", "libs/messaging-system", "libs/domain/draw", "libs/domain/underwriting" }, -- ".spec" },
        vimgrep_arguments = {
              "rg",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case", -- start case sensitive search with upper case character
              "--trim"
        },
        layout_config = {
          horizontal = { width = 0.9 },
          preview_width = 70,
        },
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<Esc>"] = telescope_actions.close,
                ["<C-j>"] = telescope_actions.move_selection_next,
                ["<C-k>"] = telescope_actions.move_selection_previous,
                ["<M-p>"] = action_layout.toggle_preview
            },
            n = {
                ["<M-p>"] = action_layout.toggle_preview
            },
        },
    },
})

telescope.load_extension("fzf")

local find_files = function()
    local set = require("telescope.actions.set")
    local builtin = require("telescope.builtin")

    local opts = {
        attach_mappings = function(_, map)
            map("i", "<C-v>", function(prompt_bufnr)
                set.edit(prompt_bufnr, "Vsplit")
            end)

            map("i", "<C-s>", function(prompt_bufnr)
                set.edit(prompt_bufnr, "Split")
            end)

            -- edit file and matching test file in split
            map("i", "<C-f>", function(prompt_bufnr)
                set.edit(prompt_bufnr, "edit")
                require("config.commands").edit_test_file("Vsplit $FILE | wincmd w")
            end)

            return true
        end,
    }

    local is_git_project = pcall(builtin.git_files, opts)
    if not is_git_project then
        builtin.find_files(opts)
    end
end

u.command("Files", find_files)
u.command("Rg", "Telescope live_grep")
u.command("Rgr", "Telescope resume")
u.command("ManPages", "Telescope man_pages")
u.command("BLines", "Telescope current_buffer_fuzzy_find")
u.command("History", "Telescope oldfiles")
u.command("Buffers", "Telescope buffers")
u.command("BCommits", "Telescope git_bcommits")
u.command("Commits", "Telescope git_commits")
u.command("HelpTags", "Telescope help_tags")
u.command("Colors", "Telescope colorscheme")
u.command("Commands", "Telescope commands")
u.command("Marks", "Telescope marks")


u.nmap("<c-p>", "<cmd>Files<CR>")
u.nmap("<Leader>ff", "<cmd>Files<CR>")
u.nmap("<Leader>fr", "<cmd>Rgr<CR>")
u.nmap("<Leader>fl", "<cmd>Colors<CR>")
u.nmap("<Leader>fs", "<cmd>Rg<CR>")
u.nmap("<Leader>fo", "<cmd>History<CR>")
u.nmap("<Leader>fb", "<cmd>Marks<CR>")
u.nmap("<Leader>fh", "<cmd>HelpTags<CR>")
u.nmap("<Leader>fc", "<cmd>BCommits<CR>")
u.nmap("<Leader>aa", "<cmd>Commands<CR>")
u.nmap("<Leader><Leader>", "<cmd>Buffers<CR>")

-- lsp
u.command("LspRef", "Telescope lsp_references")
u.command("LspDef", "Telescope lsp_definitions")
u.command("LspSym", "Telescope lsp_workspace_symbols")
u.command("LspAct", "Telescope lsp_code_actions")
u.command("LspRangeAct", "Telescope lsp_range_code_actions")
