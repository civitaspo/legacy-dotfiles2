function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
      print("-- Loading config: "..file)
    end
  end
  if doReload then
    hs.reload()
  end
end
local pathWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
pathWatcher:start()

local function keyCode(key, modifiers)
  modifiers = modifiers or {}
  return function()
    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
    hs.timer.usleep(1000)
    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
    -- hs.eventtap.keyStroke(modifiers, string.lower(key), 1)
  end
end

local function remapKey(modifiers, key, keyCode)
  hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function remapCommonHotkeys()
  remapKey({'ctrl'}, 'f', keyCode('right'))
  remapKey({'ctrl'}, 'b', keyCode('left'))
  remapKey({'ctrl'}, 'n', keyCode('down'))
  remapKey({'ctrl'}, 'p', keyCode('up'))
  remapKey({'ctrl'}, 'h', keyCode('delete'))
  -- remapKey({'ctrl'}, 'd', keyCode('forwarddelete'))
end

local function remapDvorakKey()
  -- remapKey({}, 'q', keyCode('\''))
  -- remapKey({}, 'w', keyCode(','))
  -- remapKey({}, 'e', keyCode('.'))
  -- remapKey({}, 'r', keyCode('p'))
  -- remapKey({}, 'y', keyCode('f'))
  -- remapKey({}, 't', keyCode('y'))
  -- remapKey({}, 'u', keyCode('g'))
  -- remapKey({}, 'i', keyCode('c'))
  -- remapKey({}, 'o', keyCode('r'))
  -- remapKey({}, 'p', keyCode('l'))
  -- remapKey({}, '[', keyCode('/'))
  -- remapKey({}, ']', keyCode('='))
  -- remapKey({}, "\\", keyCode("\\"))
  -- remapKey({}, 'a', keyCode('a'))
  -- remapKey({}, 's', keyCode('o'))
  -- remapKey({}, 'd', keyCode('e'))
  -- remapKey({}, 'f', keyCode('u'))
  -- remapKey({}, 'g', keyCode('i'))
  -- remapKey({}, 'h', keyCode('d'))
  -- remapKey({}, 'j', keyCode('h'))
  -- remapKey({}, 'k', keyCode('t'))
  -- remapKey({}, 'l', keyCode('n'))
  -- remapKey({}, ';', keyCode('s'))
  -- remapKey({}, '\'', keyCode('-'))
  -- remapKey({}, 'z', keyCode(';'))
  -- remapKey({}, 'x', keyCode('q'))
  -- remapKey({}, 'c', keyCode('j'))
  -- remapKey({}, 'v', keyCode('k'))
  -- remapKey({}, 'b', keyCode('x'))
  -- remapKey({}, 'n', keyCode('b'))
  -- remapKey({}, 'm', keyCode('m'))
  -- remapKey({}, ',', keyCode('w'))
  -- remapKey({}, '.', keyCode('v'))
  -- remapKey({}, '/', keyCode('z'))
  -- remapKey({}, '-', keyCode('['))
  -- remapKey({}, '=', keyCode(']'))
end

local function disableAllHotkeys()
  for k, v in pairs(hs.hotkey.getHotkeys()) do
    v['_hk']:disable()
  end
end

-- local function usbDeviceCallback(data)
--   print("-- usbDeviceCallback: "..hs.inspect(data))
--   if (data["productName"] == "ErgoDox EZ") then
--     event = data["eventType"]
--     if (event == "added") then
--       disableAllHotkeys()
--       remapCommonHotkeys()
--     elseif (event == "removed") then
--       disableAllHotkeys()
--       remapCommonHotkeys()
--     end
--   end
-- end
-- 
-- usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
-- usbWatcher:start()

remapCommonHotkeys()
