local u = require("utils")

u.nmap("<C-n>", ":NvimTreeFindFile<CR>")

require'nvim-tree'.setup {
  -- open_on_setup = true,
  view = {
    width = 45,
    hide_root_folder = false,
    side = 'left',
    -- mappings = {
    --   custom_only = false,
    --   list = {}
    -- },
    number = false,
    relativenumber = false
  },
  actions = {
    open_file = {
      resize_window = true,
    }
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_open = "",
          arrow_closed = ""
        }
      }
    }
  }
}

require("nvim-tree.api").tree.open()

