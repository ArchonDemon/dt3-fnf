function onCreate()
	-- background shit
	makeLuaSprite('bg', 'C_00', -130, -130);
	setScrollFactor('bg', 0, 0);
	addLuaSprite('bg', false);

	setProperty('defaultCamZoom', 1)
end

function onStepHit()
	triggerEvent('Camera Follow Pos', 500, 500);
	triggerEvent('Change Character', '0', 'bf');
end