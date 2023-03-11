function onCreate()
    if songName ~= 'Shop' then
        makeLuaSprite('1GFScreen', 'gf/bg', 0, 0);
        addLuaSprite('1GFScreen', true);
        scaleObject('1GFScreen', 1, 1) 
        setObjectCamera('1GFScreen', 'other');

        makeLuaSprite('def', 'gf/gf', 10, 274);
        addLuaSprite('def', true);
        scaleObject('def', 0.4, 0.4) 
        setObjectCamera('def', 'other');

        makeLuaSprite('sus', 'gf/thick', 340, 274);
        addLuaSprite('sus', true);
        scaleObject('sus', 0.4, 0.4) 
        setObjectCamera('sus', 'other');

        makeLuaSprite('alt', 'gf/none', 670, 274);
        addLuaSprite('alt', true);
        scaleObject('alt', 0.4, 0.4) 
        setObjectCamera('alt', 'other');

        makeLuaSprite('none', 'gf/none', 1000, 274);
        addLuaSprite('none', true);
        scaleObject('none', 0.4, 0.4) 
        setObjectCamera('none', 'other');

        setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
    end
end

local allowCountdown = false

function onUpdate()
if songName ~= 'Shop' then
if getMouseX('hud') > getProperty('def.x') and getMouseY('hud') > getProperty('def.y') and getMouseX('hud') < getProperty('def.x') + getProperty('def.width') and getMouseY('hud') < getProperty('def.y') + getProperty('def.height') and mouseReleased() then
triggerEvent('Change Character', 'gf', 'gf');
triggerEvent('Change Character', 'bf', 'bf-old');
allowCountdown = true
startCountdown()
setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
Rem()
end
if getMouseX('hud') > getProperty('sus.x') and getMouseY('hud') > getProperty('sus.y') and getMouseX('hud') < getProperty('sus.x') + getProperty('sus.width') and getMouseY('hud') < getProperty('sus.y') + getProperty('sus.height') and mouseReleased() then
triggerEvent('Change Character', 'gf', 'gf-thick');
triggerEvent('Change Character', 'bf', 'bf');
allowCountdown = true
startCountdown()
setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
Rem()
end
if getMouseX('hud') > getProperty('alt.x') and getMouseY('hud') > getProperty('alt.y') and getMouseX('hud') < getProperty('alt.x') + getProperty('alt.width') and getMouseY('hud') < getProperty('alt.y') + getProperty('alt.height') and mouseReleased() then
triggerEvent('Change Character', 'gf', 'gf');
allowCountdown = true
startCountdown()
setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
Rem()
end
if getMouseX('hud') > getProperty('none.x') and getMouseY('hud') > getProperty('none.y') and getMouseX('hud') < getProperty('none.x') + getProperty('none.width') and getMouseY('hud') < getProperty('none.y') + getProperty('none.height') and mouseReleased() then
allowCountdown = true
startCountdown()
setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
Rem()
end
end
end

function Rem()
    doTweenY('1GFScreen', '1GFScreen', -50, 1, 'quadInOut')
    doTweenY('def', 'def', 774, 1, 'circInOut')
    doTweenY('sus', 'sus', 774, 1.1, 'circInOut')
    doTweenY('alt', 'alt', 774, 1.2, 'circInOut')
    doTweenY('none', 'none', 774, 1.3, 'circInOut')
end

function onTweenCompleted(tag)
    if tag == '1GFScreen' then
        doTweenY('1GFScreen2', '1GFScreen', 774, 1, 'circInOut')
    end
    if tag == '1GFScreen2' then
        removeLuaSprite('1GFScreen')
    end
    if tag == 'none' then
        removeLuaSprite('none')
    end
    if tag == 'alt' then
        removeLuaSprite('alt')
    end
    if tag == 'sus' then
        removeLuaSprite('sus')
    end
    if tag == 'def' then
        removeLuaSprite('def')
    end
end

function onStartCountdown()
if songName ~= 'Shop' then
  if not allowCountdown then 

    
    return Function_Stop;
  end
  return Function_Continue;
end
end