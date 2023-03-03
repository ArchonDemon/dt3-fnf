-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('steven', 'characters/Mom_Assets', 4700.4, 4927.65);
	addAnimationByPrefix('steven', 'idle', 'Mom Idle', 30, false);
	addAnimationByPrefix('steven', 'singLEFT', 'Mom Pose Left', 30, false);
	addAnimationByPrefix('steven', 'singDOWN', 'MOM DOWN POSE', 30, false);
	addAnimationByPrefix('steven', 'singUP', 'Mom Up Pose', 30, false);
	addAnimationByPrefix('steven', 'singRIGHT', 'Mom Left Pose', 30, false);
	
	addAnimationByPrefix('steven', 'die', 'MOM down', 30, true);
	updateHitbox('steven')
	setProperty('steven.antialiasing', false)
	setProperty('steven.visible', false)
	setProperty('steven.flipX', true)
	addLuaSprite('steven', true);

	playAnimation('steven', 'idle', true);
	addLuaScript('peter')
	setObjectOrder('peter', getObjectOrder('steven')+1)
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
	animationsList['die'] = 'die';
end

offsetssteven = {};
function makeOffsets()
	offsetssteven['idle'] = {x = 0, y = 0}; --idle
	offsetssteven['singLEFT'] = {x = 10, y = -60}
	offsetssteven['singDOWN'] = {x = 15, y = -175}
	offsetssteven['singUP'] = {x = -7, y = 67}
	offsetssteven['singRIGHT'] = {x = -65, y = -28}
	offsetssteven['die'] = {x = 55, y = -175};
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Steven Sing' then
		if not isSustainNote then
			animToPlay = singAnimations[direction+1];
		end	
		characterToPlay = 'steven'
		holdTimers.steven = 0;
				
		playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.steven >= 0 then
		holdTimers.steven = holdTimers.steven + elapsed;
		if holdTimers.steven >= holdCap then
			playAnimation('steven', 'idle', false);
			holdTimers.steven = -1;
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
		if holdTimers.steven < 0 and getProperty('steven.animation.curAnim.name') ~= 'die' then
			playAnimation('steven', 'idle', true);
		end
	end
end

function playAnimation(character, animId, forced)
	objectPlayAnimation(character, animId, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	offsetTable = offsetssteven
	setProperty(character..'.offset.x', offsetTable[animId].x)
	setProperty(character..'.offset.y', offsetTable[animId].y)
end

function onEvent(n,v1,v2)

	if n == 'Object Play Animation' and v1 == 'steven' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('steven.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.steven = 0
		end
	end

end