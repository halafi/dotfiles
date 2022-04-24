local u = require("utils")

require'lualine'.setup({
   options = {
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {
       {
         'filename',
         file_status = true,      -- Displays file status (readonly status, modified status)
         path = 1,
         shorting_target = 40,
         symbols = {
           modified = '[+]',      -- Text to show when the file is modified.
           readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
           unnamed = '[No Name]', -- Text to show for unnamed buffers.
         }
      }
    },
    lualine_x = {},
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
     lualine_a = {
         {
            'buffers',
             mode = 0,
             max_length = vim.o.columns * 4 / 5,
             show_filename_only = true,
             show_modified_status = true,
         }
     },
     lualine_b = {},
     lualine_c = {},
     lualine_x = {},
     lualine_y = {},
     lualine_z = {'tabs'}
  },
  extensions = {
     'fzf', 'nvim-tree'
  }
})

u.nmap("<A-[>", ":bp<CR>")
u.nmap("<A-]>", ":bn<CR>")
u.nmap("<A-1>", ":bf<CR>")
u.nmap("<A-9>", ":bl<CR>")
u.nmap('<A-d>', ':bd<CR>')
