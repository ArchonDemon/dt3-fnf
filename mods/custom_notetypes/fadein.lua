function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'fadein' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/fade in notes');
		end
	end
end