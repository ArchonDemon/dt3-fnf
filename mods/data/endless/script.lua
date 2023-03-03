	-- Port By Lechan (Jos), Bubcraft19, Enginer Gaming

function onCreate()
	makeLuaText('endless', 'Endless!', 500, 375, 15)
	setTextSize('endless', 30)
	setObjectCamera('endless', 'hud')
	addLuaText('endless')

	setProperty('timeTxt.visible', false)
    setProperty('timeBar.visible', false)
	--setProperty('timeBarBG.visible', false)

    makeLuaSprite('three', 'three', 260, 60);
    setScrollFactor('three', 0, 0);
	setProperty('three.alpha', 0.5)
	setProperty('three.visible', false)
	addLuaSprite('three', true);

    makeLuaSprite('two', 'two', 260, 60);
    setScrollFactor('two', 0, 0);
	setProperty('two.alpha', 0.5)
	setProperty('two.visible', false)
	addLuaSprite('two', true);

    makeLuaSprite('one', 'one', 260, 60);
    setScrollFactor('one', 0, 0);
	setProperty('one.alpha', 0.5)
	setProperty('one.visible', false)
	addLuaSprite('one', true);

    makeLuaSprite('gofun', 'gofun', 260, 60);
    setScrollFactor('gofun', 0, 0);
	setProperty('gofun.alpha', 0.5)
	setProperty('gofun.visible', false)
	addLuaSprite('gofun', true);

    makeLuaSprite('blackFuck', 'black', 0, 0);
	scaleObject('blackFuck', 6.0, 6.0);
	setObjectCamera('blackFuck', 'other');
	addLuaSprite('blackFuck', true);

	makeLuaSprite('startCircle', 'StartScreens/CircleMajin', 777, 0);
	setObjectCamera('startCircle', 'other');
	addLuaSprite('startCircle', true);

	makeLuaSprite('startText', 'StartScreens/TextMajin', -1200, 0);
	setObjectCamera('startText', 'other');
	addLuaSprite('startText', true);

	setProperty('gf.alpha', 0)
end

function onStartCountdown()
	runTimer('textmove', 0.6)
	runTimer('textfade', 1.9)
end

function onTimerCompleted(tag)
    if tag == 'textmove' then
		doTweenX('circleTween', 'startCircle', 0, 0.5, 'linear');
		doTweenX('textTween', 'startText', 0, 0.5, 'linear');
end
	
    if tag == 'textfade' then
		doTweenAlpha('graphicAlpha', 'blackFuck', 0, 1, 'linear');
		doTweenAlpha('circleAlpha', 'startCircle', 0, 1, 'linear');
		doTweenAlpha('textAlpha', 'startText', 0, 1, 'linear');
	end
end

function onStepHit()
    if curStep == 886 then
    for i=0,7 do

 setPropertyFromGroup('strumLineNotes', i, 'texture', 'Majin_Notes')
end

    for i=0,
    getProperty('unspawnNotes.length')-1 do

 setPropertyFromGroup('unspawnNotes', i, 'texture', 'Majin_Notes')
 end
end

	if curStep == 10 then
		playSound('laugh1', 0.7)
end

	if curStep == 888 then
		triggerEvent('Camera Follow Pos', '690', '820')
        doTweenZoom('bruh', 'camGame', 1.2, 0.7, 'cubeInOut')
		setProperty('three.visible', true)
		doTweenAlpha('threeAlpha', 'three', 0, 0.25, 'cubeOut');
end

	if curStep == 891 then
        doTweenZoom('bruh', 'camGame', 1.5, 0.7, 'cubeInOut')
		setProperty('two.visible', true)
		doTweenAlpha('twoAlpha', 'two', 0, 0.25, 'cubeOut');
end

	if curStep == 896 then
        doTweenZoom('bruh', 'camGame', 1.8, 0.7, 'cubeInOut')
		setProperty('one.visible', true)
		doTweenAlpha('oneAlpha', 'one', 0, 0.25, 'cubeOut');
end

	if curStep == 899 then
		triggerEvent('Camera Follow Pos', '', '')
        doTweenZoom('bruh', 'camGame', 0.9, 0.7, 'cubeInOut')
		setProperty('gofun.visible', true)
		doTweenAlpha('gofunAlpha', 'gofun', 0, 0.25, 'cubeOut');
  end
  if curStep == 1000 then
		setProperty('gofun.visible', false)
		doTweenAlpha('gofunAlpha', 'gofun', 1, 0.25, 'cubeOut');
		setProperty('one.visible', false)
		doTweenAlpha('oneAlpha', 'one', 1, 0.25, 'cubeOut');
		setProperty('two.visible', false)
		doTweenAlpha('twoAlpha', 'two', 1, 0.25, 'cubeOut');
		setProperty('three.visible', false)
		doTweenAlpha('threeAlpha', 'three', 1, 0.25, 'cubeOut');
  end
  if curStep == 1840 then
		triggerEvent('Camera Follow Pos', '690', '820')
        doTweenZoom('bruh', 'camGame', 1.2, 0.7, 'cubeInOut')
		setProperty('three.visible', true)
		doTweenAlpha('threeAlpha', 'three', 0, 0.25, 'cubeOut');
		doTweenAlpha('endlessAlpha', 'endless', 0.5, 0.25, 'cubeOut');
end

	if curStep == 1843 then
        doTweenZoom('bruh', 'camGame', 1.5, 0.7, 'cubeInOut')
		setProperty('two.visible', true)
		doTweenAlpha('twoAlpha', 'two', 0, 0.25, 'cubeOut');
		doTweenAlpha('endlessAlpha', 'endless', 0, 0.25, 'cubeOut');
end

	if curStep == 1848 then
        doTweenZoom('bruh', 'camGame', 1.8, 0.7, 'cubeInOut')
		setProperty('one.visible', true)
		doTweenAlpha('oneAlpha', 'one', 0, 0.25, 'cubeOut');
end

	if curStep == 1851 then
		triggerEvent('Camera Follow Pos', '', '')
        doTweenZoom('bruh', 'camGame', 0.9, 0.7, 'cubeInOut')
		setProperty('gofun.visible', true)
		doTweenAlpha('gofunAlpha', 'gofun', 0, 0.25, 'cubeOut');
		setProperty('timeTxt.visible', true)
		setProperty('timeBar.visible', true)
  end
  if curStep == 2752 then
		setProperty('gf.alpha', 1)
  end
  if curStep == 3008 then
		setProperty('gf.alpha', 0)
  end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)  
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.015);
    end
end