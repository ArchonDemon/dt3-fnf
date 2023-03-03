function onCreate()
	-- background shit
	makeLuaSprite('0','C_00', -1000, -600);
	setScrollFactor('0', 0.1, 0.1);
	scaleObject('0', 2, 2)
	addLuaSprite('0', false);

	makeLuaSprite('2','C_02', 0, -300);
	setScrollFactor('2', 0.2, 0.2);
	addLuaSprite('2', false);

	makeLuaSprite('3','C_03', 0, -300);
	setScrollFactor('3', 0.5, 0.5);
	addLuaSprite('3', false);

	makeLuaSprite('4','C_04', 0, -300);
	setScrollFactor('4', 0.3, 0.3);
	addLuaSprite('4', false);

	makeLuaSprite('6','C_06', 0, -300);
	setScrollFactor('6', 0.2, 0.2);
	setProperty('6.alpha', 0)

	makeLuaSprite('7','C_07', 0, -300);
	addLuaSprite('7', false);
	setProperty('7.alpha', 0)

	makeLuaSprite('sbg','stairs_bg', -1500, -600);
	setScrollFactor('sbg', 0.1, 0.1);
	scaleObject('sbg', 2, 2)
	addLuaSprite('sbg', false);

	makeAnimatedLuaSprite('hallway','Fuck_the_hallway', -7000, 100);
	setScrollFactor('hallway', 1, 1);
	addAnimationByPrefix('hallway', 'Animation', 'Loop01 instance 1', 50, true);
	objectPlayAnimation('hallway', 'Animation', false);
	addLuaSprite('hallway', false);

	makeAnimatedLuaSprite('hallway2','Fuck_the_hallway', -670, 100);
	setScrollFactor('hallway2', 1, 1);
	addAnimationByPrefix('hallway2', 'Animation', 'Loop01 instance 1', 50, true);
	objectPlayAnimation('hallway2', 'Animation', false);
	addLuaSprite('hallway2', false);

	makeAnimatedLuaSprite('hallway3','Fuck_the_hallway', 5750, 100);
	setScrollFactor('hallway3', 1, 1);
	addAnimationByPrefix('hallway3', 'Animation', 'Loop01 instance 1', 50, true);
	objectPlayAnimation('hallway3', 'Animation', false);
	addLuaSprite('hallway3', false);

	makeAnimatedLuaSprite('dark','Fuck_the_hallway', -750, 100);
	setScrollFactor('dark', 1, 1);
	addAnimationByPrefix('dark', 'Animation', 'Tunnel instance 1', 50, true);
	objectPlayAnimation('dark', 'Animation', false);
	addLuaSprite('dark', false);
	setProperty('dark.alpha', 0)

	makeAnimatedLuaSprite('dark2','Fuck_the_hallway', -7000, 100);
	setScrollFactor('dark2', 1, 1);
	addAnimationByPrefix('dark2', 'Animation', 'Tunnel instance 1', 50, true);
	objectPlayAnimation('dark2', 'Animation', false);
	addLuaSprite('dark2', false);
	setProperty('dark2.alpha', 0)

	makeAnimatedLuaSprite('flyway','Fuck_the_hallway', -7000, 100);
	setScrollFactor('flyway', 1, 1);
	addAnimationByPrefix('flyway', 'Animation', 'Loop04 instance 1', 50, true);
	objectPlayAnimation('flyway', 'Animation', false);
	addLuaSprite('flyway', false);
	setProperty('flyway.alpha', 0)

	makeAnimatedLuaSprite('flyway2','Fuck_the_hallway', -670, 100);
	setScrollFactor('flyway2', 1, 1);
	addAnimationByPrefix('flyway2', 'Animation', 'Loop04 instance 1', 50, true);
	objectPlayAnimation('flyway2', 'Animation', false);
	addLuaSprite('flyway2', false);
	setProperty('flyway2.alpha', 0)

	makeAnimatedLuaSprite('transis','Trans', 0, 0);
	setScrollFactor('transis', 1, 1);
	addAnimationByPrefix('transis', 'trans', 'beb instance 1', 50, true);
	objectPlayAnimation('transis', 'incis', false);
	setObjectCamera('transis', 'other');
	addLuaSprite('transis', true);
	setProperty('transis.alpha', 0)

	makeAnimatedLuaSprite('this','this', -3000, -190);
	setScrollFactor('this', 1, 1);
	addAnimationByPrefix('this', 'this', 'this', 50, true);
	objectPlayAnimation('this', 'this', false);
	addLuaSprite('this', true);
	setProperty('this.alpha', 0)

	makeAnimatedLuaSprite('stairs','fokin_stairs', -3500, -400);
	setScrollFactor('stairs', 1, 1);
	addAnimationByPrefix('stairs', 'stairs', 'stairs', 50, true);
	objectPlayAnimation('stairs', 'stairs', false);
	addLuaSprite('stairs', true);
	setProperty('stairs.alpha', 0)

	setProperty('defaultCamZoom',1.4)
end

function onStepHit()
	if curStep == 416 then
	doTweenAlpha('transAlpha', 'transis', 1, 0.1);
	doTweenAlpha('tunnelAlpha', 'dark', 1, 0.5);
	doTweenAlpha('tunnel2Alpha', 'dark2', 1, 0.5);
	end
	if curStep == 422 then
	doTweenAlpha('transAlpha', 'transis', 0, 0.1);
	end
	if curStep == 544 then
	doTweenAlpha('transAlpha', 'transis', 1, 0.1);
	doTweenAlpha('tunnelAlpha', 'dark', 0, 0.5);
	doTweenAlpha('tunnel2Alpha', 'dark2', 0, 0.5);
	end
	if curStep == 550 then
	doTweenAlpha('transAlpha', 'transis', 0, 0.1);
	end
	if curStep == 784 then
	doTweenAlpha('transAlpha', 'transis', 1, 0.1);
	doTweenAlpha('stairsAlpha', 'stairs', 1, 0.1);
	doTweenAlpha('hAlpha', 'hallway', 0, 0.5);
	doTweenAlpha('h2Alpha', 'hallway2', 0, 0.5);
	setProperty('defaultCamZoom',1)
	end
	if curStep == 790 then
	doTweenAlpha('transAlpha', 'transis', 0, 0.1);
	end
	if curStep == 1056 then
	doTweenAlpha('sbgTweenX', 'sbg', 0, 0.1);
	doTweenAlpha('stairsAlpha', 'stairs', 0, 0.1);
	doTweenX('0TweenX', '0', -1300, 25);
	doTweenX('2TweenX', '2', -600, 25);
	doTweenX('3TweenX', '3', -600, 25);
	doTweenX('4TweenX', '4', -600, 25);
	doTweenX('6TweenX', '6', -600, 25);
	doTweenX('7TweenX', '7', -600, 25);
	doTweenAlpha('transAlpha', 'transis', 1, 0.1);
	doTweenAlpha('thisAlpha', 'this', 1, 0.5);
	doTweenAlpha('6Alpha', '6', 1, 0.5);
	doTweenAlpha('7Alpha', '7', 1, 0.5);
	setProperty('defaultCamZoom',0.6)
	end
	if curStep == 1062 then
	doTweenAlpha('transAlpha', 'transis', 0, 0.1);
	end
	if curStep == 1312 then
	doTweenAlpha('transAlpha', 'transis', 1, 0.1);
	doTweenAlpha('thisAlpha', 'this', 0, 0.5);
	doTweenAlpha('1Alpha', '1', 0, 0.5);
	doTweenAlpha('2Alpha', '2', 0, 0.5);
	doTweenAlpha('3Alpha', '3', 0, 0.5);
	doTweenAlpha('4Alpha', '4', 0, 0.5);
	doTweenAlpha('5Alpha', '5', 0, 0.5);
	doTweenAlpha('6Alpha', '6', 0, 0.5);
	doTweenAlpha('7Alpha', '7', 0, 0.5);
	doTweenAlpha('hAlpha', 'hallway', 1, 0.5);
	doTweenAlpha('h2Alpha', 'hallway2', 1, 0.5);
	setProperty('defaultCamZoom',1.4)
	end
	if curStep == 1320 then
	doTweenAlpha('transAlpha', 'transis', 0, 0.1);
	end
	if curStep == 1440 then
	doTweenAlpha('transAlpha', 'transis', 1, 0.1);
	doTweenAlpha('tunnelAlpha', 'dark', 1, 0.5);
	doTweenAlpha('tunnel2Alpha', 'dark2', 1, 0.5);
	end
	if curStep == 1446 then
	doTweenAlpha('transAlpha', 'transis', 0, 0.1);
	end
	if curStep == 1664 then
	doTweenAlpha('gfAlpha', 'gf', 0, 0.1);
	doTweenAlpha('transAlpha', 'transis', 1, 0.1);
	doTweenAlpha('tunnelAlpha', 'dark', 0, 0.5);
	doTweenAlpha('tunnel2Alpha', 'dark2', 0, 0.5);
	doTweenAlpha('flyAlpha', 'flyway', 1, 0.1);
	doTweenAlpha('fly2Alpha', 'flyway2', 1, 0.1);
	doTweenAlpha('hAlpha', 'hallway', 0, 0.5);
	doTweenAlpha('h2Alpha', 'hallway2', 0, 0.5);
	end
	if curStep == 1670 then
	doTweenAlpha('transAlpha', 'transis', 0, 0.1);
	end
end