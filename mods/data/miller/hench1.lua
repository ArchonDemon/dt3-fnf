-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz

local alpha = 0

function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('hench1', 'spite/henchmen', 4166.05, 4560.95);
	addAnimationByPrefix('hench1', 'idle', 'dancer idle', 30, true);
	addAnimationByPrefix('hench1', 'singLEFT', 'dancer left', 30, false);
	addAnimationByPrefix('hench1', 'singDOWN', 'dancer down', 30, false);
	addAnimationByPrefix('hench1', 'singUP', 'dancer up', 30, false);
	addAnimationByPrefix('hench1', 'singRIGHT', 'dancer right', 30, false);
	addAnimationByPrefix('hench1', 'ded', 'dancer hit', 30, false);
	addAnimationByPrefix('hench1', 'hit', 'henchmen ded', 30, false);

	updateHitbox('hench1')
	setProperty('hench1.antialiasing', false)
	addLuaSprite('hench1', true);

	playAnimation('hench1', 'idle', false);
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

offsetshench1 = {};
function makeOffsets()
	offsetshench1['idle'] = {x = 0, y = 0}; --idle
	offsetshench1['singLEFT'] = {x = -3, y = -64}
	offsetshench1['singDOWN'] = {x = -115, y = -70}
	offsetshench1['singUP'] = {x = -58, y = -7}
	offsetshench1['singRIGHT'] = {x = -131, y = -50}
	offsetshench1['dead'] = {x = 280, y = -300}
	offsetshench1['hit'] = {x = -78, y = -67}
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		animToPlay = singAnimations[direction+1];
	end	
	characterToPlay = 'hench1'
	holdTimers.hench1 = 0;
				
	playAnimation(characterToPlay, animToPlay, true);
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.hench1 >= 0 then
		holdTimers.hench1 = holdTimers.hench1 + elapsed;
		if holdTimers.hench1 >= holdCap and getProperty('hench1.animation.curAnim.name') ~= 'idle' then
			playAnimation('hench1', 'idle', false);
			holdTimers.hench1 = -1;
		end
	end
	setProperty('hench1.x', getProperty('spite1.x'))
	setProperty('hench1.y', getProperty('spite1.y'))
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.hench1 < 0 and getProperty('hench1.animation.curAnim.name') ~= 'dead' then
			playAnimation('hench1', 'idle', false);
		end
	end
end

function playAnimation(character, animId, forced)
	objectPlayAnimation(character, animId, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	offsetTable = offsetshench1
	setProperty(character..'.offset.x', offsetTable[animId].x)
	setProperty(character..'.offset.y', offsetTable[animId].y)
end

function onEvent(n,v1,v2)
	if n == 'Object Play Animation' and v1 == 'hench1' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('hench1.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.hench1 = 0
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Spite Note' then
		if noteData == 0 then
			playAnimation('hench1', 'hit', true);
			if string.sub(getProperty('hench1.animation.curAnim.name'),1,4) == 'sing' then
				holdTimers.hench1 = 0
			end
		end
	end
end