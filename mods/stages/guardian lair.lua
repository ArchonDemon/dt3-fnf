function onCreate()
	-- background shit
	makeLuaSprite('bg', 'guardian lair/bg', -1500, -1500);
	setScrollFactor('bg', 0.9, 0.9);
	addLuaSprite('bg', false);

	makeLuaSprite('bg light', 'guardian lair/bg light', -1500, -1500);
	setScrollFactor('bg light', 0.9, 0.9);
	addLuaSprite('bg light', false);

	makeLuaSprite('ground', 'guardian lair/ground', -1500, -1500);
	setScrollFactor('ground', 0.9, 0.9);
	addLuaSprite('ground', false);

	makeLuaSprite('walls', 'guardian lair/walls', -1500, -1500);
	setScrollFactor('walls', 0.9, 0.9);
	addLuaSprite('walls', false);

	makeLuaSprite('stuff', 'guardian lair/stuff', -1500, -1500);
	setScrollFactor('stuff', 0.9, 0.9);
	addLuaSprite('stuff', false);

	makeLuaSprite('light', 'guardian lair/light', -1500, -1500);
	setScrollFactor('light', 0.9, 0.9);
	addLuaSprite('light', true);

	setProperty('defaultCamZoom',1)
end

function onUpdate()
	setProperty('gf.alpha', 0)
end