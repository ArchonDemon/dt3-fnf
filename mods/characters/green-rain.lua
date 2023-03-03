local originy = 0
function onCreate()

	originy = getProperty('boyfriend.y')

end

local ofsX = 0
local ofsY = 0

function onUpdate()
	triggerEvent('Camera Follow Pos', getProperty('boyfriend.x')+200+ofsX, getProperty('boyfriend.y')+200+ofsY)
end

function onBeatHit()
	if getProperty('boyfriend') then
		setProperty('boyfriend.y',originy+math.random(15,20))
		doTweenY('wifjwiuuf2','boyfriend',originy,0.36,'sineOut')
	end
end

function goodNoteHit(id, dir, note, sus)
	if dir == 0 then
		ofsX = -10
	elseif dir == 1 then
		ofsY = 10
	elseif dir == 2 then
		ofsY = -10
	elseif dir == 3 then
		ofsX = 10
	end
end