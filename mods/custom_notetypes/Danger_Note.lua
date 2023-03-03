function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Danger_Note' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Danger_Notes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--if songName == 'triple-trouble' then

	--end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Danger_Note' then
		setProperty('health', getProperty('health')+0.2);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Danger_Note' then
	    playSound('jumpscare', 1.9);
		setProperty('health', getProperty('health')-0.4);
	end
end