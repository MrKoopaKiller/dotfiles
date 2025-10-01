-- ~/.hammerspoon/init.lua

-- Make window moves instant (optional)
hs.window.animationDuration = 0

-- Reusable placer: bottom-right quarter of the current screen
local function bottomRightQuarter(win)
  if not win or not win:isStandard() then return end
  local sf = win:screen():frame()
  local w  = math.floor(sf.w / 2)
  local h  = math.floor(sf.h / 2)
  local x  = sf.x + sf.w - w
  local y  = sf.y + sf.h - h
  win:setFrame({ x = x, y = y, w = w, h = h })
end

-- Filter for only Alacritty windows
local wf = hs.window.filter
-- Easiest: just watch the Alacritty app
local f = wf.new('Alacritty')

-- IMPORTANT: event names are strings like "windowCreated"
f:subscribe("windowCreated",     bottomRightQuarter)
f:subscribe("windowUnminimized", bottomRightQuarter)
-- Optionally also enforce when Alacritty gets focus:
-- f:subscribe("windowFocused",     bottomRightQuarter)

hs.alert.show("Hammerspoon loaded")
