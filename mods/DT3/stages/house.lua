function onCreate()
	-- background shit
	makeLuaSprite('house', 'house', -600, -250);
	setScrollFactor('house', 0.9, 0.9);
	addLuaSprite('house', false);

	setProperty('defaultCamZoom',0.7)
end