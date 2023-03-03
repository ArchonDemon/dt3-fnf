function opponentNoteHit(id, direction, noteType, isSustainNote)  
    health = getProperty('health')
    if getProperty('health') > 1 then
        setProperty('health', health- 0.005);
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	setProperty('health', getProperty('health')-0.007);
end