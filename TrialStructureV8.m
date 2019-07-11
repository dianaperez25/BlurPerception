function [ Condition, times ] = TrialStructureV8(Condition,numTrials,screenParams, Timing, ifi)

window = screenParams(1);
xCenter = screenParams(2);
yCenter = screenParams(3);



stimsSecs = Timing(1);
stimsWait = round(stimsSecs/ifi);

for n = 1:numTrials
    
    Screen('TextSize', window, 50);
    Screen('TextStyle', window, 0);
    
    [Test, Standard, TestPosition, StandardPosition] = createStimTexturesV8(Condition(n),window,xCenter,yCenter);
    
    %%
    %frame 1 white fixation cross
    DrawFixationV8(1,screenParams);
    Screen('Flip',window);
    WaitForResponseV8('noMax');
    
    
    
    %Frame 6 Draw Black Fixation Cross and Display Stims
    DrawFixationV8(0,screenParams);
    Screen('DrawTexture', window, Test, [], TestPosition, 0);
    Screen('DrawTexture', window, Standard, [], StandardPosition, 0);
    %vbl = Screen('Flip', window, vbl + (postMaskWait - .5)* ifi);
    vbl = Screen ('Flip', window);
    times(1,n) = vbl;
    
    
    %%
    %Frame 7 Draw Black Fixation and Wait for Response
    DrawFixationV8(0,screenParams);
    vbl = Screen('Flip', window, vbl + (stimsWait - .5)* ifi);
    times(2,n) = vbl;
    [Condition(n).Response Condition(n).reactionTime] = WaitForResponseV8(3,vbl);
    
    Screen('Close', [Test Standard]);
    
    %%
    % Breaks
    
    
    
    if (n == 72) || (n == 144) || (n == 216) || (n == 288) || (n == 360) ||...
            (n == 504) || (n == 576) || (n == 648) || (n == 720) || (n == 792);
        
        line1 = 'End of Block. Please take a moment to look around';
        line2 = '\n\n the room before continuing.';
        line3 = '\n\n Reminder: choose whether the objects look the same or different.';
        
        
        Screen('TextSize', window, 27);
        Screen('TextStyle', window, 1);
        DrawFormattedText(window, [line1 line2 line3], 'center', 'center', 0);
        
        Screen('Flip', window);
        WaitForResponseV8('noMax');
        WaitForResponseV8('noMax');
        
    elseif (n == 432);
        
        line1 = 'End of Block.';
        line2 = '\n\n You are halfway through the experiment, please notify';
        line3 = '\n\n\n the experimentor before continuing.';
        
        Screen('TextSize', window, 27);
        Screen('TextStyle', window, 1);
        DrawFormattedText(window, [line1 line2 line3], 'center', 'center', 0);
        
        % Flip to the screen
        Screen('Flip', window);
        
        WaitForResponseV8('noMax');
        WaitForResponseV8('noMax');
        
        
        
    end
end

%%
% experiment is over

if n == 864;
    
    line1 = 'The experiment is over.';
    line2 = '\n\n Please notify the experimenter.';
    
    Screen('TextSize', window, 27);
    Screen('TextStyle', window, 1);
    DrawFormattedText(window, [line1 line2], 'center', 'center', 0);
    
    % Flip to the screen
    Screen('Flip', window);
    
    WaitForResponseV8('noMax');
    WaitForResponseV8('noMax');
end
end



