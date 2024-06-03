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
-- Initialize the previous and current application variables

-- hs.hotkey.bind(hyper, "return", function()
--   -- toggleApp("Code", "Google Chrome");
--   toggleLastApp()
-- end)
-- hs.hotkey.bind({ "ctrl", "shift", "alt", "cmd"},51, function()
--   toggleApp("Code", "Google Chrome");
-- end)
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

-- Well, sometimes auto-reload is not working, you know u.u
hs.hotkey.bind(meh, "r", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
