-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz

local alpha = 0

function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('hench4', 'spite/henchmen', 1572.2, 4519.8);
	addAnimationByPrefix('hench4', 'idle', 'dancer idle', 30, true);
	addAnimationByPrefix('hench4', 'singLEFT', 'dancer left', 30, false);
	addAnimationByPrefix('hench4', 'singDOWN', 'dancer down', 30, false);
	addAnimationByPrefix('hench4', 'singUP', 'dancer up', 30, false);
	addAnimationByPrefix('hench4', 'singRIGHT', 'dancer right', 30, false);
	addAnimationByPrefix('hench4', 'ded', 'dancer hit', 30, false);
	addAnimationByPrefix('hench4', 'hit', 'henchmen ded', 30, false);

	updateHitbox('hench4')
	setProperty('hench4.antialiasing', false)
	addLuaSprite('hench4', false);

	playAnimation('hench4', 'idle', false);
end

animationsList = {}
holdTimers = {hench4 = 15.0};
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

offsetshench4 = {};
function makeOffsets()
	offsetshench4['idle'] = {x = 0, y = 0}; --idle
	offsetshench4['singLEFT'] = {x = -3, y = -64}
	offsetshench4['singDOWN'] = {x = -115, y = -70}
	offsetshench4['singUP'] = {x = -58, y = -7}
	offsetshench4['singRIGHT'] = {x = -131, y = -50}
	offsetshench4['dead'] = {x = 280, y = -300}
	offsetshench4['hit'] = {x = -78, y = -67}
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote then
		animToPlay = singAnimations[direction+1];
	end	
	characterToPlay = 'hench4'
	holdTimers.hench4 = 0;
				
	playAnimation(characterToPlay, animToPlay, true);
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.hench4 >= 0 then
		holdTimers.hench4 = holdTimers.hench4 + elapsed;
		if holdTimers.hench4 >= holdCap and getProperty('hench4.animation.curAnim.name') ~= 'idle' then
			playAnimation('hench4', 'idle', false);
			holdTimers.hench4 = -1;
		end
	end
	setProperty('hench4.x', getProperty('spite4.x'))
	setProperty('hench4.y', getProperty('spite4.y'))
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.hench4 < 0 and getProperty('hench4.animation.curAnim.name') ~= 'dead' then
			playAnimation('hench4', 'idle', false);
		end
	end
end

function playAnimation(character, animId, forced)
	objectPlayAnimation(character, animId, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	offsetTable = offsetshench4
	setProperty(character..'.offset.x', offsetTable[animId].x)
	setProperty(character..'.offset.y', offsetTable[animId].y)
end

function onEvent(n,v1,v2)
	if n == 'Object Play Animation' and v1 == 'hench4' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('hench4.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.hench4 = 0
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Spite Note' then
		if noteData == 3 then
			playAnimation('hench4', 'hit', true);
			if string.sub(getProperty('hench4.animation.curAnim.name'),1,4) == 'sing' then
				holdTimers.hench4 = 0
			end
		end
	end
end