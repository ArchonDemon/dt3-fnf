local Xpos = 0
local Ypos = 0
local XposCam = 0
local YposCam = 0
local Dead = false
local DT = false
local Personaje = ''
local DiferenteSprite = {'sunshine', 'Fight or Flight', 'Round-a-bout', 'Soulless', 'burning', 'My-Horizon', 'Forestall-Desire','prey-v2', 'Prey'}
local Zoom = 1
local AlphaBB = 0.35
local TimeBB = 4

function checkList(list, value)
for i=0,table.maxn(list) do
    if list[i] == value then return true end
    end
end

function onCountdownStarted()
makeLuaSprite('BB', '', -500, -300)
makeGraphic('BB' ,  1000,  1000,'000000')
setProperty('BB.alpha', 0) 
addLuaSprite('BB', true)
if songName == 'Soulless' or songName == 'Forestall-Desire' or songName == 'Prey' or songName == 'prey-v2' then
XposCam = -460
YposCam = -500
AlphaBB = 1
TimeBB = 0.01
Zoom = 1
setProperty('BB.scale.x', 10)
setProperty('BB.scale.y', 10) 
end
if songName == 'burning' or songName == 'My-Horizon' then
AlphaBB = 0.9
TimeBB = 4
Zoom = 0.8
makeAnimatedLuaSprite('BOYFRIEND_DEAD', 'characters/BF', defaultBoyfriendX+10, defaultBoyfriendY+310);
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', 'BF Dead Loop', 24, true);
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD2', 'spookman', 24, false);  
objectPlayAnimation('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', true)
scaleLuaSprite('BOYFRIEND_DEAD', 8, 8);
setProperty('BOYFRIEND_DEAD.visible', false);
addLuaSprite('BOYFRIEND_DEAD', true);
setProperty('BOYFRIEND_DEAD.antialiasing', false);
setProperty('BB.scale.x', 10)
setProperty('BB.scale.y', 10) 
end
if songName == 'Fight or Flight' then
AlphaBB = 1
TimeBB = 0.01
Zoom = 0.6
makeAnimatedLuaSprite('BOYFRIEND_DEAD', 'characters/Muerte/starved_die', defaultBoyfriendX-1800, defaultBoyfriendY-1000);
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', 'omnomnom', 24, false);
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD2', 'spookman', 24, false);  
objectPlayAnimation('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', true)
scaleLuaSprite('BOYFRIEND_DEAD', 4, 4);
setProperty('BOYFRIEND_DEAD.visible', false);
addLuaSprite('BOYFRIEND_DEAD', true);
setProperty('BB.scale.x', 10)
setProperty('BB.scale.y', 10) 
end
if songName == 'Round-a-bout' then
AlphaBB = 1
TimeBB = 0.01
makeAnimatedLuaSprite('BOYFRIEND_DEAD', 'characters/Muerte/needlemouse-death', defaultBoyfriendX-1800, defaultBoyfriendY-1000);
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', 'loop', 24, false);
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD2', 'spookman', 24, false);  
objectPlayAnimation('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', true)
scaleLuaSprite('BOYFRIEND_DEAD', 3, 3);
setProperty('BOYFRIEND_DEAD.visible', false);
addLuaSprite('BOYFRIEND_DEAD', true);
setProperty('BB.scale.x', 10)
setProperty('BB.scale.y', 10) 
Zoom = 0.6
XposCam = -260
YposCam = -200
end
if songName == 'sunshine' then
makeAnimatedLuaSprite('BOYFRIEND_DEAD', 'characters/Muerte/3DGOpng', defaultBoyfriendX+10, defaultBoyfriendY+310);
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', 'DeathAnim', 24, false);  
objectPlayAnimation('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', true)
scaleLuaSprite('BOYFRIEND_DEAD', 0.75, 0.75);
setProperty('BOYFRIEND_DEAD.visible', false);
addLuaSprite('BOYFRIEND_DEAD', true);
setProperty('BB.scale.x', 10)
setProperty('BB.scale.y', 10) 
end
if checkList(DiferenteSprite, songName) ~= true then
makeAnimatedLuaSprite('BOYFRIEND_DEAD', 'characters/BOYFRIEND_DEAD', defaultBoyfriendX+10, defaultBoyfriendY+310);
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD1', 'BF dies', 24, false);  
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', 'BF Dead Loop', 24, true);  
addAnimationByPrefix('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD3', 'BF Dead confirm', 24, false);  
objectPlayAnimation('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', true)
scaleLuaSprite('BOYFRIEND_DEAD', 1, 1);
setProperty('BOYFRIEND_DEAD.visible', false);
addLuaSprite('BOYFRIEND_DEAD', true);
setProperty('BB.scale.x', 10)
setProperty('BB.scale.y', 10) 
end
end

function onGameOver()
if not Dead then
doTweenAlpha('BB', 'BB', AlphaBB, TimeBB, 'linear')

objectPlayAnimation('BOYFRIEND_DEAD', 'BOYFRIEND_DEAD', true)
triggerEvent('Camera Follow Pos', getProperty('boyfriend.x') + 170 + XposCam, getProperty('boyfriend.y') + 100 + YposCam)
setProperty('BOYFRIEND_DEAD.visible', true)
doTweenAlpha('hud', 'camHUD', 0, 0.01, 'linear')
cameraFlash('camGame', 'FF0000', 1)
doTweenZoom('TCAM','camGame', Zoom, 4, 'sineInOut')
setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
setPropertyFromClass('PlayState', 'instance.generatedMusic', false)
setProperty('boyfriend.visible', false)
setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
makeLuaText('Restart', 'restart' , 630, 0, 580)
setTextSize('Restart', 50)
setTextAlignment('Restart', 'center')
setObjectCamera('Restart', 'other')
addLuaText('Restart')

makeLuaText('Exit', 'exit' , 1300, 300, 580)
setTextSize('Exit', 50)
setTextAlignment('Exit', 'center')
setObjectCamera('Exit', 'other')
addLuaText('Exit')

setTextColor('Exit', 'FFF100')
setTextColor('Restart', 'FFF100')

setTextFont("Restart", "sonic-hud-font.ttf");
setTextFont("Exit", "sonic-hud-font.ttf");

Dead = true
return Function_Stop;
end
if Dead then
return Function_Stop
end
return Function_Continue;
end

function onPause()
if Dead == true then
return Function_Stop
end
end

function onEndSong()
if Dead == true then
return Function_Stop;
end
return Function_Continue;
end

function onUpdate()
if not Dead then
DT = getSongPosition()
end
if Dead then
setProperty('dad.animation.curAnim.frameRate', 0)
setPropertyFromClass('Conductor', 'songPosition', DT)
setPropertyFromClass('flixel.FlxG', 'sound.music.time', DT)
if getMouseX('hud') > getProperty('Exit.x') and getMouseY('hud') > getProperty('Exit.y') and getMouseX('hud') < getProperty('Exit.x') + getProperty('Exit.width') and getMouseY('hud') < getProperty('Exit.y') + getProperty('Exit.height') and mouseReleased() then
exitSong(false);
setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
end
if getMouseX('hud') > getProperty('Restart.x') and getMouseY('hud') > getProperty('Restart.y') and getMouseX('hud') < getProperty('Restart.x') + getProperty('Restart.width') and getMouseY('hud') < getProperty('Restart.y') + getProperty('Restart.height') and mouseReleased() then
restartSong(false)
cameraFlash('camGame', 'FF0000', 1)
end
end
end

function onTweenCompleted(name)
if name == 'TCAM' then
setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
end
end