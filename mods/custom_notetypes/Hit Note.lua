function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Fire Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'hit note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/hit-notes'); --Change texture --Change note splash texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', -100);
			--setPropertyFromGroup('unspawnNotes', i, 'x', getPropertyFromGroup('unspawnNotes', i, 'x')-166);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Lets Opponent's instakill notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			else
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end

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
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'hit note' then
		setProperty('health', getProperty('health')-0.2);
		playSound('jumpscare', 1.9);
		runTimer('jp', 0.25, 1);
		characterPlayAnim('dad', 'jumpscare', false);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		setProperty('jp.alpha', 1);
		ghostmisses = ghostmisses + 1;
		ghostmisses = ghostmisses + 1;
		if health <= 0 then
			setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-pixel-dead');
			setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
			setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	setProperty('jp.alpha', 0);
	setProperty('health', getProperty('health')-0.075);
	if health <= 0 then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-pixel-dead');
		setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
		setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
	end
end