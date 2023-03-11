function onCreatePost()
	dad = getProperty('boyfriend.healthicon')
	bf = getProperty('boyfriend.healthicon')

	makeAnimatedLuaSprite('animatedicon', 'icons/ani-bf', getProperty('iconP1.x'), getProperty('iconP1.y'))
	addAnimationByPrefix('animatedicon', 'normal', 'normal0', 24, false)
	addAnimationByPrefix('animatedicon', 'hpup', 'normal + hp', 24, false)
	addAnimationByPrefix('animatedicon', 'hpdown', 'normal - hp', 24, false)
	addAnimationByPrefix('animatediconl', 'losing', 'losing0', 24, false)
	addAnimationByPrefix('animatediconl', 'lhpup', 'losing + hp', 24, false)
	addAnimationByPrefix('animatediconl', 'lhpdown', 'losing - hp', 24, false)
	setScrollFactor('animatedicon', 0, 0)
	setObjectCamera('animatedicon', 'other')
	addLuaSprite('animatedicon', true)
	setObjectOrder('animatedicon', 99)
	setProperty('animatedicon.visible', true)
	setProperty('animatedicon.flipX', true)
	objectPlayAnimation('animatedicon', 'normal', false)

	makeAnimatedLuaSprite('animatedicon2', 'icons/ani-green', getProperty('iconP2.x'), getProperty('iconP2.y'))
	addAnimationByPrefix('animatedicon2', 'normal', 'normal0', 24, false)
	addAnimationByPrefix('animatedicon2', 'hpup', 'normal + hp', 24, false)
	addAnimationByPrefix('animatedicon2', 'hpdown', 'normal - hp', 24, false)
	addAnimationByPrefix('animatedicon2', 'losing', 'losing0', 24, false)
	addAnimationByPrefix('animatedicon2', 'lhpup', 'losing + hp', 24, false)
	addAnimationByPrefix('animatedicon2', 'lhpdown', 'losing - hp', 24, false)
	setScrollFactor('animatedicon2', 0, 0)
	setObjectCamera('animatedicon2', 'other')
	addLuaSprite('animatedicon2', true)
	setObjectOrder('animatedicon2', 99)
	setProperty('animatedicon2.visible', true)
	objectPlayAnimation('animatedicon2', 'normal', false)
end

local Ibf = true
local Idad = true

function onUpdate(elapsed)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedicon.x', getProperty('iconP1.x'))
	setProperty('animatedicon.angle', getProperty('iconP1.angle'))
	setProperty('animatedicon.y', getProperty('iconP1.y') + 15)
	setProperty('animatedicon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('animatedicon.scale.y', getProperty('iconP1.scale.y'))
	setProperty('animatedicon2.x', getProperty('iconP2.x'))
	setProperty('animatedicon2.angle', getProperty('iconP2.angle'))
	setProperty('animatedicon2.y', getProperty('iconP2.y') + 15)
	setProperty('animatedicon2.scale.x', getProperty('iconP2.scale.x'))
	setProperty('animatedicon2.scale.y', getProperty('iconP2.scale.y'))
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)

	if getProperty('health') > 1.6 then
		Idad = false
	elseif getProperty('health') < 0.4 then
		Ibf = false
	else
		Idad = true
		Ibf = true
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if Ibf == true and Idad == true then
		objectPlayAnimation('animatedicon', 'hpup', true)
		objectPlayAnimation('animatedicon2', 'hpdown', true)
	elseif Ibf == false then
		objectPlayAnimation('animatedicon', 'lhpup', true)
		objectPlayAnimation('animatedicon2', 'hpdown', true)
	elseif Idad == false then
		objectPlayAnimation('animatedicon', 'hpup', true)
		objectPlayAnimation('animatedicon2', 'lhpdown', true)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if Ibf == true and Idad == true then
		objectPlayAnimation('animatedicon', 'hpdown', true)
		objectPlayAnimation('animatedicon2', 'hpup', true)
	elseif Ibf == false then
		objectPlayAnimation('animatedicon', 'lhpdown', true)
		objectPlayAnimation('animatedicon2', 'hpup', true)
	elseif Idad == false then
		objectPlayAnimation('animatedicon', 'hpdown', true)
		objectPlayAnimation('animatedicon2', 'lhpup', true)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if Ibf == true and Idad == true then
		objectPlayAnimation('animatedicon', 'hpdown', true)
		objectPlayAnimation('animatedicon2', 'hpup', true)
	elseif Ibf == false then
		objectPlayAnimation('animatedicon', 'lhpdown', true)
		objectPlayAnimation('animatedicon2', 'hpup', true)
	elseif Idad == false then
		objectPlayAnimation('animatedicon', 'hpdown', true)
		objectPlayAnimation('animatedicon2', 'lhpup', true)
	end
end