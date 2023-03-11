function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('event');
	precacheSound('Dodged');
	precacheSound('dmg-spite');
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('event', 'event', 450, 300);
    luaSpriteAddAnimationByPrefix('event', 'warning', 'warning', 25, true);
	luaSpritePlayAnimation('event', 'warning');
	setObjectCamera('event', 'other');

	makeAnimatedLuaSprite('rock', 'event', getProperty('boyfriend.x'), getProperty('boyfriend.y'));
    luaSpriteAddAnimationByPrefix('rock', 'rock', 'rock', 25, true);
	luaSpritePlayAnimation('rock', 'rock');
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	addLuaSprite('event', true);
	luaSpritePlayAnimation('event', 'warning');
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   
   Dodged = true;
   addLuaSprite('rock', true); 
   playSound('Dodged', 0.7);
   characterPlayAnim('boyfriend', 'dodge up', true);
   setProperty('boyfriend.specialAnim', true);
   characterPlayAnim('dad', 'shoot', true);
   setProperty('dad.specialAnim', true);
   runtimer('dodged', 0.4)
   removeLuaSprite('event');
   setProperty('health', getProperty('health')+0.4);
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   playSound('dmg-spite', 0.7);
   setProperty('health', getProperty('health')-0.4);
   characterPlayAnim('boyfriend', 'hurt', true);
   setProperty('boyfriend.specialAnim', true);
   characterPlayAnim('dad', 'shoot', true);
   setProperty('dad.specialAnim', true);
   addLuaSprite('rock', true);
   runtimer('dodged', 0.4)
   removeLuaSprite('event');
   
   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   end
   if tag == 'Died' then
   removeLuaSprite('rock');
   removeLuaSprite('event');
   end
end