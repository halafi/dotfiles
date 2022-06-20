local u = require("utils")
local db = require('dashboard')

vim.g.dashboard_default_executive = "fzf"

local ascii = [[
 _____   ___  ____________ _____  ______ _____ ________  ___
/  __ \ / _ \ | ___ \ ___ \  ___| |  _  \_   _|  ___|  \/  |
| /  \// /_\ \| |_/ / |_/ / |__   | | | | | | | |__ | .  . |
| |    |  _  ||    /|  __/|  __|  | | | | | | |  __|| |\/| |
| \__/\| | | || |\ \| |   | |___  | |/ / _| |_| |___| |  | |
 \____/\_| |_/\_| \_\_|   \____/  |___/  \___/\____/\_|  |_/
  
  
  ⣿⣿⣿⣿⣿⣿⠿⢋⣥⣴⣶⣶⣶⣬⣙⠻⠟⣋⣭⣭⣭⣭⡙⠻⣿⣿⣿⣿⣿
  ⣿⣿⣿⣿⡿⢋⣴⣿⣿⠿⢟⣛⣛⣛⠿⢷⡹⣿⣿⣿⣿⣿⣿⣆⠹⣿⣿⣿⣿
  ⣿⣿⣿⡿⢁⣾⣿⣿⣴⣿⣿⣿⣿⠿⠿⠷⠥⠱⣶⣶⣶⣶⡶⠮⠤⣌⡙⢿⣿
  ⣿⡿⢛⡁⣾⣿⣿⣿⡿⢟⡫⢕⣪⡭⠥⢭⣭⣉⡂⣉⡒⣤⡭⡉⠩⣥⣰⠂⠹
  ⡟⢠⣿⣱⣿⣿⣿⣏⣛⢲⣾⣿⠃⠄⠐⠈⣿⣿⣿⣿⣿⣿⠄⠁⠃⢸⣿⣿⡧
  ⢠⣿⣿⣿⣿⣿⣿⣿⣿⣇⣊⠙⠳⠤⠤⠾⣟⠛⠍⣹⣛⣛⣢⣀⣠⣛⡯⢉⣰
  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡶⠶⢒⣠⣼⣿⣿⣛⠻⠛⢛⣛⠉⣴⣿⣿
  ⣿⣿⣿⣿⣿⣿⣿⡿⢛⡛⢿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡈⢿⣿
  ⣿⣿⣿⣿⣿⣿⣿⠸⣿⡻⢷⣍⣛⠻⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢇⡘⣿
  ⣿⣿⣿⣿⣿⣿⣿⣷⣝⠻⠶⣬⣍⣛⣛⠓⠶⠶⠶⠤⠬⠭⠤⠶⠶⠞⠛⣡⣿
  ⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣬⣭⣍⣙⣛⣛⣛⠛⠛⠛⠿⠿⠿⠛⣠⣿⣿
  ⣦⣈⠉⢛⠻⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⣁⣴⣾⣿⣿⣿⣿
  ⣿⣿⣿⣶⣮⣭⣁⣒⣒⣒⠂⠠⠬⠭⠭⠭⢀⣀⣠⣄⡘⠿⣿⣿⣿⣿⣿⣿⣿
  ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣿⣿
  
]]

local lines = {}
for s in string.gmatch(ascii, "[^\r\n]+") do
  table.insert(lines, s)
end

db.custom_center = {
  -- { action = 'last_session', desc = 'SPC s l' } --correct if you don't action filed
  { icon = '  ',
    desc = 'Resume latest session                   ',
    shortcut = 'SPC s l',
    action = 'source Session.vim' },
  { icon = '  ',
    desc = 'Recently opened files                   ',
    action = 'History',
    shortcut = 'SPC f o' },
  { icon = '  ',
    desc = 'Find File                               ',
    action = 'Files',
    shortcut = 'SPC f f' },
  -- { icon = '  ',
  --   desc = 'File Browser                            ',
  --   action = 'Telescope file_browser',
  --   shortcut = 'SPC f b' },
  { icon = '  ',
    desc = 'Find word                               ',
    aciton = 'Telescope live_grep',
    shortcut = 'SPC f s' },
  -- { icon = '  ',
  --   desc = 'Open Personal dotfiles                  ',
  --   action = 'Telescope dotfiles path=~/Projects/dotfiles',
  --   shortcut = 'SPC f d' },

  -- ['last_session'] = 'SPC s l',
  -- ['find_history'] = 'SPC f o',
  -- ['find_file'] = 'SPC f f',
  -- ['new_file'] = 'SPC c n',
  -- ['change_colorscheme'] = 'SPC f l',
  -- ['find_word'] = 'SPC f s',
}


-- vim.g.dashboard_custom_section = {
--    ['find_help'] = {
--        ['description'] = {'Find help                 SPC f h'},
--        ['command'] = 'SPC f h'
--    }
--  }

db.custom_header = lines

u.nmap("<leader>sl", ":source Session.vim<CR>")
u.nmap("<leader>cn", ":DashboardNewFile<CR>")
