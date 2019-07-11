function [response] = WaitForResponseV5(targTime,dispTime)

 leftKey = KbName('LeftArrow');
rightKey = KbName('RightArrow');
spaceBar = KbName('space');

if strcmp(targTime,'noMax')
    respToBeMade = true;
    while respToBeMade
        [keyIsDown,secs, keyCode] = KbCheck;
          if keyCode(spaceBar)
            respToBeMade = false;
        end
    end
else
    runtime = 0;
    respToBeMade = true;
    while (respToBeMade == true) && (runtime < targTime);
        runtime = GetSecs - dispTime;
        [keyIsDown,secs, keyCode] = KbCheck;
        if keyCode(leftKey)
            response = 1;
            respToBeMade = false;
        elseif keyCode(rightKey)
            response = 0;
            respToBeMade = false;
        end
    end
    if respToBeMade == true;
        response = 2;
    end
    
end
pause(.5);
end 


