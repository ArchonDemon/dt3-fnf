function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Rocket Note' then --Check if the note on the chart is a Bullet Note
			if not downscroll then 
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'energy ball'); --Change texture
			end
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notes/Explosion'); --custom notesplash texture and its not playing animation

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Rocket Note' then
		cameraShake('camGame', 0.01, 0.2)
		playSound('magic shot', 1)
		characterPlayAnim('gf', 'singDOWN-alt', true)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Rocket Note' then
		setProperty('health', -1);
	end
end