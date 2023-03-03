local fire = false

function onCreate()
    makeAnimatedLuaSprite('fire', 'fucking annoying fire shit why did I make this', -300, 800);
    addAnimationByPrefix('fire', 'idle', 'idle', 16, true);
	objectPlayAnimation('fire', 'idle', false);
    setProperty('fire.alpha', 0);
	setObjectCamera('fire', 'other')
	addLuaSprite('fire', false);
end

function onEvent(name, value1, value2)
    if name == 'fire2' then --change "health drain" to your event file's name
        fire = not fire
    end
end
function onUpdate()
    if fire then
        setProperty('health', getProperty('health') - 0.0005)
        doTweenAlpha('fireA', 'fire', 1, 0.8, 'quintOut');
	else
		doTweenAlpha('fireA', 'fire', 0, 0.8, 'quintOut');
    end

	if fire then
    if getProperty('health') < 0.2 then
		doTweenY('fire', 'fire', 300, 0.2, 'sineOut')
		doTweenAlpha('fireA2', 'fire', 0.5, 0.2, 'quintOut')
	elseif getProperty('health') < 0.3 then
		doTweenY('fire', 'fire', 320, 0.2, 'sineOut')
		doTweenAlpha('fireA2', 'fire', 0.6, 0.2, 'quintOut')
	elseif getProperty('health') < 0.4 then
		doTweenY('fire', 'fire', 340, 0.2, 'sineOut');
		doTweenAlpha('fireA2', 'fire', 0.7, 0.2, 'quintOut')
	elseif getProperty('health') < 0.5 then
		doTweenY('fire', 'fire', 360, 0.2, 'sineOut')
		doTweenAlpha('fireA2', 'fire', 0.8, 0.2, 'quintOut')
	elseif getProperty('health') < 0.6 then
		doTweenY('fire', 'fire', 380, 0.2, 'sineOut')
		doTweenAlpha('fireA2', 'fire', 0.9, 0.2, 'quintOut')
	elseif getProperty('health') < 0.7 then
		doTweenY('fire', 'fire', 400, 0.2, 'sineOut')
		doTweenAlpha('fireA2', 'fire', 1, 0.2, 'quintOut')
	elseif getProperty('health') < 0.8 then
		doTweenY('fire', 'fire', 420, 0.2, 'sineOut')
	elseif getProperty('health') < 0.9 then
		doTweenY('fire', 'fire', 440, 0.2, 'sineOut')
	elseif getProperty('health') < 1 then
		doTweenY('fire', 'fire', 460, 0.2, 'sineOut')
	elseif getProperty('health') < 1.1 then
		doTweenY('fire', 'fire', 480, 0.2, 'sineOut')
	elseif getProperty('health') < 1.2 then
		doTweenY('fire', 'fire', 500, 0.2, 'sineOut')
	elseif getProperty('health') < 1.3 then
		doTweenY('fire', 'fire', 550, 0.2, 'sineOut')
	elseif getProperty('health') < 1.4 then
		doTweenY('fire', 'fire', 600, 0.2, 'sineOut')
	elseif getProperty('health') < 1.5 then
		doTweenY('fire', 'fire', 800, 0.2, 'sineOut')
	end
	end
end