local followchars = true;
local del = 0;
local del2 = 0;
local xx = 600;
local yy = 480;
local xx2 = 1070;
local yy2 = 480;
local ofs = 50;

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.3 then
        setProperty('health', health- 0.015);
    end
end

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'hey' then
                triggerEvent('Camera Follow Pos',xx-ofs-ofs,yy-ofs)
                setProperty('defaultCamZoom',1.6)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'attackRIGHT' then
                triggerEvent('Camera Follow Pos',xx,yy)
                setProperty('defaultCamZoom',2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'attackLEFT' then
                triggerEvent('Camera Follow Pos',xx,yy)
                setProperty('defaultCamZoom',2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'attackDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy)
                setProperty('defaultCamZoom',2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'attackUP' then
                triggerEvent('Camera Follow Pos',xx,yy)
                setProperty('defaultCamZoom',2)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'attackRIGHT' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
                setProperty('defaultCamZoom',2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'attackLEFT' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
                setProperty('defaultCamZoom',2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'attackDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
                setProperty('defaultCamZoom',2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'attackUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
                setProperty('defaultCamZoom',2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end