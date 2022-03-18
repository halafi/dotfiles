local u = require("utils")

local illuminate = require("illuminate")

u.nmap("<M-.>", function()
    illuminate.next_reference({ wrap = true })
end)
u.nmap("<M-,>", function()
    illuminate.next_reference({ reverse = true, wrap = true })
end)
