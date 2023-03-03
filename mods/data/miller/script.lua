-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	makeAnimationList();
	makeOffsets();
	
	makeAnimatedLuaSprite('dee', 'characters/pico_FNF_assetss', 4400.15, 4901.75);
	addAnimationByPrefix('dee', 'idle', 'Pico Idle Dance', 24, false);
	addAnimationByPrefix('dee', 'singLEFT', 'Pico NOTE LEFT0', 30, false);
	addAnimationByPrefix('dee', 'singDOWN', 'Pico Down Note0', 30, false);
	addAnimationByPrefix('dee', 'singUP', 'pico Up note0', 30, false);
	addAnimationByPrefix('dee', 'singRIGHT', 'Pico Note Right0', 30, false);
	
	addAnimationByPrefix('dee', 'singLEFTmiss', 'Pico NOTE LEFT miss', 30, false);
	addAnimationByPrefix('dee', 'singDOWNmiss', 'Pico Down Note MISS', 30, false);
	addAnimationByPrefix('dee', 'singUPmiss', 'pico Up note miss', 30, false);
	addAnimationByPrefix('dee', 'singRIGHTmiss', 'Pico Note Right Miss', 30, false);
	
	addAnimationByPrefix('dee', 'die', 'pico down', 30, true);
	updateHitbox('dee')
	setProperty('dee.antialiasing', false)
	addLuaSprite('dee', true);
	setProperty('dee.visible', false)

	playAnimation('dee', 'idle', true);
	addLuaScript('steven')
	setObjectOrder('steven', getObjectOrder('dee')+1)
end

animationsList = {}
holdTimers = {dee = 15.0};
singAnimations = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'};
function makeAnimationList()
	animationsList['idle'] = 'idle';
	animationsList['singLEFT'] = 'singLEFT';
	animationsList['singDOWN'] = 'singDOWN';
	animationsList['singUP'] = 'singUP';
	animationsList['singRIGHT'] = 'singRIGHT';
	animationsList['singLEFTmiss'] = 'singLEFTmiss';
	animationsList['singDOWNmiss'] = 'singDOWNmiss';
	animationsList['singUPmiss'] = 'singUPmiss';
	animationsList['singRIGHTmiss'] = 'singRIGHTmiss';
	animationsList['die'] = 'die';
end

offsetsdee = {};
function makeOffsets()
	offsetsdee['idle'] = {x = 0, y = 0}; --idle
	offsetsdee['singLEFT'] = {x = 82, y = -10}; --left
	offsetsdee['singDOWN'] = {x = 81, y = -80}; --down
	offsetsdee['singUP'] = {x = 18, y = 27}; --up
	offsetsdee['singRIGHT'] = {x = -51, y = 2}; --right
	offsetsdee['singLEFTmiss'] = {x = 80, y = 28}; --left
	offsetsdee['singDOWNmiss'] = {x = 77, y = -38}; --down
	offsetsdee['singUPmiss'] = {x = 25, y = 67}; --up
	offsetsdee['singRIGHTmiss'] = {x = -48, y = 50}; --right
	offsetsdee['die'] = {x = -55, y = -258}; --die
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Special Sing' then
		if not isSustainNote then
			animToPlay = singAnimations[direction+1];
		end	
		characterToPlay = 'dee'
		holdTimers.dee = 0;
				
		playAnimation(characterToPlay, animToPlay, true);
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Special Sing' then
		if not isSustainNote then
			animToPlay = singAnimations[direction+1]..'miss';
		end	
		characterToPlay = 'dee'
				
		playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.dee >= 0 then
		holdTimers.dee = holdTimers.dee + elapsed;
		if holdTimers.dee >= holdCap then
			playAnimation('dee', 'idle', false);
			holdTimers.dee = -1;
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
		if holdTimers.dee < 0 and getProperty('dee.animation.curAnim.name') ~= 'die' then
			playAnimation('dee', 'idle', false);
		end
	end
end

function playAnimation(character, animId, forced)
	objectPlayAnimation(character, animId, forced, 0); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	offsetTable = offsetsdee
	setProperty(character..'.offset.x', offsetTable[animId].x)
	setProperty(character..'.offset.y', offsetTable[animId].y)
end

function onEvent(n,v1,v2)

	if n == 'Object Play Animation' and v1 == 'dee' then
		playAnimation(v1,v2,true)
		if string.sub(getProperty('steven.animation.curAnim.name'),1,4) == 'sing' then
			holdTimers.dee = 0
		end
	end

end