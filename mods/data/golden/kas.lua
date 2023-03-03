-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz

local alpha = 0

function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('kas', 'characters/kasandra', -150, 400);
	addAnimationByPrefix('kas', 'idle', 'idle', 30, false);
	addAnimationByPrefix('kas', 'singLEFT', 'left', 30, false);
	addAnimationByPrefix('kas', 'singDOWN', 'down', 30, false);
	addAnimationByPrefix('kas', 'singUP', 'up', 30, false);
	addAnimationByPrefix('kas', 'singRIGHT', 'right', 30, false);

	updateHitbox('kas')
	setProperty('kas.antialiasing', false)
	addLuaSprite('kas', true);

	playAnimation('kas', 'idle', false);
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
	offsetsbf['singLEFT'] = {x = 31, y = 7}
	offsetsbf['singDOWN'] = {x = 1, y = -47}
	offsetsbf['singUP'] = {x = 0, y = 80}
	offsetsbf['singRIGHT'] = {x = 3, y = 4}
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		animToPlay = singAnimations[direction+1];
	end	
	if noteType == 'p2' or noteType == 'p1p2' then
		characterToPlay = 'kas'
		holdTimers.kas = 0;
				
		playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.kas >= 0 then
		holdTimers.kas = holdTimers.kas + elapsed;
		if holdTimers.kas >= holdCap then
			playAnimation('kas', 'idle', false);
			holdTimers.kas = -1;
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
		if holdTimers.kas < 0 and getProperty('kas.animation.curAnim.name') ~= 'die' then
			playAnimation('kas', 'idle', true);
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

	if n == 'Object Play Animation' and v1 == 'kas' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('kas.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.kas = 0
		end
	end
end