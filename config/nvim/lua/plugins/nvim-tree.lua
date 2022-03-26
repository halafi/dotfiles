local u = require("utils")

vim.g.nvim_tree_icons = { folder = { arrow_open = "", arrow_closed = "" } }

u.nmap("<C-n>", ":NvimTreeFindFileToggle<CR>")

require'nvim-tree'.setup {
  view = {
    width = 55,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
}
