function onCreatePost()
	if not hideHud then
	makeAnimatedLuaSprite('icon3evil', nil, getProperty('iconP1.x'), getProperty('iconP1.y'))
	loadGraphic('icon3evil', 'icons/icon-evil', 150)
	addAnimation('icon3evil', 'icons/icon-evil', {0, 1}, 0, true)
	addAnimation('icon3evil', 'icons/icon-evil', {1, 0}, 0, true)
	addLuaSprite('icon3evil', true)
  	setProperty('icon3evil.flipX', true)
	--setProperty('icon3evil.antialiasing', false)
	setObjectOrder('icon3evil', getObjectOrder('iconP1') - 1)
	setObjectCamera('icon3evil', 'hud')
	end
end
function onUpdatePost()
	if not hideHud then
	setProperty('icon3evil.y', getProperty('iconP1.y') + 75)
	setProperty('icon3evil.x', getProperty('iconP1.x') + 0)
	setProperty('icon3evil.scale.x', getProperty('iconP1.scale.x') - 0.15)
	setProperty('icon3evil.scale.y', getProperty('iconP1.scale.y') - 0.15)
	setObjectOrder('icon3evil', getObjectOrder('iconP1') - 1)
	setProperty('icon3evil.angle', getProperty('iconP1.angle'))
	setProperty('icon3evil.alpha', getProperty('bf.alpha'))
	setProperty('icon3evil.visible', getProperty('bf.visible'))
	end
	if getProperty('health') < 0.4 then
		setProperty('icon3evil.animation.curAnim.curFrame', '1')
	else
		setProperty('icon3evil.animation.curAnim.curFrame', '0')
	end
end