local u = require("utils")

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

vim.g.dashboard_custom_shortcut = {
  ['last_session'] = 'SPC s l',
  ['find_history'] = 'SPC f o',
  ['find_file'] = 'SPC f f',
  ['new_file'] = 'SPC c n',
  ['change_colorscheme'] = 'SPC f l',
  ['find_word'] = 'SPC f s',
  ['book_marks'] = 'SPC f b',
 }

-- vim.g.dashboard_custom_section = {
--    ['find_help'] = {
--        ['description'] = {'Find help                 SPC f h'},
--        ['command'] = 'SPC f h'
--    }
--  }

vim.g.dashboard_custom_header = lines

u.nmap("<leader>sl", ":SessionLoad<CR>")
u.nmap("<leader>cn", ":DashboardNewFile<CR>")
