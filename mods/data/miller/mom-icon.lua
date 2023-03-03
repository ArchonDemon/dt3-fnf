function onCreatePost()
	if not hideHud then
	makeAnimatedLuaSprite('icon3mom', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
	loadGraphic('icon3mom', 'icons/icon-mom', 150)
	addAnimation('icon3mom', 'icons/icon-mom', {0, 1}, 0, true)
	addAnimation('icon3mom', 'icons/icon-mom', {1, 0}, 0, true)
	addLuaSprite('icon3mom', true)
  	setProperty('icon3mom.flipX', true)
	--setProperty('icon3mom.antialiasing', false)
	setObjectOrder('icon3mom', getObjectOrder('iconP1') - 1)
	setObjectCamera('icon3mom', 'hud')
	end
end
function onUpdatePost()
	if not hideHud then
	setProperty('icon3mom.y', getProperty('iconP1.y') - 50)
	setProperty('icon3mom.x', getProperty('iconP1.x') - 50)
	setProperty('icon3mom.scale.x', getProperty('iconP1.scale.x') - 0.15)
	setProperty('icon3mom.scale.y', getProperty('iconP1.scale.y') - 0.15)
	setObjectOrder('icon3mom', getObjectOrder('iconP1') - 1)
	setProperty('icon3mom.angle', getProperty('iconP1.angle'))
	setProperty('icon3mom.alpha', getProperty('gf.alpha'))
	setProperty('icon3mom.visible', getProperty('gf.visible'))
	end
	if ded == false then
		if getProperty('health') < 0.4 then
			setProperty('icon3mom.animation.curAnim.curFrame', '1')
		else
			setProperty('icon3mom.animation.curAnim.curFrame', '0')
		end
	elseif ded == true then
		setProperty('icon3mom.animation.curAnim.curFrame', '1')
	end
end
local ded = false
function onEvent(n,v1,v2)
	if n == 'Object Play Animation' and v1 == 'steven' then
		ded = true
	end
end