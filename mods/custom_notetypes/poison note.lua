function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'poison note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/poison note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notes/poisonsplash');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
	makeAnimatedLuaSprite('jp','spooky_jumpscare', 0, 0);
	setScrollFactor('jp', 1, 1);
	addAnimationByPrefix('jp', 'Animation', 'jp', 24, true);
	objectPlayAnimation('jp', 'Animation', false);
	setObjectCamera('jp', 'other');
	setProperty('jp.alpha', 0);
	addLuaSprite('jp', true);
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
local healthDrain = 0;
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'poison note' then
		playSound('jumpscare', 1.9);
		-- bf anim
		characterPlayAnim('dad', 'jumpscare', false);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		runTimer('jp', 0.25, 1);
		setProperty('jp.alpha', 1);
		-- health loss | || || |_
		--setProperty('health', getProperty('health') - 0.6);
		healthDrain = healthDrain + 0.6;
	end
end

function onUpdate(elapsed)
	if healthDrain > 0 then
		healthDrain = healthDrain - 0.1 * elapsed;
		setProperty('health', getProperty('health') - 0.1 * elapsed);
		if healthDrain < 0 then
			healthDrain = 0;
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	setProperty('jp.alpha', 0);
end