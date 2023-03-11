function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'green' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'note-green'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

local attackAnims = {"thunder", "fire", "ice", "rock"}
local dodgeAnims = {"dodge left", "dodge down", "dodge up", "dodge right"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'green' then
		characterPlayAnim('dad', attackAnims[direction + 1], false);
		characterPlayAnim('boyfriend', dodgeAnims[direction + 1], true);
		characterPlayAnim('gf', 'shield', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		setProperty('gf.specialAnim', true);
		cameraShake('game', 0.01, 0.1)
	end
	if noteType == 'green' and fire then
		characterPlayAnim('dad', attackAnims[direction + 1], false);
		characterPlayAnim('boyfriend', dodgeAnims[direction + 1], true);
		characterPlayAnim('gf', 'shield', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		setProperty('gf.specialAnim', true);
		setProperty('health', getProperty('health')+0.4);
		cameraShake('game', 0.01, 0.1)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'green' then
		characterPlayAnim('dad', attackAnims[direction + 1], false);
		setProperty('dad.specialAnim', true);
		setProperty('health', getProperty('health')-0.033);
		cameraShake('game', 0.01, 0.1)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'green' then
		setProperty('health', getProperty('health')-0.2);
		characterPlayAnim('boyfriend', 'hurt', true);
		characterPlayAnim('gf', 'hit', true);
		setProperty('gf.specialAnim', true);
		setProperty('boyfriend.specialAnim', true);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end