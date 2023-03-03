-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz

local alpha = 0

function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('hench2', 'spite/henchmen', 4166.05, 4560.95);
	addAnimationByPrefix('hench2', 'idle', 'dancer idle', 30, true);
	addAnimationByPrefix('hench2', 'singLEFT', 'dancer left', 30, false);
	addAnimationByPrefix('hench2', 'singDOWN', 'dancer down', 30, false);
	addAnimationByPrefix('hench2', 'singUP', 'dancer up', 30, false);
	addAnimationByPrefix('hench2', 'singRIGHT', 'dancer right', 30, false);
	addAnimationByPrefix('hench2', 'ded', 'dancer hit', 30, false);
	addAnimationByPrefix('hench2', 'hit', 'henchmen ded', 30, false);

	updateHitbox('hench2')
	setProperty('hench2.antialiasing', false)
	addLuaSprite('hench2', false);

	playAnimation('hench2', 'idle', false);
end

animationsList = {}
holdTimers = {hench2 = 15.0};
singAnimations = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'};
function makeAnimationList()
	animationsList['idle'] = 'idle';
	animationsList['singLEFT'] = 'singLEFT';
	animationsList['singDOWN'] = 'singDOWN';
	animationsList['singUP'] = 'singUP';
	animationsList['singRIGHT'] = 'singRIGHT';
	animationsList['dead'] = 'ded';
	animationsList['hit'] = 'hit';
end

offsetshench2 = {};
function makeOffsets()
	offsetshench2['idle'] = {x = 0, y = 0}; --idle
	offsetshench2['singLEFT'] = {x = -3, y = -64}
	offsetshench2['singDOWN'] = {x = -115, y = -70}
	offsetshench2['singUP'] = {x = -58, y = -7}
	offsetshench2['singRIGHT'] = {x = -131, y = -50}
	offsetshench2['dead'] = {x = 280, y = -300}
	offsetshench2['hit'] = {x = -78, y = -67}
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		animToPlay = singAnimations[direction+1];
	end	
	characterToPlay = 'hench2'
	holdTimers.hench2 = 0;
				
	playAnimation(characterToPlay, animToPlay, true);
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.hench2 >= 0 then
		holdTimers.hench2 = holdTimers.hench2 + elapsed;
		if holdTimers.hench2 >= holdCap and getProperty('hench2.animation.curAnim.name') ~= 'idle' then
			playAnimation('hench2', 'idle', false);
			holdTimers.hench2 = -1;
		end
	end
	setProperty('hench2.x', getProperty('spite2.x'))
	setProperty('hench2.y', getProperty('spite2.y'))
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.hench2 < 0 and getProperty('hench2.animation.curAnim.name') ~= 'dead' then
			playAnimation('hench2', 'idle', false);
		end
	end
end

function playAnimation(character, animId, forced)
	objectPlayAnimation(character, animId, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	offsetTable = offsetshench2
	setProperty(character..'.offset.x', offsetTable[animId].x)
	setProperty(character..'.offset.y', offsetTable[animId].y)
end

function onEvent(n,v1,v2)
	if n == 'Object Play Animation' and v1 == 'hench2' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('hench2.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.hench2 = 0
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Spite Note' then
		if noteData == 3 then
			playAnimation('hench2', 'hit', true);
			if string.sub(getProperty('hench2.animation.curAnim.name'),1,4) == 'sing' then
				holdTimers.hench2 = 0
			end
		end
	end
end