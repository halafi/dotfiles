-- https://github.com/nvim-lualine/lualine.nvim
require'lualine'.setup({
   options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
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
    lualine_x = {'encoding', 'fileformat', 'filetype'},
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
             mode = 2,
             max_length = vim.o.columns * 4 / 5,

             -- section_separators = {
             --   left = "",
             --   right = "",
             -- },
             -- component_separators = {
             --   left = "|",
             --   right = "|",
             -- },
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
     'fzf', 'fugitive', 'nvim-tree', 'toggleterm'
  }
})
