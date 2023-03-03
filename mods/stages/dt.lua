function onCreate()
	--other stuff
	makeLuaSprite('sky', 'Phase3/normal/glitch', 0, 0);
	addLuaSprite('sky', false);

	makeLuaSprite('TTTrees', 'Phase3/normal/TTTrees', 0, 0);
	addLuaSprite('TTTrees', false);

	makeLuaSprite('BackBush', 'Phase3/normal/BackBush', 0, 0);
	addLuaSprite('BackBush', false);

	makeLuaSprite('TopBushes', 'Phase3/normal/TopBushes', 0, 0);
	addLuaSprite('TopBushes', false);

	makeLuaSprite('FGtree1', 'Phase3/normal/FGtree1', 0, 0);
	setScrollFactor('FGtree1',0.8,1)
	addLuaSprite('FGtree1', true);

	makeLuaSprite('FGtree2', 'Phase3/normal/FGtree2', 0, 0);
	setScrollFactor('FGtree2',0.9,1)
	addLuaSprite('FGtree2', true);

	--hud stuff
	makeLuaSprite('black','',0,0)
	makeGraphic('black',1348,1348,'000000')
	addLuaSprite('black',true)
    setScrollFactor('black',0,0)
    setObjectCamera('black','hud')

	setProperty('gf.alpha', 0)
	setProperty('gf.visible', false)

	--jp stuff
	makeAnimatedLuaSprite('jpReaper', 'Phase3/secret dont check yet/reaper-jp',-3,-97)
	addAnimationByPrefix('jpReaper','jp','jumpscare',24,false);
	setObjectCamera('jpReaper','other')
	addLuaSprite('jpReaper', false);
	setProperty('jpReaper.visible', false)

	makeAnimatedLuaSprite('jpKas', 'Phase3/secret dont check yet/kasandra-jp',-30,-48)
	addAnimationByPrefix('jpKas','jp','jumpscare',24,false);
	setObjectCamera('jpKas','other')
	addLuaSprite('jpKas', false);
	setProperty('jpKas.visible', false)

	makeAnimatedLuaSprite('jpGreen', 'Phase3/secret dont check yet/green-jp',-121,-15)
	addAnimationByPrefix('jpGreen','jp','jumpscare',24,false);
	setObjectCamera('jpGreen','other')
	addLuaSprite('jpGreen', false);
	setProperty('jpGreen.visible', false)

	jp1 = math.random(10, 259)
	jp2 = math.random(260, 355)
	jp3 = math.random(356, 611)
	jp4 = math.random(612, 803)
	jp5 = math.random(804, 1123)
	jp6 = math.random(1124, 1380)
end

function onStepHit()
	if A0 == true then
		doTweenAlpha('black2', 'black', 0, 0.001, 'Linear');
	end

	if curStep == 1 then
		doTweenAlpha('gf', 'gf', 0, 0.001, 'Linear');
		doTweenAlpha('black', 'black', 0, 1.64, 'Linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'black' then
		A0 = true
	end
end

local numberJP = 1

function onBeatHit()
	if curBeat == 9 then
		setProperty('jpReaper.visible', true)
		--setProperty('jpSatan.visible', true)
		--setProperty('jpElectra.visible', true)
		setProperty('jpKas.visible', true)
		--setProperty('jpSeth.visible', true)
		setProperty('jpGreen.visible', true)
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")
	end
	if curBeat == jp1 then
		objectPlayAnimation('jpReaper','jp',false);
		playSound('jumpscare');
		numberJP = 1
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Death")
	end
	if curBeat == jp2 then
		--objectPlayAnimation('jpSatan','jp',false);
		playSound('jumpscare');
		numberJP = 2
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Devil")
	end
	if curBeat == jp3 then
		--objectPlayAnimation('jpElectra','jp',false);
		playSound('jumpscare');
		numberJP = 3
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Lustful")
	end
	if curBeat == jp4 then
		objectPlayAnimation('jpKas','jp',false);
		playSound('jumpscare');
		numberJP = 4
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Fallen Human")
	end
	if curBeat == jp5 then
		--objectPlayAnimation('jpSeth','jp',false);
		playSound('jumpscare');
		numberJP = 5
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': King")
	end
	if curBeat == jp6 then
		objectPlayAnimation('jpGreen','jp',false);
		playSound('jumpscare');
		numberJP = 6
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Elements")
	end
	if curBeat == 1396 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")
	end
	if curBeat == 1408 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Fake Savior")
	end
	if curBeat == 1456 then
		doTweenAlpha('gf', 'gf', 1, 0.001, 'Linear');
	end
	if curBeat == 1904 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	jp = math.random(1,numberJP)
	if noteType == 'Danger_Note' then
		if jp == 1 then
			objectPlayAnimation('jpReaper','jp',false);
			playSound('jumpscare');
		elseif jp == 2 then
			--objectPlayAnimation('jpKas','jp',false);
			--playSound('jumpscare');
		elseif jp == 3 then
			--objectPlayAnimation('jpKas','jp',false);
			--playSound('jumpscare');
		elseif jp == 4 then
			objectPlayAnimation('jpKas','jp',false);
			playSound('jumpscare');
		elseif jp == 5 then
			--objectPlayAnimation('jpKas','jp',false);
			--playSound('jumpscare');
		elseif jp == 6 then
			objectPlayAnimation('jpGreen','jp',false);
			playSound('jumpscare');
		end
	end
end