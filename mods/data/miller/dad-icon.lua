function onCreatePost()
	if not hideHud then
	makeAnimatedLuaSprite('icon3dad', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
	loadGraphic('icon3dad', 'icons/icon-dad', 150)
	addAnimation('icon3dad', 'icons/icon-dad', {0, 1}, 0, true)
	addAnimation('icon3dad', 'icons/icon-dad', {1, 0}, 0, true)
	addLuaSprite('icon3dad', true)
  	setProperty('icon3dad.flipX', true)
	--setProperty('icon3dad.antialiasing', false)
	setObjectOrder('icon3dad', getObjectOrder('iconP1') - 1)
	setObjectCamera('icon3dad', 'hud')
	end
end

function onUpdatePost()
	if not hideHud then
	setProperty('icon3dad.y', getProperty('iconP1.y') + 50)
	setProperty('icon3dad.x', getProperty('iconP1.x') + 50)
	setProperty('icon3dad.scale.x', getProperty('iconP1.scale.x') - 0.15)
	setProperty('icon3dad.scale.y', getProperty('iconP1.scale.y') - 0.15)
	setObjectOrder('icon3dad', getObjectOrder('iconP1') - 1)
	setProperty('icon3dad.angle', getProperty('iconP1.angle'))
	setProperty('icon3dad.alpha', getProperty('gf.alpha'))
	setProperty('icon3dad.visible', getProperty('gf.visible'))
	end
	if ded == false then
		if getProperty('health') < 0.4 then
			setProperty('icon3dad.animation.curAnim.curFrame', '1')
		else
			setProperty('icon3dad.animation.curAnim.curFrame', '0')
		end
	elseif ded == true then
		setProperty('icon3dad.animation.curAnim.curFrame', '1')
	end
end
local ded = false
function onEvent(n,v1,v2)
	if n == 'Object Play Animation' and v1 == 'peter' then
		ded = true
	end
end