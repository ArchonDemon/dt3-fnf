local turn = 10
local turn2 = 20
local y = 0;
local x = 0;
local canBob = true
local Strums = 'opponentStrums'
local md = 2

function onBeatHit()
    if md == 1 then
    turn = turn * 4
    end
    if curBeat % 2 == 0 and canBob and md == 1 then 
        turn2 = turn2 * -1
        for i = 0,7 do
            local uhhh = curBeat % 8 * (i + i)
            local swag = i % 4 * 2.5 - uhhh
            if i > 3 then
                x =  getPropertyFromGroup('opponentStrums', i-4, 'x');
            else
                x =  getPropertyFromGroup('playerStrums', i, 'x');
            end
            --noteTweenY("wheeeup"..i,i,y + turn,crochet*0.002,"sineInOut")
            noteTweenX("wheeeleft"..i,i,x + turn2,crochet*0.002,"sineInOut")
        end
    end
end

function onEvent(name, value1, value2)
  if name == 'StrumYeet' then
  md = md - 1
  y = defaultOpponentStrumY1;
  noteTweenAlpha("vanish0",0,0.5,crochet*0.004,"sineInOut")
  noteTweenAlpha("vanish1",1,0.5,crochet*0.0045,"sineInOut")
  noteTweenAlpha("vanish2",2,0.5,crochet*0.005,"sineInOut")
  noteTweenAlpha("vanish3",3,0.5,crochet*0.0055,"sineInOut")
  end
end