local u = require("utils")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.ignorecase = true
vim.opt.smartcase = false
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv('VIMCONFIG') .. '/undodir'
vim.opt.updatetime = 300
-- autocompletion
vim.opt.completeopt = { "menuone", "noinsert" }
vim.opt.pumheight = 10

vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 2
-- vim.opt.cursorline = true -- don't like it
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 500 -- default 1000
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- allow / disallow buffer switching without saving
vim.opt.hidden = true
vim.opt.ic = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.title = true
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.spell = false
vim.opt.spelllang = 'en_us'
vim.opt.compatible = false vim.opt.ssop = 'blank,buffers,folds,help,tabpages,winsize,sesdir'
vim.opt.listchars = { tab = '| ', trail = '·' }

vim.opt.wrap = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.pastetoggle = '<f6>'

-- search and replace across files
-- use vimgrep to find e.g. all .txt files, grep to search text
vim.opt.grepprg = 'rg --vimgrep --smart-case --follow'
-- set grepprg=ack\ --nogroup\ --column\ $* 
-- set grepformat=%f:%l:%c:%m
-- :grep "pizza"
-- :cfdo %s/pizza/donut/g | update (update saves the file)
-- or :bufdo %s/pizza/donut/g | update for open buffers


vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.neon_style = "dark"
vim.g.material_style = 'deep ocean'


-- commands
local cmd = vim.api.nvim_command
cmd('filetype plugin indent on')
cmd('runtime macros/matchit.vim')
-- highlight inactive terminal cursor position
cmd('highlight! link TermCursor Cursor')
cmd('highlight! TermCursorNC guibg=gray guifg=black ctermbg =1 ctermfg = 15')

u.nmap("[b", ":bp<CR>")
u.nmap("]b", ":bn<CR>")
u.nmap("[t", ":tabprev<CR>")
u.nmap("]t", ":tabnext<CR>")
u.nmap("[q", ":cp<CR>")
u.nmap("]q", ":cn<CR>")

-- <C-w> v -> split, moving is handled by tmux
-- u.nmap("<C-q>", ":wincmd q<CR>")
u.nmap("<C-q>", ":call QuickFixToggle()<CR>")

-- u.nmap("<leader>S", ":%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>")


u.nmap("n", "nzz")
u.nmap("N", "Nzz")

-- save on <CR> in normal buffers
-- u.nmap("<S-CR>", ":wqall<CR>")
u.nmap("<CR>", "(&buftype is# '' ? ':w<CR>' : '<CR>')", { expr = true })

u.nmap("H", "^")
u.omap("H", "^")
u.xmap("H", "^")
u.nmap("L", "$")
u.omap("L", "$")
u.xmap("L", "$")

-- tabs
u.nmap("<LocalLeader>t", ":tabnew<CR>")
u.nmap("<LocalLeader>T", ":tabedit %<CR>")
u.nmap("<LocalLeader>x", ":tabclose<CR>")
u.nmap("<LocalLeader>o", ":tabonly<CR>")

-- maintain visual mode selection while indenting
u.xmap(">", ">gv")
u.xmap("<", "<gv")

u.imap('jk', "<Esc>")
u.imap('jj', "<Esc>")
-- exit terminal
u.tmap("<C-o>", "<C-\\><C-n>")
-- u.tmap('jk', "<C-\\><C-n>")
-- u.tmap('jj', "<C-\\><C-n>")
-- u.tmap('<esc>', "<C-\\><C-n>")
u.nmap("<Tab>", "%", { noremap = false })
u.xmap("<Tab>", "%", { noremap = false })
u.omap("<Tab>", "%", { noremap = false })

u.nmap('<leader>bdd', ':w <bar> %bd <bar> e# <bar> bd# <CR>')
-- Substitute the word under the cursor.
u.nmap('<leader>S', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- disable search highlight
u.nmap('<Esc>', ':noh<return><esc>')
-- fix: map S-Tab to ctrl+d in insert mode
u.imap('<S-Tab>', '<c-d>')
-- fix the & substitution repetition - TODO: remember what it was for (book)
-- u.nmap('&', ':&&')
-- u.xmap('&', ':&&')
u.nmap('<C-n>', ':NvimTreeFindFileToggle<CR>')
-- FZF
u.nmap('<leader>fb', '<cmd>Buffers<cr>')
u.nmap('<leader>fh', '<cmd>Help<cr>')
u.nmap('<leader>aa', '<cmd>Commands<cr>')
u.nmap('<leader>s', ':RG<cr>')
u.nmap('<C-p>', ':Files<cr>')

-- resize with arrows
u.nmap('<C-Left>', ':vertical resize -2<CR>')
u.nmap('<C-Right>', ':vertical resize +2<CR>')
-- open links (somewhat works)
-- u.nmap('gx', ':!open <c-r><c-a>',{ silent = false })

-- Ultisnips
vim.g.UltiSnipsExpandTrigger = "<leader>++"
vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
vim.g.UltiSnipsEditSplit = "horizontal"

u.nmap('<leader>z', ':ZenMode<cr>')
-- not perfect url open
u.nmap('gx', ':!open <c-r><c-a>')

-- fzf
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
vim.g.fzf_preview_command = 'bat --color=always --plain {-1}'
vim.g.fzf_preview_lines_command = 'bat --color=always --plain --number'
vim.g.gitblame_enabled = 0
-- :Rg but ignore filenames
vim.cmd("command! -bang -nargs=* RG call fzf#vim#grep(\"rg --column --line-number --no-heading --color=always --smart-case \".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)")
-- command! -bang -nargs=* RG call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

-- nvim tree
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 1 }
vim.g.nvim_tree_icons = { folder = { arrow_open = "", arrow_closed = "" } }

-- autocommands
-- highlight on yank
vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })')
-- disable continuation of comments to the next line 
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- vim-test
vim.g["test#custom_runners"] = { javascript = {"nx"} }
vim.g["test#strategy"] = "neovim"
vim.g["test#javascript#runner"] = "nx"
vim.g["test#javascript#nx#project"] = "app"
u.nmap('<leader>tn', ':TestNearest<CR>')
u.nmap('<leader>tnw', ':TestNearest --watch<CR>')
u.nmap('<leader>tf', ':TestFile<CR>')
u.nmap('<leader>tfw', ':TestFile --watch<CR>')
u.nmap('<leader>tl', ':TestLast<CR>')
u.nmap('<leader>tlw', ':TestLast --watch<CR>')
u.nmap('<leader>tv', ':TestVisit<CR>')
u.nmap('<leader>ts', ':TestSuite<CR>')
u.nmap('<leader>tsw', ':TestSuite --watch<CR>')


-- initialize global object for config
global = {}
require "plugins"
require "lsp"
require "cmp-config"
require "commands"

cmd('syntax enable')
cmd('colorscheme nightfly')
