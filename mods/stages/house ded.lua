function onCreate()
	-- background shit
	makeLuaSprite('hell', 'hell', -600, -250);
	setScrollFactor('hell', 0.5, 0.9);
	addLuaSprite('hell', false);

	makeLuaSprite('house', 'house ded', -600, -250);
	setScrollFactor('house', 0.9, 0.9);
	addLuaSprite('house', false);

	makeLuaSprite('rocks', 'rocks fg', -600, -250);
	setScrollFactor('rocks', 0.9, 0.9);
	addLuaSprite('rocks', true);
	setProperty('rocks.alpha', 0)

	makeLuaSprite('nightmare', 'nightmare', -600, -250);
	setScrollFactor('nightmare', 0.9, 0.9);
	addLuaSprite('nightmare', false);

	makeLuaSprite('light', 'light', 0, 0);
	setScrollFactor('light', 0.9, 0.9);
	scaleObject('light', 6.0, 6.0);
	setObjectCamera('light', 'other');
	addLuaSprite('light', true);
	setProperty('light.alpha', 0)

	setProperty('defaultCamZoom',0.6)
end

function onStepHit()
	if curStep == 1296 then
	doTweenAlpha('lightAlpha', 'light', 1, 0.1);
	doTweenAlpha('ntAlpha', 'nightmare', 0, 0.1);
	end
	if curStep == 1300 then
	doTweenAlpha('rocksAlpha', 'rocks', 1, 1);
	doTweenAlpha('lightAlpha', 'light', 0, 1);
	end
end