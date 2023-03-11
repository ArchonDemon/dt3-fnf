local modchart = true

function onCreate()
	-- background shit
	makeLuaSprite('bg', 'bg', -130, -130);
	setScrollFactor('bg', 0, 0);
	addLuaSprite('bg', false);

	makeAnimatedLuaSprite('fog', 'fog', -350, -130)
	addAnimationByPrefix('fog', 'idle', 'fog', 10, true)
	objectPlayAnimation('fog', 'idle', true)
	setScrollFactor('fog', 0, 0);
	addLuaSprite('fog', false);

	makeAnimatedLuaSprite('fog2', 'fog', -350, -130)
	addAnimationByPrefix('fog2', 'idle', 'fog', 15, true)
	objectPlayAnimation('fog2', 'idle', true)
	setScrollFactor('fog2', 0, 0);
	setProperty('fog2.alpha', 0.25)
	addLuaSprite('fog2', true);

	makeAnimatedLuaSprite('rain', 'rain', -100, -130)
	addAnimationByPrefix('rain', 'idle', 'rain', 24, true)
	objectPlayAnimation('rain', 'idle', true)
	setScrollFactor('rain', 0, 0);
	addLuaSprite('rain', true);

	setProperty('defaultCamZoom', 1)
end

function onStepHit()
	if curStep == 1 then -- tord plane comin
		doTweenX('PlaneTweenX', 'boyfriend', 50000, 221);
	end
end

function onUpdate(elapsed)
	if modchart == true then
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
	end
end