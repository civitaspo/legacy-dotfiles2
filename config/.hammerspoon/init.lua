do
  local function reloadConfig(files)
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
  -- Use Global Variables for preventing GC
  pathWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
  pathWatcher:start()
end


--
-- ContinuousWriting Support
--   ref. http://blog.gururimichi.com/entry/2017/08/28/190030
--

do
  local noStrokeSconds = 0
  local noStrokeCheckInterval = 30
  local isStroked = true
  local timer = hs.timer.doEvery(noStrokeCheckInterval, function()
    if isStroked then
      noStrokeSconds = 0
      isStroked = false
    else
      noStrokeSconds = noStrokeSconds + noStrokeCheckInterval
      hs.notify.show("Hammerspoon", "No Key Stroke Event", "During " .. noStrokeSconds .." seconds"):send()
    end
  end)

  local eventtap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
    isStroked = true
    return false
  end)

  local function startContinuousWriting()
    if not timer:running() then
      timer:start()
    end
    if not eventtap:isEnabled() then
      eventtap:start()
    end
  end

  local function stopContinuousWriting()
    if timer:running() then
      timer:stop()
    end
    if eventtap:isEnabled() then
      eventtap:stop()
    end
  end

  local function conditionalSwitchContinuousWriting(eventType)
    if eventType == hs.caffeinate.watcher.screensaverDidStart then
      print("-- stopContinuousWriting: hs.caffeinate.watcher.screensaverDidStart")
      stopNonStopWriting()
    elseif eventType == hs.caffeinate.watcher.screensaverDidStop then
      print("-- startNonStopWriting: hs.caffeinate.watcher.screensaverDidStop")
      startNonStopWriting()
    elseif eventType == hs.caffeinate.watcher.screensaverWillStop then
      print("-- stopContinuousWriting: hs.caffeinate.watcher.screensaverWillStop")
      stopContinuousWriting()
    elseif eventType == hs.caffeinate.watcher.screensDidLock then
      print("-- stopContinuousWriting: hs.caffeinate.watcher.screensDidLock")
      stopContinuousWriting()
    elseif eventType == hs.caffeinate.watcher.screensDidSleep then
      print("-- stopContinuousWriting: hs.caffeinate.watcher.screensDidSleep")
      stopContinuousWriting()
    elseif eventType == hs.caffeinate.watcher.screensDidUnlock then
      print("-- startContinuousWriting: hs.caffeinate.watcher.screensDidUnlock")
      startContinuousWriting()
    elseif eventType == hs.caffeinate.watcher.screensDidWake then
      print("-- startContinuousWriting: hs.caffeinate.watcher.screensDidWake")
      startContinuousWriting()
    elseif eventType == hs.caffeinate.watcher.sessionDidBecomeActive then
      print("-- startContinuousWriting: hs.caffeinate.watcher.sessionDidBecomeActive")
      startContinuousWriting()
    elseif eventType == hs.caffeinate.watcher.sessionDidResignActive then
      print("-- startContinuousWriting: hs.caffeinate.watcher.sessionDidResignActive")
      startContinuousWriting()
    else
      print("-- Do nothing about ContinuousWriting: " .. eventType)
    end
  end

  startContinuousWriting()

  -- Use Global Variables for preventing GC
  caffeinateWatcher = hs.caffeinate.watcher.new(conditionalSwitchContinuousWriting)
  caffeinateWatcher:start()
end

--
