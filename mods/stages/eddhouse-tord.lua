function onCreate()
	-- background shit
	makeLuaSprite('sky', 'SkyBox', -1790, -800);
	setScrollFactor('sky', 0.1, 0.5);
	
	makeLuaSprite('cloud', 'Clouds', -2590, -500);
	setScrollFactor('cloud', 0.1, 0.3);
	setProperty('cloud.velocity.x', math.random(5, 15));
	
	makeLuaSprite('houses', 'HousesAndFloor', -1790, -600);
	setScrollFactor('houses', 1, 1);

	makeLuaSprite('woof', 'roof', -1790, -700);
	setScrollFactor('woof', 1, 1);
	-- setObjectOrder('roof',
	-- getObjectOrder('gfGroup')
	-- +10)
	
	if not lowQuality then
	
		makeLuaSprite('city', 'SecondParalax', -1390, -500);
		setScrollFactor('city', 0.65, 0.65);
		scaleObject('city', 0.9, 0.8);
		
		makeLuaSprite('plane', 'Plane', -890, 0);
		setScrollFactor('plane', 0.2, 0.6);
	end
	
	makeLuaSprite('fence', 'Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);

	makeLuaSprite('rock', 'rocks fg', -800, -400);
	setScrollFactor('rock', 0.2, 0.2);

	makeAnimatedLuaSprite('green', 'green-yeet', 250, -750);
	addAnimationByPrefix('green', 'counter', 'counter', 24, true)
	setScrollFactor('green', 1, 1);
	setProperty('green.alpha', 0);
	scaleObject('green', 0.9, 0.9);

	makeLuaSprite('light', 'light', 0, 0);
	setScrollFactor('light', 0.9, 0.9);
	scaleObject('light', 6.0, 6.0);
	setObjectCamera('light', 'other');
	setProperty('light.alpha', 0)

	addLuaSprite('sky', false); --bg
	addLuaSprite('cloud', false);
	addLuaSprite('plane', false);
	addLuaSprite('city', false);
	addLuaSprite('houses', false);
	addLuaSprite('fence', true); --fence lol
	addLuaSprite('woof', true); --if you fix it thanks (bc it goes over dad and bf not just gf)
	addLuaSprite('green', true);
	addLuaSprite('rock', true);
	addLuaSprite('light', true);
end

function onStepHit()
	if curStep == 144 then -- tord plane comin
		doTweenX('PlaneTweenX', 'plane', 1600, 25);
	end
	if curStep == 928 then -- tordbot comnin
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.2, 'linear')
	end
	if curStep == 1008 then
		setProperty('gf.y', -700); -- tord as gf
		setProperty('gf.x', 0); -- tord as gf
	end
	if curStep == 1024 then -- inside tordbot intro
		setProperty('greenI.visible', true)
		doTweenAlpha('hudFunne', 'camHUD', 1, 1, 'linear')
	end
	if curStep == 1984 then -- offsets reason of cuz 'change character' event changing it
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.2, 'linear')
	end
	if curStep == 1987 then --GREEN GUY?!?!
		setProperty('green.alpha', 1);
		doTweenAlpha('dadTweenAlpha', 'dad', 0, 0.1);
	end
	if curStep == 2030 then
		doTweenAlpha('lightTweenA', 'light', 1, 0.1);
	end
	if curStep == 2032 then -- camera getin out of tordbot
		setProperty('gf.y', 130); -- gf comin home
		setProperty('gf.x', 460); -- gf comin home
		doTweenAlpha('arcShakeA', 'arc', 1, 0.1);
		setProperty('green.alpha', 0);
		doTweenAlpha('lightTweenA', 'light', 0, 1);
	end
	if curStep == 2160 then -- well
		doTweenAlpha('hudFunne', 'camHUD', 0.2, 0.2, 'linear')
		doTweenAlpha('SkyTweenAlpha', 'sky', 0.9, 0.2);
		doTweenZoom('ZoominToNeighbours', 'camGame', 0.75, 0.2);
	end
	if curStep == 2164 then -- well
		doTweenAlpha('hudFunne', 'camHUD', 0.5, 0.2, 'linear')
		doTweenAlpha('SkyTweenAlpha2', 'sky', 0.8, 0.2);
		doTweenZoom('ZoominToNeighbours2', 'camGame', 0.8, 0.2);
	end
	if curStep == 2168 then -- well
		doTweenAlpha('hudFunne', 'camHUD', 1, 0.2, 'linear')
		doTweenAlpha('SkyTweenAlpha3', 'sky', 0.7, 0.2);
		doTweenZoom('ZoominToNeighbours3', 'camGame', 0.9, 0.2);
		runTimer('SkyToNormal', 1, 1)
		doTweenAlpha('dadTweenAlpha', 'dad', 1, 0.1);
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'SkyToNormal' then
				doTweenAlpha('SkyTweenAlpha4', 'sky', 1, 2);
			end
		end
	end
end -- hello im serdzhant

function onBeatHit()
	if curBeat % 2 == 0 and curStep > 940 then
		objectPlayAnimation('arc', 'idle', true);
	end
end

function onTweenCompleted(tag) 
	if tag == 'PlaneTweenX' then
		removeLuaSprite('plane', true); -- optimization
	end
	if tag == 'TordTweenY' then
		doTweenY('Tord2TweenY', 'tord', 510, 10, 'linear');
		doTweenX('TordGoesLeft', 'tord', 1200, 1.6, 'cubeInOut');
		objectPlayAnimation('tord', 'mama', true)
	end
	if tag == 'TordGoesLeft' then
		doTweenX('TordGoesRight', 'tord', 1400, 1.6, 'cubeInOut');
	end
	if tag == 'TordGoesRight' then
		doTweenX('TordGoesLeft', 'tord', 1200, 1.6, 'cubeInOut');
	end
	if tag == 'Tord2TweenY' then
		removeLuaSprite('tord');  -- optimization
	end
	if tag == 'tordFallinAgainTweenY' then
		removeLuaSprite('tord2');  -- optimization
	end
	if tag == 'tordbotShakeX' and curStep < 2033 then
		doTweenX('tordbotShakinX', 'tordbot', -210, 0.1);
	end
	if tag == 'tordbotShakinX' and curStep < 2033 then
		doTweenX('tordbotShakeX', 'tordbot', -230, 0.1);
	end
	if tag == 'BfTweenX' then
		runTimer('slideBf', 0.2, 1)
	end
	if tag == 'EddTweenX' then
		runTimer('slideEdd', 0.2, 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'doorGoesInvis' then
		setProperty('doorOpen.alpha', 0);
	end
	if tag == 'tordbotExploded' then
		removeLuaSprite('tordbot'); --optimization
	end
	if tag == 'boom' then
		setProperty('expl.alpha', 0);
	end
	if tag == 'slideEdd' and curStep < 1984 then
		doTweenY('EddTweenY', 'dad', -300, 1, 'cubeIn');
		doTweenX('EddTweenX', 'dad', 0, 1, 'cubeIn');
	end
	if tag == 'slideBf' and curStep < 1984 then
		doTweenY('BfTweenY', 'boyfriend', -300, 1, 'cubeIn');
		doTweenX('BfTweenX', 'boyfriend', 1150, 1, 'cubeIn');
	end
	if tag == 'target' then
		setProperty('targ.alpha', 0);
	end
end

function onCreatePost() -- script by Kevin Kuntz
	makeLuaSprite('greenI', 'green', getProperty('iconP1.x'), getProperty('iconP1.y'))
	setObjectCamera('greenI', 'hud')
	addLuaSprite('greenI', true)
	setObjectOrder('greenI', getObjectOrder('iconP1') + 1)
	setProperty('greenI.flipX', true)
	setProperty('greenI.visible', false)
end

function onUpdatePost(elapsed)
	setProperty('greenI.x', getProperty('iconP1.x') + 50)
	setProperty('greenI.angle', getProperty('iconP1.angle'))
	setProperty('greenI.y', getProperty('iconP1.y') - 50)
	setProperty('greenI.scale.x', getProperty('iconP1.scale.x') - 0.3)
	setProperty('greenI.scale.y', getProperty('iconP1.scale.y') - 0.3)
end