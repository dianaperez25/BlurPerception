function [response, reactionTime] = WaitForResponseV7(targTime,dispTime)

leftKey = KbName('1');
rightKey = KbName('3');
spaceBar = KbName('space');

if strcmp(targTime,'noMax')
    %RestrictKeysForKbCheck([32]);
    respToBeMade = true;
    while respToBeMade
        [keyIsDown,secs, keyCode] = KbCheck;
         if keyCode(spaceBar)
         respToBeMade = false;
         end
    end
    RestrictKeysForKbCheck([]);
else
       
   % RestrictKeysForKbCheck([97, 99]);    
    secs = 0;
    runtime = 0; % time elapsed
    respToBeMade = true;
    while (respToBeMade == true) && (runtime < targTime); % while a response
        % hasnt been made and elapsed time is less than target time
        runtime = GetSecs - dispTime; % time elapsed = current time - onset of response period
        [keyIsDown,secs, keyCode] = KbCheck;
        if keyCode(leftKey)
            response = 1;
            respToBeMade = false;
        elseif keyCode(rightKey)
            response = 0;
            respToBeMade = false;
        end
    end
    reactionTime = secs - dispTime; %reaction time = time of key press - onset of response window
    RestrictKeysForKbCheck([]);
    if respToBeMade == true;
        response = 2;
        reactionTime = .301;
    end    
end

pause(.5);
  end 


