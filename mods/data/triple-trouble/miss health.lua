local miss = 100

function noteMiss(id, direction, noteType, isSustainNote)
	miss = miss - 1
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Hit Note' then
		miss = miss - 1
	end
	if noteType == 'poison note' then
		miss = miss - 2
	end
end

function onUpdate()
	health = miss/50

	setProperty('health', health);
end