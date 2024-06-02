hs.window.animationDuration = 0
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install                            = spoon.SpoonInstall

local hyper                        = { "cmd", "alt", "ctrl", "shift" }
local meh                          = { "alt", "ctrl", "shift" }

-- Install:andUse("AppLauncher", {
--   config = {
--     modifiers = hyper
--   },
--   hotkeys = {
--     s = "Calendar",
--     t = "Toggl Track",
--     -- m = "YouTube Music",
--     d = "Discord",
--     -- n = "Notes",
--     r = "Reminders",
--   }
-- })
-- toggleApp = function(appName, appName2)
--   local app = hs.application.get(appName)
--   local app2 = hs.application.get(appName2)
--   if app then
--     if app:isFrontmost() then
--       -- app:hide()
--       app2:activate()
--     else
--       -- app2:hide()
--       app:activate()
--     end
--   else
--     hs.application.launchOrFocus(appName)
--   end
-- end

hs.hotkey.bind(hyper, "return", function()
  toggleApp("Code", "Google Chrome");
end)
hs.hotkey.bind({ "ctrl", "shift", "alt", "cmd"},51, function()
  toggleApp("Code", "Google Chrome");
end)
-- hs.hotkey.bind(meh, "l", function()
--   hs.eventtap.keyStroke({'ctrl'}, "a")
--   hs.eventtap.keyStroke({}, "j")
-- end)
-- hs.hotkey.bind(meh, "u", function()
--   hs.eventtap.keyStroke({'ctrl'}, "a")
--   hs.eventtap.keyStroke({}, "k")
-- end)
-- hs.hotkey.bind(hyper, "m", function()
--   toggleApp("Discord", "Music");
-- end)
-- hs.hotkey.bind(hyper, "space", function()
--   hs.eventtap.keyStroke({'ctrl'}, "a")
--   hs.eventtap.keyStroke({}, "space")
-- end)
-- hs.hotkey.bind(hyper, "x", function()
--   hs.eventtap.keyStroke({'ctrl'}, "a")
--   hs.eventtap.keyStroke({}, "x")
-- end)
-- hs.hotkey.bind(hyper, "c", function()
--   hs.eventtap.keyStroke({'ctrl'}, "a")
--   hs.eventtap.keyStroke({}, "c")
-- end)
-- hs.hotkey.bind(hyper, "l", function()
--   hs.eventtap.keyStroke({'cmd', 'shift'}, "[")
-- end)
-- hs.hotkey.bind(hyper, "u", function()
--   hs.eventtap.keyStroke({'cmd', 'shift'}, "]")
-- end)


-- Install:andUse("WindowScreenLeftAndRight",
--   {
--     -- config = {
--     --   animationDuration = 0,
--     -- },
--     hotkeys = {
--       screen_left = { meh, "e" },
--       screen_right = { meh, "i" },
--     },
--   }
-- )

-- Install:andUse("WindowHalfsAndThirds",
--   {
--     config = {
--     use_frame_correctness = true,
--     },
--     hotkeys = {
--       left_half  = { meh, "n" },
--       right_half = { meh, "o" },
--       -- top_half     = { { "ctrl", "cmd" }, "Up" },
--       -- bottom_half  = { { "ctrl", "cmd" }, "Down" },
--       -- third_left   = { { "ctrl", "alt" }, "Left" },
--       -- third_right  = { { "ctrl", "alt" }, "Right" },
--       -- third_up     = { { "ctrl", "alt" }, "Up" },
--       -- third_down   = { { "ctrl", "alt" }, "Down" },
--       -- top_left     = { { "ctrl", "cmd" }, "1" },
--       -- top_right    = { { "ctrl", "cmd" }, "2" },
--       -- bottom_left  = { { "ctrl", "cmd" }, "3" },
--       -- bottom_right = { { "ctrl", "cmd" }, "4" },
--       max_toggle = { meh, "return" },
--       -- max        = { { "ctrl", "alt", "shift" }, "return" },
--       -- undo         = { { "alt", "cmd" }, "z" },
--       center     = { meh, "c" },
--       -- larger       = { { "alt", "cmd", "shift" }, "Right" },
--       -- smaller      = { { "alt", "cmd", "shift" }, "Left" },
--     },
--   }
-- )

-- Well, sometimes auto-reload is not working, you know u.u
hs.hotkey.bind(meh, "r", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
