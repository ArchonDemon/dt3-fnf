function onCreate() 
    BfFrames = 0
    DadFrames = 0
end

function onUpdate(elapsed)

    BfFrames = BfFrames + 0.24
    DadFrames = DadFrames + 0.24

	if boyfriendName == 'bf-running' or boyfriendName == 'bf-running-s' then
        setProperty('boyfriend.animation.curAnim.frameRate',0)

		setProperty('boyfriend.animation.curAnim.curFrame',math.min(math.floor(BfFrames),7))
		if math.floor(BfFrames) > 11 then
            BfFrames = 0
        end
	end
	if dadName == 'green-nightmare-run' or dadName == 'green-nightmare-s' then
        setProperty('dad.animation.curAnim.frameRate',0)

        setProperty('dad.animation.curAnim.curFrame',math.min(math.floor(DadFrames),16))
        if math.floor(DadFrames) > 7 then
            DadFrames = 0
        end
	end
end