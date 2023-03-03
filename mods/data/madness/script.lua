local opp = 0
local bf = 0

function goodNoteHit(id, noteData, noteType, isSustainNote)
		if opp == 1 then
			characterPlayAnim('dad', 'block', true);
		elseif opp == 2 then
			characterPlayAnim('dad', 'dodge', true);
		elseif opp == 3 then
			characterPlayAnim('dad', 'hit', true);
		elseif opp == 4 then
			characterPlayAnim('dad', 'yeet', true);
		end
end

local healthDrain = 0;
function opponentNoteHit(id, noteData, noteType, isSustainNote)
		if bf == 1 then
			characterPlayAnim('boyfriend', 'hit', true);
		elseif bf == 2 then
			characterPlayAnim('boyfriend', 'pre-attack', true);
		elseif bf == 3 then
			characterPlayAnim('boyfriend', 'hurt', true);
		end
	health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.015);
	end
end

function onStepHit()
	opp = math.random(1,4)
	bf = math.random(1,3)
end