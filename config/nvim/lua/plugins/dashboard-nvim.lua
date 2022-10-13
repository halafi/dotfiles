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
  
Memento Mori
]]

local lines = {}
for s in string.gmatch(ascii, "[^\r\n]+") do
  table.insert(lines, s)
end

db.custom_center = {
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
  { icon = '  ',
    desc = 'Find word                               ',
    aciton = 'Telescope live_grep',
    shortcut = 'SPC f s' },
}


db.custom_header = lines

u.nmap("<leader>sl", ":source Session.vim<CR>")
