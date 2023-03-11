local noteSpeed = 1.3

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'fast' then --SCROLL DOWN SINCE THERE'S ANOTHER CHECK FOR THIS THING
			setPropertyFromGroup('unspawnNotes', i, 'texture', '`notes/fast');
		end
	end
end
	
function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'fast' then
	end		
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'fast' then
	end
end



--This part of the code was taken from a different script called simpleHud
if (type(point) ~= "table" or point.userdata ~= "point") then
	point = {userdata = "point"}
	point.__index = point

	function point.new(x, y)
		return point.set(setmetatable({}, point), x, y)
	end

	function point.set(p, x, y)
		p.x = x or 0
		p.y = y or 0
		
		return p
	end
	
	function point.add(p, x, y)
		p.x = p.x + (x or 0)
		p.y = p.y + (y or 0)
		
		return p
	end
end

function onUpdatePost(elapsed)
	posx0 = getPropertyFromGroup("playerStrums", 0, "x")
	posx1 = getPropertyFromGroup("playerStrums", 1, "x")
	posx2 = getPropertyFromGroup("playerStrums", 2, "x")
	posx3 = getPropertyFromGroup("playerStrums", 3, "x")
	posy0 = getPropertyFromGroup("playerStrums", 0, "y")
	posy1 = getPropertyFromGroup("playerStrums", 1, "y")
	posy2 = getPropertyFromGroup("playerStrums", 2, "y")
	posy3 = getPropertyFromGroup("playerStrums", 3, "y")
	
		notePos = {
			point.new(posx0, posy0),
			point.new(posx1, posy1),
			point.new(posx2, posy2),
			point.new(posx3, posy3)
		}
	for i = 0, getProperty("notes.length") - 1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'fast' then --MAKE SURE TO ALSO CHANGE THIS NOTETYPE CHECK -------------------------------------------------------------------------
			local noteOffX = getPropertyFromGroup("notes", i, "offsetX")
			local noteOffY = getPropertyFromGroup("notes", i, "offsetY")
			local noteX = getPropertyFromGroup("notes", i, "x") - noteOffX
			local noteY = getPropertyFromGroup("notes", i, "y") - noteOffY
			local noteDir = getPropertyFromGroup("notes", i, "noteData")
			
			setPropertyFromGroup("notes", i, "x", noteX + noteOffX - ((noteX - notePos[noteDir + 1].x) * (-noteSpeed + 1)))
			setPropertyFromGroup("notes", i, "y", noteY + noteOffY - ((noteY - notePos[noteDir + 1].y) * (-noteSpeed + 1)))
		end
	end
end
