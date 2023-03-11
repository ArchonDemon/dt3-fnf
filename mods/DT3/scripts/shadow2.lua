-- This script made by BillyLOLwkwk
-- dont ever change this variable from path to cooldown
local path = ''
local scale = 0
local boyX = 0
local boyY = 0
local flipX = false --(Just in case if needed for the next update)
local anim = {}
local i = 0
local ofs = {}
local fps = {}
local cooldown = {false, false, false, false}

-- you can change this one to custom it yourself
local shadow = true -- true if you want turn on the shadow and false if you want turn it off
local range = 0 -- for the shadow range
local duration = 0.75 -- for how long the shadow still

function startWith(text, prefix)
    return text:find(prefix,1,true) == 1
end

function updateShadow()
	path = getProperty('gf.imageFile')
	scale = getProperty('gf.jsonScale')
	boyX = getProperty('gf.x')
	boyY = getProperty('gf.y')
	flipX = getProperty('gf.flipX') 
	for i = 0, getProperty('gf.animationsArray.length')-1 do
		if getPropertyFromGroup('gf.animationsArray', i, 'anim') == 'singLEFT' then
			anim[1] = getPropertyFromGroup('gf.animationsArray', i, 'name')
			ofs[1] = getPropertyFromGroup('gf.animationsArray', i, 'offsets')[1]
			ofs[2] = getPropertyFromGroup('gf.animationsArray', i, 'offsets')[2]
			fps[1] = getPropertyFromGroup('gf.animationsArray', i, 'fps')
		end
		if getPropertyFromGroup('gf.animationsArray', i, 'anim') == 'singDOWN' then
			anim[2] = getPropertyFromGroup('gf.animationsArray', i, 'name')
			ofs[3] = getPropertyFromGroup('gf.animationsArray', i, 'offsets')[1]
			ofs[4] = getPropertyFromGroup('gf.animationsArray', i, 'offsets')[2]
			fps[2] = getPropertyFromGroup('gf.animationsArray', i, 'fps')
		end
		if getPropertyFromGroup('gf.animationsArray', i, 'anim') == 'singUP' then
			anim[3] = getPropertyFromGroup('gf.animationsArray', i, 'name')
			ofs[5] = getPropertyFromGroup('gf.animationsArray', i, 'offsets')[1]
			ofs[6] = getPropertyFromGroup('gf.animationsArray', i, 'offsets')[2]
			fps[3] = getPropertyFromGroup('gf.animationsArray', i, 'fps')
		end
		if getPropertyFromGroup('gf.animationsArray', i, 'anim') == 'singRIGHT' then
			anim[4] = getPropertyFromGroup('gf.animationsArray', i, 'name')
			ofs[7] = getPropertyFromGroup('gf.animationsArray', i, 'offsets')[1]
			ofs[8] = getPropertyFromGroup('gf.animationsArray', i, 'offsets')[2]
			fps[4] = getPropertyFromGroup('gf.animationsArray', i, 'fps')
		end
	end
end
function onCreatePost()
	updateShadow()
end

local shadowAlpha = 0
local alpha = 0

local left = 0
local down = 0
local up = 0
local right = 0

local colorArray = ''
local color = ''

function onUpdate()
	shadowAlpha = left + down + up + right
	if shadowAlpha > 2 then
		alpha = 0.175*(shadowAlpha/2)
	else
		alpha = 0
	end
	boyX = getProperty('gf.x')
	boyY = getProperty('gf.y')

	colorArray = getProperty("gf.healthColorArray")
	color = rgbToHex(colorArray[1], colorArray[2], colorArray[3])
end

function rgbToHex(r, g, b) -- script from HELD der ZEIT, thanks your really cool man
    --%02x: 0 means replace " "s with "0"s, 2 is width, x means hex
    return string.format("%02x%02x%02x",
        math.floor(r),
        math.floor(g),
        math.floor(b))
end

function goodNoteHit(a,b,c,d)
	if c == 'GF Sing' or gfSection then
	if b == 0 then
		left = 1
		runTimer('leftAlpha', 0.4)
	end
	if b == 1 then
		down = 1
		runTimer('downAlpha', 0.4)
	end
	if b == 2 then
		up = 1
		runTimer('upAlpha', 0.4)
	end
	if b == 3 then
		right = 1
		runTimer('rightAlpha', 0.4)
	end	

	if shadow and shadowAlpha > 1.9 and (d == false or (d == true and cooldown[b+1])) then
		local tag = 'gfshadow'..tostring(i)
		makeAnimatedLuaSprite(tag, path, boyX, boyY)
		addAnimationByPrefix(tag, 'act', anim[b+1], fps[b+1], false)
		addLuaSprite(tag, false)
		setObjectOrder(tag, getObjectOrder('gfGroup')-1)
		setProperty(tag ..'.alpha', alpha)
		doTweenAlpha(tag..'alpha', tag, 0, duration, easeOut)
		doTweenColor(tag..'color', tag, color, 0.01)
		setProperty(tag..'.offset.x', ofs[b*2+1])
		setProperty(tag..'.offset.y', ofs[b*2+2])
		setProperty(tag..'.scale.x', scale)
		setProperty(tag..'.scale.y', scale)
		setProperty(tag..'.flipX', flipX)
		objectPlayAnimation(tag, 'act', true)
		cooldown[b+1] = false
		if b == 0 then
			doTweenX(tag, tag, boyX - range, duration, easeOut)
			runTimer('left', duration)
		end
		if b == 1 then
			doTweenY(tag, tag, boyY + range, duration, easeOut)
			runTimer('down', duration)
		end
		if b == 2 then
			doTweenY(tag, tag, boyY - range, duration, easeOut)
			runTimer('up', duration)
		end
		if b == 3 then
			doTweenX(tag, tag, boyX + range, duration, easeOut)
			runTimer('right', duration)
		end
		i = i + 1
	end
	end
end

function opponentNoteHit(a,b,c,d)
	if c == 'GF Sing' or gfSection then
	if b == 0 then
		left = 1
		runTimer('leftAlpha', 0.4)
	end
	if b == 1 then
		down = 1
		runTimer('downAlpha', 0.4)
	end
	if b == 2 then
		up = 1
		runTimer('upAlpha', 0.4)
	end
	if b == 3 then
		right = 1
		runTimer('rightAlpha', 0.4)
	end	

	if shadow and (d == false or (d == true and cooldown[b+1])) then
		local tag = 'gfshadow'..tostring(i)
		makeAnimatedLuaSprite(tag, path, boyX, boyY)
		addAnimationByPrefix(tag, 'act', anim[b+1], fps[b+1], false)
		addLuaSprite(tag, false)
		setObjectOrder(tag, getObjectOrder('gfGroup')-1)
		setProperty(tag ..'.alpha', alpha)
		doTweenAlpha(tag..'alpha', tag, 0, duration, easeOut)
		doTweenColor(tag..'color', tag, color, 0.01)
		setProperty(tag..'.offset.x', ofs[b*2+1])
		setProperty(tag..'.offset.y', ofs[b*2+2])
		setProperty(tag..'.scale.x', scale)
		setProperty(tag..'.scale.y', scale)
		setProperty(tag..'.flipX', flipX)
		objectPlayAnimation(tag, 'act', true)
		cooldown[b+1] = false
		if b == 0 then
			doTweenX(tag, tag, boyX - range, duration, easeOut)
			runTimer('left', duration)
		end
		if b == 1 then
			doTweenY(tag, tag, boyY + range, duration, easeOut)
			runTimer('down', duration)
		end
		if b == 2 then
			doTweenY(tag, tag, boyY - range, duration, easeOut)
			runTimer('up', duration)
		end
		if b == 3 then
			doTweenX(tag, tag, boyX + range, duration, easeOut)
			runTimer('right', duration)
		end
		i = i + 1
	end
	end
end

function onTweenCompleted(tag)
	if startwith(tag, 'shadow') then
		removeLuaSprite(tag, true)
	end
end

function onTimerCompleted(tag)
	if tag == 'left' then
		cooldown[1] = true
	end
	if tag == 'down' then
		cooldown[2] = true
	end
	if tag == 'up' then
		cooldown[3] = true
	end
	if tag == 'right' then
		cooldown[4] = true
	end

	if tag == 'leftAlpha' then
		left = 0
	end
	if tag == 'downAlpha' then
		down = 0
	end
	if tag == 'upAlpha' then
		up = 0
	end
	if tag == 'rightAlpha' then
		right = 0
	end
end

function onEvent(n,v1,v2)
	if n == "shadow" then
		if v1 == 'shadow' then
			if v2 == 'true' then
				shadow = true
			else
				shadow = false
			end
		end
		if v1 == 'duration' then
			duration = v2
		end
		if v1 == 'range' then
			range = v2
		end
	end
	if n == "Change Character" then
		updateShadow()
	end
end

