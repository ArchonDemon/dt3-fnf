function opponentNoteHit(id, direction, noteType, isSustainNote) --health drain by tord
	if gfName == 'satan' then
		triggerEvent('Screen Shake', '0.1, 0.002', '0.1, 0.001');
		setProperty("health", getProperty("health") - 0.03)
		if getProperty("health") < 0.2 then
			setProperty("health", 0.2)
		end
	end
end