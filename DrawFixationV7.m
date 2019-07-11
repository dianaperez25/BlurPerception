function [] = DrawFixationV5(color,screenParams)



window = screenParams(1);
xCenter = screenParams(2);
yCenter = screenParams(3);

% Here we set the size of the arms of our fixation cross
fixCrossDimPix = 20;

% Now we set the coordinates (these are all relative to zero we will let
% the drawing routine center the cross in the center of our monitor for us)
xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

% Set the line width for our fixation cross
lineWidthPix = 4;

 Screen('DrawLines', window, allCoords,...
    lineWidthPix, color, [xCenter yCenter], 2);
end

