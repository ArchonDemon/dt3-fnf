function onCreate()
	makeLuaSprite('light', 'light', 0, 0);
	setScrollFactor('light', 0.9, 0.9);
	scaleObject('light', 6.0, 6.0);
	setObjectCamera('light', 'other');
	addLuaSprite('light', true);
	setProperty('light.alpha', 0)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)  
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
    end
end

function onEvent(f)
	if f == 'Change Character' then
		setProperty('light.alpha', 1);
		runTimer('light', 0.1, 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'light' then
		doTweenAlpha('lightAlpha', 'light', 0, 0.2);
	end
end