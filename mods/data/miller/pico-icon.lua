function onCreatePost()
	if not hideHud then
	makeAnimatedLuaSprite('icon3pico', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
	loadGraphic('icon3pico', 'icons/icon-pico', 150)
	addAnimation('icon3pico', 'icons/icon-pico', {0, 1}, 0, true)
	addAnimation('icon3pico', 'icons/icon-pico', {1, 0}, 0, true)
	addLuaSprite('icon3pico', true)
  	setProperty('icon3pico.flipX', true)
	--setProperty('icon3pico.antialiasing', false)
	setObjectOrder('icon3pico', getObjectOrder('iconP1') - 1)
	setObjectCamera('icon3pico', 'hud')
	end
end
function onUpdatePost()
	if not hideHud then
	setProperty('icon3pico.y', getProperty('iconP1.y') - 50)
	setProperty('icon3pico.x', getProperty('iconP1.x') + 50)
	setProperty('icon3pico.scale.x', getProperty('iconP1.scale.x') - 0.15)
	setProperty('icon3pico.scale.y', getProperty('iconP1.scale.y') - 0.15)
	setObjectOrder('icon3pico', getObjectOrder('iconP1') - 1)
	setProperty('icon3pico.angle', getProperty('iconP1.angle'))
	setProperty('icon3pico.alpha', getProperty('gf.alpha'))
	setProperty('icon3pico.visible', getProperty('gf.visible'))
	end
	if ded == false then
		if getProperty('health') < 0.4 then
			setProperty('icon3pico.animation.curAnim.curFrame', '1')
		else
			setProperty('icon3pico.animation.curAnim.curFrame', '0')
		end
	elseif ded == true then
		setProperty('icon3pico.animation.curAnim.curFrame', '1')
	end
end
local ded = false
function onEvent(n,v1,v2)
	if n == 'Object Play Animation' and v1 == 'dee' then
		ded = true
	end
end