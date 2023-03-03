function onCreate()
	makeLuaSprite('bfIcon', 'black', 0, 0)
	setObjectCamera('bfIcon', 'hud')
	setObjectOrder('bfIcon', '0')
	addLuaSprite('bfIcon', true)
	setProperty('bfIcon.alpha', 0)

	makeLuaSprite('dadIcon', 'black', 0, 0)
	setObjectCamera('dadIcon', 'hud')
	setObjectOrder('dadIcon', '0')
	addLuaSprite('dadIcon', true)
	setProperty('dadIcon.alpha', 0)
end

local Icon = 0
local turnvalue = 30
local IconLol = 40
local turnvalue2 = 20

function goodNoteHit(id, direction, noteType, isSustainNote)

	if direction == 0 then
		setProperty('bfIcon.angle',turnvalue2)
		doTweenAngle('iconTween','bfIcon',0,crochet/1000,'circOut')
		setProperty('bfIcon.x', Icon - IconLol)
		doTweenX('iconTweenX','bfIcon',Icon,crochet/1000,'circOut')
	elseif direction == 1 then
		setProperty('bfIcon.y', Icon + IconLol)
		doTweenY('iconTweenY','bfIcon',Icon,crochet/1000,'circOut')
		setProperty('bfIcon.angle',-turnvalue)
		doTweenAngle('iconTween','bfIcon',0,crochet/500,'circOut')
	elseif direction == 2 then
		setProperty('bfIcon.y', Icon - IconLol)
		doTweenY('iconTweenY','bfIcon',Icon,crochet/1000,'circOut')
		setProperty('bfIcon.angle',turnvalue)
		doTweenAngle('iconTween','bfIcon',0,crochet/500,'circOut')
	elseif direction == 3 then
		setProperty('bfIcon.angle',-turnvalue2)
		doTweenAngle('iconTween','bfIcon',0,crochet/1000,'circOut')
		setProperty('bfIcon.x', Icon + IconLol)
		doTweenX('iconTweenX','bfIcon',Icon,crochet/1000,'circOut')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if health > 0.1 then
		setProperty('health', health-0.0125)
	end
	if direction == 0 then
		setProperty('dadIcon.angle',turnvalue2)
		doTweenAngle('iconTween2','dadIcon',0,crochet/1000,'circOut')
		setProperty('dadIcon.x', Icon - IconLol)
		doTweenX('iconTween2X','dadIcon',Icon,crochet/1000,'circOut')
	elseif direction == 1 then
		setProperty('dadIcon.y', Icon + IconLol)
		doTweenY('iconTween2Y','dadIcon',Icon,crochet/1000,'circOut')
		setProperty('dadIcon.angle',turnvalue)
		doTweenAngle('iconTween2','dadIcon',0,crochet/500,'circOut')
	elseif direction == 2 then
		setProperty('dadIcon.y', Icon - IconLol)
		doTweenY('iconTween2Y','dadIcon',Icon,crochet/1000,'circOut')
		setProperty('dadIcon.angle',-turnvalue)
		doTweenAngle('iconTween2','dadIcon',0,crochet/500,'circOut')
	elseif direction == 3 then
		setProperty('dadIcon.angle',-turnvalue2)
		doTweenAngle('iconTween2','dadIcon',0,crochet/1000,'circOut')
		setProperty('dadIcon.x', Icon + IconLol)
		doTweenX('iconTween2X','dadIcon',Icon,crochet/1000,'circOut')
	end
end

function onUpdate()
	makeAnimatedLuaSprite('iconBF', nil, getProperty('iconP1.x') + getProperty('bfIcon.x'), getProperty('iconP1.y') + getProperty('bfIcon.y'))
	loadGraphic('iconBF', 'icons/icon-'..getProperty('boyfriend.healthIcon'), 150)
	addAnimation('iconBF', 'icons/icon-'..getProperty('boyfriend.healthIcon'), {0, 1, 2, 3}, 0, true)
	addAnimation('iconBF', 'icons/icon-'..getProperty('boyfriend.healthIcon'), {1, 0, 2, 3}, 0, true)
	addAnimation('iconBF', 'icons/icon-'..getProperty('boyfriend.healthIcon'), {2, 1, 0, 3}, 0, true)	
	addAnimation('iconBF', 'icons/icon-'..getProperty('boyfriend.healthIcon'), {3, 1, 2, 0}, 0, true)
	addLuaSprite('iconBF', true)
	--setProperty('iconBF.antialiasing', false)
	setObjectOrder('iconBF', getObjectOrder('iconP1') + 1)
	setObjectCamera('iconBF', 'hud')
	setProperty('iconBF.angle', getProperty('bfIcon.angle'))

	makeAnimatedLuaSprite('iconDAD', nil, getProperty('iconP2.x') + getProperty('dadIcon.x'), getProperty('iconP2.y') + getProperty('dadIcon.y'))
	loadGraphic('iconDAD', 'icons/icon-'..getProperty('dad.healthIcon'), 150)
	addAnimation('iconDAD', 'icons/icon-'..getProperty('dad.healthIcon'), {0, 1, 2, 3}, 0, true)
	addAnimation('iconDAD', 'icons/icon-'..getProperty('dad.healthIcon'), {1, 0, 2, 3}, 0, true)
	addAnimation('iconDAD', 'icons/icon-'..getProperty('dad.healthIcon'), {2, 1, 0, 3}, 0, true)	
	addAnimation('iconDAD', 'icons/icon-'..getProperty('dad.healthIcon'), {3, 1, 2, 0}, 0, true)
	addLuaSprite('iconDAD', true)
	--setProperty('iconDAD.antialiasing', false)
	setObjectOrder('iconDAD', getObjectOrder('iconP1') + 1)
	setObjectCamera('iconDAD', 'hud')
	setProperty('iconDAD.angle', getProperty('dadIcon.angle'))

	setProperty('iconBF.flipX', true)
	setProperty('iconDAD.flipX', false)

	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	
	health = getProperty('health')

	if bfHP > 20 then
		setProperty('iconBF.animation.curAnim.curFrame', '1')
	elseif dadHP < 40 then
		setProperty('iconBF.animation.curAnim.curFrame', '2')
	elseif dadHP < 40 and bfHP < 20 then
		setProperty('iconBF.animation.curAnim.curFrame', '3')
	else
		setProperty('iconBF.animation.curAnim.curFrame', '0')
	end
	if dadHP > 40 then
		setProperty('iconDAD.animation.curAnim.curFrame', '1')
	elseif bfHP < 20 then
		setProperty('iconDAD.animation.curAnim.curFrame', '2')
	elseif dadHP < 40 and bfHP < 20 then
		setProperty('iconDAD.animation.curAnim.curFrame', '3')
	else
		setProperty('iconDAD.animation.curAnim.curFrame', '0')
	end
end