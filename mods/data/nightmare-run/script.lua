function onUpdate()
	health = getProperty('health')

	if getProperty('health') < 0.1 then
	   doTweenX('PlaneTweenX', 'dad', 0, 1);
	   doTweenX('bfTweenX', 'boyfriend', 400, 1);
	   doTweenX('gfTweenX', 'gf', 50, 1);
	elseif getProperty('health') < 0.2 then
		doTweenX('PlaneTweenX', 'dad', -25, 1);
		doTweenX('bfTweenX', 'boyfriend', 405, 1);
		doTweenX('gfTweenX', 'gf', 55, 1);
	elseif getProperty('health') < 0.22 then
		characterPlayAnim('boyfriend', 'scared', true);
		setProperty('boyfriend.specialAnim', true);
	elseif getProperty('health') < 0.3 then
		doTweenX('PlaneTweenX', 'dad', -50, 1);
		doTweenX('bfTweenX', 'boyfriend', 410, 1);
		doTweenX('gfTweenX', 'gf', 60, 1);
	elseif getProperty('health') < 0.4 then
		doTweenX('PlaneTweenX', 'dad', -75, 1);
		doTweenX('bfTweenX', 'boyfriend', 415, 1);
		doTweenX('gfTweenX', 'gf', 65, 1);
	elseif getProperty('health') < 0.5 then
	   doTweenX('PlaneTweenX', 'dad', -100, 1);
	   doTweenX('bfTweenX', 'boyfriend', 420, 1);
	   doTweenX('gfTweenX', 'gf', 70, 1);
	elseif getProperty('health') < 0.6 then
		doTweenX('PlaneTweenX', 'dad', -125, 1);
		doTweenX('bfTweenX', 'boyfriend', 425, 1);
		doTweenX('gfTweenX', 'gf', 75, 1);
	elseif getProperty('health') < 0.7 then
		doTweenX('PlaneTweenX', 'dad', -150, 1);
		doTweenX('bfTweenX', 'boyfriend', 430, 1);
		doTweenX('gfTweenX', 'gf', 80, 1);
	elseif getProperty('health') < 0.8 then
		doTweenX('PlaneTweenX', 'dad', -175, 1);
		doTweenX('bfTweenX', 'boyfriend', 435, 1);
		doTweenX('gfTweenX', 'gf', 85, 1);
	elseif getProperty('health') < 0.9 then
		doTweenX('PlaneTweenX', 'dad', -200, 1);
		doTweenX('bfTweenX', 'boyfriend', 440, 1);
		doTweenX('gfTweenX', 'gf', 90, 1);
	elseif getProperty('health') < 1.0 then
	   doTweenX('PlaneTweenX', 'dad', -225, 1);
	   doTweenX('bfTweenX', 'boyfriend', 445, 1);
	   doTweenX('gfTweenX', 'gf', 110, 1);
	elseif getProperty('health') < 1.1 then
		doTweenX('PlaneTweenX', 'dad', -250, 1);
		doTweenX('bfTweenX', 'boyfriend', 450, 1);
		doTweenX('gfTweenX', 'gf', 130, 1);
	elseif getProperty('health') < 1.2 then
		doTweenX('PlaneTweenX', 'dad', -275, 1);
		doTweenX('bfTweenX', 'boyfriend', 455, 1);
		doTweenX('gfTweenX', 'gf', 155, 1);
	elseif getProperty('health') < 1.3 then
		doTweenX('PlaneTweenX', 'dad', -300, 1);
		doTweenX('bfTweenX', 'boyfriend', 460, 1);
		doTweenX('gfTweenX', 'gf', 170, 1);
	elseif getProperty('health') < 1.4 then
		doTweenX('PlaneTweenX', 'dad', -325, 1);
		doTweenX('bfTweenX', 'boyfriend', 465, 1);
		doTweenX('gfTweenX', 'gf', 195, 1);
	elseif getProperty('health') < 1.5 then
	   doTweenX('PlaneTweenX', 'dad', -350, 1);
	   doTweenX('bfTweenX', 'boyfriend', 470, 1);
	   doTweenX('gfTweenX', 'gf', 210, 1);
	elseif getProperty('health') < 1.6 then
		doTweenX('PlaneTweenX', 'dad', -375, 1);
		doTweenX('bfTweenX', 'boyfriend', 475, 1);
		doTweenX('gfTweenX', 'gf', 212, 1);
    elseif getProperty('health') < 1.7 then
	   doTweenX('PlaneTweenX', 'dad', -400, 1);
	   doTweenX('bfTweenX', 'boyfriend', 480, 1);
	   doTweenX('gfTweenX', 'gf', 214, 1);
    elseif getProperty('health') < 1.8 then
	   doTweenX('PlaneTweenX', 'dad', -425, 1);
	   doTweenX('bfTweenX', 'boyfriend', 485, 1);
	   doTweenX('gfTweenX', 'gf', 216, 1);
    elseif getProperty('health') < 1.9 then
	   doTweenX('PlaneTweenX', 'dad', -450, 1);
	   doTweenX('bfTweenX', 'boyfriend', 490, 1);
	   doTweenX('gfTweenX', 'gf', 218, 1);
    elseif getProperty('health') < 2 then
	   doTweenX('PlaneTweenX', 'dad', -475, 1);
	   doTweenX('bfTweenX', 'boyfriend', 500, 1);
	   doTweenX('gfTweenX', 'gf', 220, 1);
	end
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 and dadName == 'green-nightmare-run' then
        setProperty('health', health- 0.018);
	end
	if getProperty('health') > 0.05 and dadName == 'green-nightmare-s' then
        setProperty('health', health- 0.026);
	end
	if getProperty('health') > 0.05 and dadName == 'green-flying' then
        setProperty('health', health- 0.02);
	end
end