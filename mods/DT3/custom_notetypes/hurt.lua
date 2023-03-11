function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'hurt' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'note-hurt'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -1);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', -0.75);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

local attackAnims = {"thunder", "fire", "ice", "rock"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'hurt' then
		characterPlayAnim('dad', attackAnims[direction + 1], false);
		characterPlayAnim('boyfriend', 'hurt', true);
		characterPlayAnim('gf', 'hit', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		setProperty('gf.specialAnim', true);
		setProperty('health', getProperty('health')-0.4);
    end
end