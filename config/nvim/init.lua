-- pcall(require, 'impatient')
local u = require("utils")

local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

vim.tbl_map(function(plugin)
  vim.g['loaded_' .. plugin] = 1
end, disabled_built_ins)


-- needed to work well with fish
vim.opt.shell = "/bin/bash"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
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
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 500
vim.opt.hlsearch = true
-- vim.opt.cursorline = true
vim.opt.incsearch = true
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
vim.opt.ssop = 'blank,buffers,folds,help,tabpages,winsize,sesdir'
vim.opt.listchars = { tab = '> ', trail = '·', space = '·' }
vim.opt.wrap = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.pastetoggle = '<f6>'
vim.opt.statusline = [[%f %y %m %= %p%% %l:%c]]

-- vim.g.python3_host_prog = '/usr/local/bin/python3'
-- search and replace across files
-- use vimgrep to find e.g. all .txt files, grep to search text
vim.opt.grepprg = 'rg --vimgrep --smart-case --follow'
-- set grepprg=ack\ --nogroup\ --column\ $* 
-- set grepformat=%f:%l:%c:%m
-- :grep "pizza"
-- :cfdo %s/pizza/donut/g | update (update saves the file)
-- or :bufdo %s/pizza/donut/g | update for open buffers

local cmd = vim.api.nvim_command
cmd('highlight! link TermCursor Cursor')
cmd('highlight! TermCursorNC guibg=gray guifg=black ctermbg =1 ctermfg = 15')

u.nmap("[T", ":tabfirst<CR>")
u.nmap("]T", ":tablast<CR>")
u.nmap("[t", ":tabprev<CR>")
u.nmap("]t", ":tabnext<CR>")

u.nmap("<leader>sl", ":source Session.vim<CR>")

u.nmap("<Leader>wq", ":wincmd q<CR>")
u.nmap("<C-q>", ":call QuickFixToggle()<CR>")
u.nmap("<C-s>", "<C-a>") -- replace tmux taken key
u.nmap('<C-Left>', ':vertical resize -2<CR>')
u.nmap('<C-Right>', ':vertical resize +2<CR>')

u.nmap("<m-CR>", ":wqall<CR>")
u.nmap("<CR>", "(&buftype is# '' ? ':w<CR>' : '<CR>')", { expr = true })

u.nmap("k", [[(v:count > 1 ? "m'" . v:count : '') . 'k'"]], { expr = true })
u.nmap("j", [[(v:count > 1 ? "m'" . v:count : '') . 'j'"]], { expr = true })

u.nmap("n", "nzz")
u.nmap("N", "Nzz")
u.nmap("H", "^")
u.omap("H", "^")
u.xmap("H", "^")
u.nmap("L", "$")
u.omap("L", "$")
u.xmap("L", "$")
u.xmap(">", ">gv")
u.xmap("<", "<gv")
-- Move selected line / block of text in visual mode
u.xmap("MK", ":move '<-2<CR>gv-gv")
u.xmap("MJ", ":move '>+1<CR>gv-gv")

-- react
u.nmap("<leader>pr", "/type Props<CR>")

-- tabs
u.nmap("<LocalLeader>t", ":tabnew<CR>")
u.nmap("<LocalLeader>T", ":tabedit %<CR>")
u.nmap("<LocalLeader>x", ":tabclose<CR>")
u.nmap("<LocalLeader>o", ":tabonly<CR>")
u.imap('jk', "<Esc>")
u.imap('jj', "<Esc>")
-- make useless key useful
-- u.nmap("§", "%", { noremap = false }) -- <tab> breaks <C-I> mapping
-- u.xmap("§", "%", { noremap = false })
-- u.omap("§", "%", { noremap = false })

-- close all other buffers
u.nmap('<leader>bdd', ':w <bar> %bd <bar> e# <bar> bd# <CR>')
-- disable search highlight
u.nmap('<Esc>', ':noh<return><esc>')

-- fix the & substitution repetition - TODO: remember what it was for (book)
-- u.nmap('&', ':&&')
-- u.xmap('&', ':&&')

-- resize with arrows
-- open links (somewhat works)
-- u.nmap('gx', ':!open <c-r><c-a>',{ silent = false })

-- not perfect url open
u.nmap('gx', ':!open <c-r><c-a>')
u.nmap("<leader>ps", ":PackerSync<CR>")

-- initialize global object for config
global = {}

vim.g.lf_map_keys = 0
vim.g.lf_height = 0.90
vim.g.lf_width = 0.90

u.nmap('<leader>n', ':Lf<CR>')

-- copilot
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_no_tab_map = true

require "tmux"
require "commands"
require "lsp"
require "lsp/cmp-config"
require "plugins"

vim.g.tokyonight_style = "storm"
vim.g.vscode_style = "dark"
-- cmd('colorscheme vscode')

-- plugin settings that needs to be here
vim.cmd("highlight ConflictMarkerBegin guibg=#2f7366")
vim.cmd("highlight ConflictMarkerOurs guibg=#2e5049")
vim.cmd("highlight ConflictMarkerTheirs guibg=#344f69")
vim.cmd("highlight ConflictMarkerEnd guibg=#2f628e")
vim.cmd("highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81")
-- vim.g.tokyonight_style = "night"
-- vim.g.neon_style = 'dark'

-- cmd('colorscheme chuek')
-- cmd('colorscheme tokyonight')
cmd('colorscheme vscode')
-- cmd('colorscheme dracula')
