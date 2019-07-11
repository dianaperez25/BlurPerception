function [ Condition, times ] = TrialStructureV7(Condition,numTrials,screenParams, Timing, ifi)

window = screenParams(1);
xCenter = screenParams(2);
yCenter = screenParams(3);

% preMaskSecs = Timing(1);
% preMaskWait = round(preMaskSecs/ifi);
% 
% primeSecs = Timing(2);
% primeWait = round(primeSecs/ifi);
% 
% postMaskSecs = Timing(3);
% postMaskWait = round(postMaskSecs/ifi);

% ISISecs = 0;
% ISIWait = round(ISISecs/ifi);

stimsSecs = Timing(1);
stimsWait = round(stimsSecs/ifi);

for n = 1:numTrials
    
    Screen('TextSize', window, 50);
    Screen('TextStyle', window, 0);
    
    [Test, Standard, TestPosition, StandardPosition] = createStimTexturesV9A(Condition(n),window,xCenter,yCenter);
    
    %%
    %frame 1 white fixation cross
    DrawFixationV9A(1,screenParams);
    Screen('Flip',window);
    WaitForResponseV9A('noMax');
    
    %% Frame 2 pre-mask
%     DrawFormattedText(window, Condition(n).preMask, 'center', 'center', 0);
%     vbl = Screen('Flip', window);
%     times(1,n) = vbl;
    
    %%
    %Frame 3 prime
%     DrawFormattedText(window, (Condition(n).prime), 'center', 'center', 0);
%     vbl = Screen('Flip', window, vbl + (preMaskWait - .5)* ifi);
%     times(2,n) = vbl;
    
    
    %%
    %Frame 4 post-Mask
%     DrawFormattedText(window, Condition(n).postMask, 'center', 'center', 0);
%     vbl = Screen('Flip', window, vbl + (primeWait - .5)* ifi);
%     times(3,n) = vbl;
    
    %     %%
    %     %Frame 5 ISI
    %     DrawFixation(0,screenParams);
    %      vbl = Screen('Flip', window, vbl + (postMaskWait - .5)* ifi);
    %     times(4,n) = vbl;
    
    
    %%
    %Frame 6 Draw Black Fixation Cross and Display Stims
    DrawFixationV9A(0,screenParams);
    Screen('DrawTexture', window, Test, [], TestPosition, 0);
    Screen('DrawTexture', window, Standard, [], StandardPosition, 0);
    %vbl = Screen('Flip', window, vbl + (postMaskWait - .5)* ifi);
    vbl = Screen ('Flip', window);
    times(1,n) = vbl;
    
    
    %%
    %Frame 7 Draw Black Fixation and Wait for Response
    DrawFixationV9A(0,screenParams);
    vbl = Screen('Flip', window, vbl + (stimsWait - .5)* ifi);
    times(2,n) = vbl;
    [Condition(n).Response Condition(n).reactionTime] = WaitForResponseV9A(3,vbl);
    
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
        WaitForResponseV9A('noMax');
        WaitForResponseV9A('noMax');
        
    elseif (n == 432);
        
        line1 = 'End of Block.';
        line2 = '\n\n You are halfway through the experiment, please notify';
        line3 = '\n\n\n the experimentor before continuing.';
        
        Screen('TextSize', window, 27);
        Screen('TextStyle', window, 1);
        DrawFormattedText(window, [line1 line2 line3], 'center', 'center', 0);
        
        % Flip to the screen
        Screen('Flip', window);
        
        WaitForResponseV9A('noMax');
        WaitForResponseV9A('noMax');
        
        
        
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
    
    WaitForResponseV9A('noMax');
    WaitForResponseV9A('noMax');
end
end



