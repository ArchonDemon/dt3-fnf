-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz

local alpha = 0

function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('bf', 'characters/evil-bf', 4166.05, 4560.95);
	addAnimationByPrefix('bf', 'idle', 'BF idle dance', 30, true);
	addAnimationByPrefix('bf', 'singLEFT', 'BF NOTE LEFT', 30, false);
	addAnimationByPrefix('bf', 'singDOWN', 'BF NOTE DOWN', 30, false);
	addAnimationByPrefix('bf', 'singUP', 'BF NOTE UP', 30, false);
	addAnimationByPrefix('bf', 'singRIGHT', 'BF NOTE RIGHT', 30, false);

	updateHitbox('bf')
	setProperty('bf.antialiasing', false)
	setProperty('bf.alpha', 0)
	addLuaSprite('bf', false);

	playAnimation('bf', 'idle', false);
	doTweenY('floatUp', 'bf', getProperty('bf.y') - 20, duration, 'sineInOut')
end

animationsList = {}
holdTimers = {steven = 15.0};
singAnimations = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'};
function makeAnimationList()
	animationsList['idle'] = 'idle';
	animationsList['singLEFT'] = 'singLEFT';
	animationsList['singDOWN'] = 'singDOWN';
	animationsList['singUP'] = 'singUP';
	animationsList['singRIGHT'] = 'singRIGHT';
end

offsetsbf = {};
function makeOffsets()
	offsetsbf['idle'] = {x = 0, y = 0}; --idle
	offsetsbf['singLEFT'] = {x = 140, y = 34}
	offsetsbf['singDOWN'] = {x = 45, y = -71}
	offsetsbf['singUP'] = {x = 19, y = 137}
	offsetsbf['singRIGHT'] = {x = -143, y = 33}
end

function onTweenCompleted(tag)
	if tag == 'floatDown' then
		doTweenY('floatUp', 'bf', getProperty('bf.y') - 20, duration, 'sineInOut')
	end
		
	if tag == 'floatUp' then
		doTweenY('floatDown', 'bf', getProperty('bf.y') + 20, duration, 'sineInOut')
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		animToPlay = singAnimations[direction+1];
	end	
	characterToPlay = 'bf'
	holdTimers.bf = 0;
				
	playAnimation(characterToPlay, animToPlay, true);
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.bf >= 0 then
		holdTimers.bf = holdTimers.bf + elapsed;
		if holdTimers.bf >= holdCap then
			playAnimation('bf', 'idle', false);
			holdTimers.bf = -1;
		end
	end
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.bf < 0 and getProperty('bf.animation.curAnim.name') ~= 'die' then
			playAnimation('bf', 'idle', true);
		end
	end
end

function playAnimation(character, animId, forced)
	objectPlayAnimation(character, animId, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	offsetTable = offsetsbf
	setProperty(character..'.offset.x', offsetTable[animId].x)
	setProperty(character..'.offset.y', offsetTable[animId].y)
end

function onEvent(n,v1,v2)

	if n == 'Object Play Animation' and v1 == 'bf' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('bf.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.bf = 0
		end
	end

	if n == 'Add Alpha' and v1 == 'bf' then
		alpha = alpha +0.05
		setProperty('bf.alpha', alpha)
	end

	if n == 'Add Alpha' and v1 == 'bffloat' then
		alpha = alpha +0.05
		setProperty('bf.alpha', alpha)
	end

	if n == 'Add Alpha' and v1 == 'bf1' then
		alpha = 1
		setProperty('bf.alpha', alpha)
	end

end