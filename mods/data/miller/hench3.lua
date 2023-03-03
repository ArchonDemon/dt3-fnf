-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz

local alpha = 0

function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('hench3', 'spite/henchmen', 1542.55, 5224.85);
	addAnimationByPrefix('hench3', 'idle', 'dancer idle', 30, true);
	addAnimationByPrefix('hench3', 'singLEFT', 'dancer left', 30, false);
	addAnimationByPrefix('hench3', 'singDOWN', 'dancer down', 30, false);
	addAnimationByPrefix('hench3', 'singUP', 'dancer up', 30, false);
	addAnimationByPrefix('hench3', 'singRIGHT', 'dancer right', 30, false);
	addAnimationByPrefix('hench3', 'ded', 'dancer hit', 30, false);
	addAnimationByPrefix('hench3', 'hit', 'henchmen ded', 30, false);

	updateHitbox('hench3')
	setProperty('hench3.antialiasing', false)
	addLuaSprite('hench3', true);

	playAnimation('hench3', 'idle', false);
end

animationsList = {}
holdTimers = {hench1 = 15.0};
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

offsetshench3 = {};
function makeOffsets()
	offsetshench3['idle'] = {x = 0, y = 0}; --idle
	offsetshench3['singLEFT'] = {x = -3, y = -64}
	offsetshench3['singDOWN'] = {x = -115, y = -70}
	offsetshench3['singUP'] = {x = -58, y = -7}
	offsetshench3['singRIGHT'] = {x = -131, y = -50}
	offsetshench3['dead'] = {x = 280, y = -300}
	offsetshench3['hit'] = {x = -78, y = -67}
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		animToPlay = singAnimations[direction+1];
	end	
	characterToPlay = 'hench3'
	holdTimers.hench3 = 0;
				
	playAnimation(characterToPlay, animToPlay, true);
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.hench3 >= 0 then
		holdTimers.hench3 = holdTimers.hench3 + elapsed;
		if holdTimers.hench3 >= holdCap and getProperty('hench3.animation.curAnim.name') ~= 'idle' then
			playAnimation('hench3', 'idle', false);
			holdTimers.hench3 = -1;
		end
	end
	setProperty('hench3.x', getProperty('spite3.x'))
	setProperty('hench3.y', getProperty('spite3.y'))
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.hench3 < 0 and getProperty('hench3.animation.curAnim.name') ~= 'dead' then
			playAnimation('hench3', 'idle', false);
		end
	end
end

function playAnimation(character, animId, forced)
	objectPlayAnimation(character, animId, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	offsetTable = offsetshench3
	setProperty(character..'.offset.x', offsetTable[animId].x)
	setProperty(character..'.offset.y', offsetTable[animId].y)
end

function onEvent(n,v1,v2)
	if n == 'Object Play Animation' and v1 == 'hench3' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('hench3.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.hench3 = 0
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Spite Note' then
		if noteData == 2 then
			playAnimation('hench3', 'hit', true);
			if string.sub(getProperty('hench3.animation.curAnim.name'),1,4) == 'sing' then
				holdTimers.hench3 = 0
			end
		end
	end
end