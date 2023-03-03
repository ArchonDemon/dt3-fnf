function onCreate()
	precacheImage('Phase3/Phase3Static')
	precacheImage('Phase3/static')
end

function onEvent(name, value1, value2)
	if name == "static" and value1 == '' then
		makeAnimatedLuaSprite('static', 'Phase3/Phase3Static', 0, 0);
		addAnimationByPrefix('static', 'static', 'Phase3Static instance 1', 24, true);
		setObjectCamera('static', 'other');
		scaleObject('static', 4.0, 4.0);
		addLuaSprite('static', true);
		runTimer('stat', 1.64);
		objectPlayAnimation('static', 'static', true);
	end
	if name == "static" and value1 == 'start' then
		makeAnimatedLuaSprite('startic', 'Phase3/static', -1, -4);
		addAnimationByPrefix('startic', 'startic', 'start', 24, true);
		setObjectCamera('startic', 'other');
		addLuaSprite('startic', true);
		runTimer('startic', 1.64);
		objectPlayAnimation('startic', 'startic', true);
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'stat' then
		removeLuaSprite('static', true);
	end
	if tag == 'startic' then
		removeLuaSprite('startic', true);
	end
end