local modchart = true

function onCreate()
	-- background shit
	makeLuaSprite('bg', 'hell/bg', -200, -150);
	setScrollFactor('bg', 0.5, 0.5);
	addLuaSprite('bg', false);

	makeLuaSprite('fg', 'hell/fg', -200, 0);
	setScrollFactor('fg', 1, 1);
	addLuaSprite('fg', false);

	setProperty('defaultCamZoom', 1)
	setProperty('health', 2.0);
end

function onUpdate()
    if mustHitSection == false then
		setProperty('defaultCamZoom',1.4)
    else
		setProperty('defaultCamZoom',1)
    end 
end