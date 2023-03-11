	-- Port By Lechan (Jos), Bubcraft19, Enginer Gaming

function onCreate()
    makeLuaSprite('funsky', 'Sonicsus/MajinStage/sonicFUNsky', -472, -130)
	scaleObject('funsky', 0.9, 0.9);
    setScrollFactor('funsky', 0.3, 0.3);
    
    makeLuaSprite('funbush', 'Sonicsus/MajinStage/Bush2', -42, 371)
    setScrollFactor('funbush', 0.4, 0.4);
    
    makeAnimatedLuaSprite('funpillarts2ANIM', 'Sonicsus/MajinStage/Majin Boppers Back', 182, -100)
    addAnimationByPrefix('funpillarts2ANIM', 'bumpypillar', 'MajinBop2 instance 1', 24, true)
	objectPlayAnimation('funpillarts2ANIM', 'bumpypillar', true)
    setScrollFactor('funpillarts2ANIM', 0.5, 0.5);
    
    makeLuaSprite('funbush2', 'Sonicsus/MajinStage/Bush 1', 132, 554)
    setScrollFactor('funbush2', 0.6, 0.6);
    
    makeAnimatedLuaSprite('funpillarts1ANIM', 'Sonicsus/MajinStage/Majin Boppers Front', -169, -167)
    addAnimationByPrefix('funpillarts1ANIM', 'bumpypillar', 'MajinBop1 instance 1', 24, true)
	objectPlayAnimation('funpillarts1ANIM', 'bumpypillar', true)
    setScrollFactor('funpillarts1ANIM', 0.7, 0.7);
    
    makeLuaSprite('funfloor', 'Sonicsus/MajinStage/floor BG', -340, 860)
    setScrollFactor('funfloor', 1, 1);
    
    makeAnimatedLuaSprite('funboppers1ANIM', 'Sonicsus/MajinStage/majin FG1', 1126, 903)
    addAnimationByPrefix('funboppers1ANIM', 'bumpypillar', 'majin front bopper1', 24, true)
	objectPlayAnimation('funboppers1ANIM', 'bumpypillar', true)
    setScrollFactor('funboppers1ANIM', 0.9, 0.9);
    
    makeAnimatedLuaSprite('funboppers2ANIM', 'Sonicsus/MajinStage/majin FG2', -293, 871)
    addAnimationByPrefix('funboppers2ANIM', 'bumpypillar', 'majin front bopper2', 24, true)
	objectPlayAnimation('funboppers2ANIM', 'bumpypillar', true)
    setScrollFactor('funboppers2ANIM', 1, 1);
    
    addLuaSprite('funsky', false)
    addLuaSprite('funbush', false)
    addLuaSprite('funpillarts2ANIM', false)
    addLuaSprite('funbush2', false)
    addLuaSprite('funpillarts1ANIM', false)
    addLuaSprite('funfloor', false)
    addLuaSprite('funboppers1ANIM', true)
    addLuaSprite('funboppers2ANIM', true)
end

local followchars = true;
local del = 0;
local del2 = 0;
local notePosX = 0
local notePosY = 0
local notePosX2 = 0
local notePosY2 = 0
local ofs = 50;