-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	makeOffsets();
	
	makeAnimatedLuaSprite('peter', 'characters/Dad_assets', 4921.25, 5173.3);
	addAnimationByPrefix('peter', 'idle', 'Dad idle dance', 24, false);
	addAnimationByPrefix('peter', 'singLEFT', 'Dad Sing Note LEFT', 30, false);
	addAnimationByPrefix('peter', 'singDOWN', 'Dad Sing Note DOWN', 30, false);
	addAnimationByPrefix('peter', 'singUP', 'Dad Sing note UP', 30, false);
	addAnimationByPrefix('peter', 'singRIGHT', 'dad sing note right', 30, false);
	
	addAnimationByPrefix('peter', 'die', 'Dad down', 30, true);
	updateHitbox('peter')
	setProperty('peter.antialiasing', false)
	setProperty('peter.visible', false)
	setProperty('peter.flipX', true)
	addLuaSprite('peter', true);

	playAnimation('peter', 'idle', true);
end
holdTimers = {peter = 15.0};
singAnimations = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'};

offsetspeter = {};
function makeOffsets()
	offsetspeter['idle'] = {x = 0, y = 0}; --idle
	offsetspeter['singLEFT'] = {x = 40, y = 27}; --left
	offsetspeter['singDOWN'] = {x = 34, y = -30};
	offsetspeter['singUP'] = {x = -12, y = 50};
	offsetspeter['singRIGHT'] = {x = -39, y = 10};
	offsetspeter['die'] = {x = 34, y = -30};
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Peter Sing' then
		if not isSustainNote then
			animToPlay = singAnimations[direction+1];
		end	
		characterToPlay = 'peter'
		holdTimers.peter = 0;
				
		playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.peter >= 0 then
		holdTimers.peter = holdTimers.peter + elapsed;
		if holdTimers.peter >= holdCap then
			playAnimation('peter', 'idle', false);
			holdTimers.peter = -1;
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
		if holdTimers.peter < 0 and getProperty('peter.animation.curAnim.name') ~= 'die' then
			playAnimation('peter', 'idle', false);
		end
	end
end

function playAnimation(character, animId, forced)
	objectPlayAnimation(character, animId, forced, 0); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	offsetTable = offsetspeter
	setProperty(character..'.offset.x', offsetTable[animId].x)
	setProperty(character..'.offset.y', offsetTable[animId].y)
end

function onEvent(n,v1,v2)

	if n == 'Object Play Animation' and v1 == 'peter' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('peter.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.peter = 0
		end
	end

end