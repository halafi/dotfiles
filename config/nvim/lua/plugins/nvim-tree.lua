local u = require("utils")

vim.g.nvim_tree_icons = { folder = { arrow_open = "", arrow_closed = "" } }

u.nmap("<C-n>", ":NvimTreeFindFileToggle<CR>")

require'nvim-tree'.setup {
  view = {
    width = 45,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
  actions = {
    open_file = {
      resize_window = true,
    }
  }
}
