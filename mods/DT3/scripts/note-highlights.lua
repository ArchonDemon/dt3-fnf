function onCreate()
	makeAnimatedLuaSprite('highlights', 'highlights', 0, 0)
	addAnimationByPrefix('highlights', 'highlights', 'note highlight', 24, true);
	setObjectCamera('highlights', 'hud')
	addLuaSprite('highlights', false)
	objectPlayAnimation('highlights', 'highlights', false);
	scaleObject('highlights', 0.68, 0.69)
end

function onUpdate()
	setProperty('highlights.x', defaultPlayerStrumX0 - 85)
	setProperty('highlights.y', defaultPlayerStrumY0 - 35)
	if songName == 'Shop' then
        setProperty('highlights.alpha', 0)
    end
end