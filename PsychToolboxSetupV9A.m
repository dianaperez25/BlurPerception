function [window,xCenter,yCenter, ifi, topPriorityLevel] = PsychToolboxSetupV7() 

Screen('Preference', 'SkipSyncTests', 1);

PsychDefaultSetup(2);

% Set the screen number to the external secondary monitor if there is one
% connected
screenNumber = max(Screen('Screens'));
% screenNumber = 1;
grey = (182/255);

% Open the screen
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey, [], 32, 2,...
    [], [],  kPsychNeed32BPCFloat);

% Flip to clear
Screen('Flip', window);

% Query the frame duration
ifi = Screen('GetFlipInterval', window);

% Query the maximum priority level
topPriorityLevel = MaxPriority(window);

% Get the centre coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

%[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

%Hide the Mouse
HideCursor();

% Screen('Preference', 'SkipSyncTests', 1);
rng('shuffle');

end

