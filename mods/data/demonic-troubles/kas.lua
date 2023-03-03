--Dual characters 1.0 alpha by HEAVYSTYLES aka VECTOR
    --settings (its configured to be used on the test song but you can change anything)

    --important

    local charid = "kas" --it doesn´t matter what you put in here, it just has to be different than any other charid of the scripts in the folder

    local opmode = true --if true, will prevent the character from singing the player notes and will sing the opponent notes, it will still only sing the note type you put in notename 

    --miscellaneous

   local alternatingbops = true --enabled: the character will bop between bfs bops

    --character

   local char = "kasandra-m-nt" --use the image name from image/characters


   local charpath ="characters/" -- in case you want to use another path


   local charorder = 8 --setObjectOrder(charid,charorder)


   local flipx = false --in case you want to... well... flip your character x, this will break your offsets if you have any

   --notes 

   local notename = "Kas" --what notetype will the character sing

   --in case you want to use more than just two characters just copy the script so you have the same script two times in the folder, change the name to whatever you want, then customize it

   --then do the same to the notetype script and change the notename value to match the notetype name in the notetype folder, so, if notename = character 3 the character will only sing the "character 3" notetype


   --characters positions

   local charpos = {1000,50}-- x,y

   --prefixes, look for them in the .xml or the .json of the character

   local idleprfx = "idle"

   local leftprfx = "left"

   local downprfx = "down" 

   local upprfx = "up" 

   local rightprfx = "right"

     --misses

   local leftmissprfx = "idle" 

   local downmissprfx = "idle"  

   local upmissprfx = "idle" 

   local rightmissprfx = "idle"  

   --offsets (it might not work properly but i dont know why lol)
   

   local leftoffset = {-42,1} --x,y

   local downoffset = {-42,-63}

   local upoffset = {-234,23}

   local rightoffset = {-44,0}

    --misses

   local leftmissoffset = {0,0} 

   local downmissoffset = {0,0}

   local upmissoffset = {0,0}

   local rightmissoffset = {0,0}

   --animations settings

   local framerates = {24,24,24,24,24,24,24,24,24} --in case you want to change animations framerates

 --idle, left, down, up, right, miss left, miss down, miss up, miss,right

   local loopeds = {false,false,false,false,false,false,false,false,false,} --in case one of the animation has to be looped

--idle, left, down, up, right, miss left, miss down, miss up, miss,right




-- settingsn´t
local beat = 0
local missstep1 = 0
local allowidle = true
local nextidle = true

function onCreatePost()

    makeAnimatedLuaSprite(charid, charpath  .. char, charpos[1], charpos[2])

    setObjectOrder(charid,charorder)

    addAnimationByPrefix(charid,"idle",idleprfx,framerates[1],loopeds[1])
    addAnimationByPrefix(charid,"idlestatic",idleprfx  .. "0013",framerates[1],loopeds[1])
    addAnimationByPrefix(charid,"left",leftprfx .. "0",framerates[2],loopeds[2])
    addAnimationByPrefix(charid,"up",upprfx .."0",framerates[4],loopeds[4])
    addAnimationByPrefix(charid,"down",downprfx .. "0",framerates[3],loopeds[3])
    addAnimationByPrefix(charid,"right",rightprfx .. "0",framerates[5],loopeds[5])

    addAnimationByPrefix(charid,"leftmiss",leftmissprfx .. "0",framerates[6],loopeds[6])
    addAnimationByPrefix(charid,"downmiss",downmissprfx .. "0",framerates[7],loopeds[7])
    addAnimationByPrefix(charid,"upmiss",upmissprfx .. "0",framerates[8],loopeds[8])
    addAnimationByPrefix(charid,"rightmiss",rightmissprfx .. "0",framerates[9],loopeds[9])

if flipx then
	scaleObject(charid,-1,1)
end
if alternatingbops then
	beat = 1
end
end


function onSongStart()
	if not alternatingbops then
	objectPlayAnimation(charid,"idle",true)
end
end

function onCountdownTick(counter)
	if counter == 2 then onSongStart() end
	if alternatingbops and counter == 3 then
		objectPlayAnimation(charid,"idle",true)
end
	if alternatingbops and counter == 1 then
		objectPlayAnimation(charid,"idle",true)
end
end



function onStepHit()
		if miss1 then
		if missstep1 >= 26 then
			objectPlayAnimation(charid,"idlestatic",true)
			setProperty(charid .. ".x",charpos[1])
			setProperty(charid .. ".y",charpos[2])
			allowidle = true
			miss1 = false
			missstep1 = 0
			else
			missstep1 = missstep1 + 1
		end
end
end
function onBeatHit()
	--apparently i dont know how to use if curBeat %2 == 1 then
	beat = beat + 1
	if beat == 2 then
			idle()
			beat = 0
	end
end
function idle()
		if allowidle and nextidle then
			objectPlayAnimation(charid,"idle",true)
			setProperty(charid .. ".x",charpos[1])
			setProperty(charid .. ".y",charpos[2])
		else
			nextidle = true
		end
end
function postnoteidle()
			objectPlayAnimation(charid,"idle",true)
			setProperty(charid .. ".x",charpos[1])
			setProperty(charid .. ".y",charpos[2])
			allowidle = true
			nextidle = false
		end


function goodNoteHit(id, noteData, noteType, isSustainNote)
if not opmod then

	if noteData == 0 then
		if noteType == notename then
				miss1 = false
		objectPlayAnimation(charid,"left",true)
		setProperty(charid .. ".x",charpos[1]+leftoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+leftoffset[2]*-1)
		allowidle = false
		runTimer(charid,0.5,1)
	end
end
	if noteData == 1 then
		if noteType == notename then
				miss1 = false
		objectPlayAnimation(charid,"down",true)
		setProperty(charid .. ".x",charpos[1]+downoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+downoffset[2]*-1)
		allowidle = false
		runTimer(charid,0.5,1)
	end
end
	if noteData == 2 then
		if noteType == notename then
				miss1 = false
		objectPlayAnimation(charid,"up",true)
		setProperty(charid .. ".x",charpos[1]+upoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+upoffset[2]*-1)
		allowidle = false
		runTimer(charid,0.5,1)
	end
end
	if noteData == 3 then
		if noteType == notename then
				miss1 = false
		objectPlayAnimation(charid,"right",true)
		setProperty(charid .. ".x",charpos[1]+rightoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+rightoffset[2]*-1)
		allowidle = false
		runTimer(charid,0.5,1)
	end
end
end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
if opmode then

	if noteData == 0 then
		if noteType == notename then
		objectPlayAnimation(charid,"left",true)
		setProperty(charid .. ".x",charpos[1]+leftoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+leftoffset[2]*-1)
		allowidle = false
		runTimer(charid,0.5,1)
	end
end
	if noteData == 1 then
		if noteType == notename then
		objectPlayAnimation(charid,"down",true)
		setProperty(charid .. ".x",charpos[1]+downoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+downoffset[2]*-1)
		allowidle = false
		runTimer(charid,0.5,1)
	end
end
	if noteData == 2 then
		if noteType == notename then
		objectPlayAnimation(charid,"up",true)
		setProperty(charid .. ".x",charpos[1]+upoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+upoffset[2]*-1)
		allowidle = false
		runTimer(charid,0.5,1)
	end
end
	if noteData == 3 then
		if noteType == notename then
		objectPlayAnimation(charid,"right",true)
		setProperty(charid .. ".x",charpos[1]+rightoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+rightoffset[2]*-1)
		allowidle = false
		runTimer(charid,0.5,1)
	end
end
end
end
function noteMiss(id, noteData, noteType, isSustainNote)

	if noteData == 0 then
		
		if noteType == notename then
				cancelTimer(charid)
	miss1 = true
	nextidle = false
		objectPlayAnimation(charid,"leftmiss",true)
		setProperty(charid .. ".x",charpos[1]+leftmissoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+leftmissoffset[2]*-1)
		allowidle = false

	end
end
	if noteData == 1 then
			cancelTimer(charid)
	miss1 = true
	nextidle = false
		if noteType == notename then
		objectPlayAnimation(charid,"downmiss",true)
		setProperty(charid .. ".x",charpos[1]+downmissoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+downmissoffset[2]*-1)
		allowidle = false

	end
end
	if noteData == 2 then
			cancelTimer(charid)
	miss1 = true
	nextidle = false
		if noteType == notename then
		objectPlayAnimation(charid,"upmiss",true)
		setProperty(charid .. ".x",charpos[1]+upmissoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+upmissoffset[2]*-1)
		allowidle = false

	end
end
	if noteData == 3 then
			cancelTimer(charid)
	miss1 = true
	nextidle = false
		if noteType == notename then
		objectPlayAnimation(charid,"rightmiss",true)
		setProperty(charid .. ".x",charpos[1]+rightmissoffset[1]*-1)
		setProperty(charid .. ".y",charpos[2]+rightmissoffset[2]*-1)
		allowidle = false
	end
end
end

function onTimerCompleted(name)
	if name == charid then
		if keyPressed("left") or keyPressed("down") or keyPressed("up") or keyPressed("right") then
			runTimer(charid .. "holdcheck",0.01,1)
		else
			postnoteidle()
		end
	end
		if name == charid .. "holdcheck" then
		if keyPressed("left") or keyPressed("down") or keyPressed("up") or keyPressed("right") then
			runTimer(charid .. "holdcheck",0.01,1)
		else
			postnoteidle()
		end
		end
	end




	function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == notename then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
end