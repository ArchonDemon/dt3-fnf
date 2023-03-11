
local stompcheck = true
local bruh = 1
local a = 1/120
local x = {}
local y = {}
local modchart = false
local aA = 0
local start = false
local speed = 1
local modchart2 = false
local md = 2
local stompvalue = -40
local stompmode = 0
local condition = 8
local stompcount = 0
local zoom = 0
local b = 1/100
local xStomp = 30

function flag()
  for i = 0,7 do
    setPropertyFromGroup('strumLineNotes', i, 'y', y[i] + 20 * math.cos(i/1.5 + a))
    setPropertyFromGroup('strumLineNotes', i, 'x', x[i] + 20 * math.cos(a + i*0.80))
  end
end

function stomp(numbah)
  if numbah % 2 == 0 then
    for i = 0,7 do
      noteTweenX('stompLeft'..i, i, x[i] + xStomp, 0.15, 'circInOut')
    end
    xStomp = xStomp*(-1)
  else
    for i = 0,7 do
      noteTweenX('stompRight'..i, i, x[i], 0.15, 'circInOut')
    end
  end
  if numbah == 1 then
    for i = 0,7,2 do
      noteTweenY('stompA'..i, i, y[i] - stompvalue, 0.2, 'circInOut')
    end
  elseif numbah == 2 then
    for i = 1,7,2 do
      noteTweenY('stompB'..i, i, y[i] - stompvalue, 0.2, 'circInOut')
    end
  elseif numbah == 3 or numbah == 4 or numbah == 5 or numbah == 6 then
    noteTweenY('stompC'..numbah, (numbah-3), y[(numbah-3)], 0.2, 'circInOut')
    noteTweenY('stompD'..numbah, (numbah+1), y[(numbah+1)], 0.2, 'circInOut')
  elseif numbah == 7 or numbah == 8 or numbah == 9 or numbah == 10 then
    noteTweenY('stompE'..numbah, (numbah-7), y[(numbah-7)] - stompvalue, 0.2, 'circInOut')
    noteTweenY('stompF'..numbah, (numbah-3), y[(numbah-3)] - stompvalue, 0.2, 'circInOut')
  elseif numbah == 11 then
    for i = 0,7 do
      noteTweenY('stompG'..i, i, y[i], 0.2, 'circInOut')
    end
  end
end

function onSongStart()
  zoom = getProperty('camGame.zoom')
  speed = 240 / getPropertyFromClass('ClientPrefs', 'framerate')
  if downscroll then
    stompvalue = 40
  end
  for i = 0,7 do
    local xA = getPropertyFromGroup('strumLineNotes', i, 'x')
    local yB = getPropertyFromGroup('strumLineNotes', i, 'y')
    x[i] = xA
    y[i] = yB
  end

end

function onUpdate(elapsed)
  if modchart == true then
    if md == 1 then
      flag()
      a = a + 1/120 * speed
    end
  end
end

function onStepHit()
  if curStep == 99999999999999999 then
    modchart = false
    for i = 0,7 do
      noteTweenX(i .. 'xposA', i, x[i], 0.8, 'circInOut')
      noteTweenY(i .. 'yposA', i, y[i], 0.8, 'circInOut')
      noteTweenAngle(i .. 'angleposA', i, 360, 0.5, 'circInOut')
    end
  end
end

function onTweenCompleted(tag)
  if tag == '7ypos' then
    modchart = true
    for i = 0,7 do
      noteTweenAngle(i .. 'anglepos', i, 360, 1, 'circInOut')
    end
  end
  if tag == 'stompLeft7' or tag == 'stompRight7' then
    stompcheck = true
  end
end

function onTimerCompleted(tag, loops, loopsLeft)
  if tag == 'start' then
    modchart = false
  end
end

function onEvent(name, value1, value2)
  if name == 'stomps' and stompcheck then
    stomp(bruh)
    if bruh < 12 then
      bruh = bruh + 1
    else
      bruh = 1
    end
    stompcheck = false
  end
  if name == 'FlyingNotes' then 
    md = md - 1
    for i = 0,7 do
        noteTweenX(i .. 'xpos', i, x[i] + 30 * math.cos(a + i*0.80), 1, 'circInOut')
        noteTweenY(i .. 'ypos', i, y[i] + 30 * math.cos(i/1.5 + a), 1, 'circInOut')
    end
  end
end


function onGameOver()
  modchart = false
  return Function_Continue;
end