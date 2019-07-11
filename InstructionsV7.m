function [] = InstructionsV7(ConditionP,screenParams, Timing, ifi)
window = screenParams(1);
xCenter = screenParams(2);
yCenter = screenParams(3);

%%
line1 = 'Welcome to the Visual Perception Lab!';
line2 = '\n\n The experimentor will read these instructions';
line3 = '\n\n to you while you follow along. Feel free to ask';
line4 = '\n\n questions at any time.';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2 line3 line4], 'center', 'center', 0);
Screen('Flip', window);

WaitForResponseV7('noMax');

%%
line1 = 'You will be looking at two objects and judging';
line2 = '\n\n if they are the same or different levels of blur. Here is an example of what';
line3 = '\n\n the two objects will look like:';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2 line3], 'center', 'center', 0);
Screen('Flip', window);

WaitForResponseV7('noMax');

%%
[Test, Standard, TestPosition, StandardPosition] = createStimTexturesV7(ConditionP(32),window,xCenter,yCenter);
Screen('DrawTexture', window, Test, [], TestPosition, 0);
Screen('DrawTexture', window, Standard, [], StandardPosition, 0);
Screen('Flip',window);
WaitForResponseV7('noMax');

%%


line1 = '\n If your answer is the two objects are the same,';
line2 = '\n\n press the top key. If your answer is the two objects are different,';
line3 = '\n\n press the bottom key.';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2 line3], 'center', 'center', 0);
Screen('Flip', window);

WaitForResponseV7('noMax');
%%


line1 = '\n You will see the same two objects throughout the';
line2 = '\n\n experiment. Their position on the screen will change,';
line3 = '\n\n and their blur level will change.';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2 line3], 'center', 'center', 0);
Screen('Flip', window);

WaitForResponseV7('noMax');

%%

line1 = '\n Here is an example of what you will see during';
line2 = '\n\n the experiment:';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2], 'center', 'center', 0);
Screen('Flip', window);
WaitForResponseV7('noMax');

%% White Fixation Cross
DrawFixationV7(1,screenParams);
Screen('Flip',window);
WaitForResponseV7('noMax');

%% pre-mask, prime, and postmask

preMaskSecs = Timing(1);
preMaskWait = round(preMaskSecs/ifi);

primeSecs = Timing(2);
primeWait = round(primeSecs/ifi);

postMaskSecs = Timing(3);
postMaskWait = round(postMaskSecs/ifi);

Screen('TextSize', window, 50);
Screen('TextStyle', window, 0);
DrawFormattedText(window, ConditionP(31).preMask, 'center', 'center', 0);
vbl = Screen('Flip', window);

DrawFormattedText(window, (ConditionP(31).prime), 'center', 'center', 0);
vbl = Screen('Flip', window, vbl + (preMaskWait - .5)* ifi);

DrawFormattedText(window, ConditionP(31).postMask, 'center', 'center', 0);
vbl = Screen('Flip', window, vbl + (primeWait - .5)* ifi);

DrawFixationV7(0,screenParams);
Screen('Flip', window, vbl + (postMaskWait - .5)* ifi);
WaitForResponseV7('noMax');

%% Draw Black Fixation Cross and Display Stims

[Test, Standard, TestPosition, StandardPosition] = createStimTexturesV7(ConditionP(33),window,xCenter,yCenter);

DrawFixationV7(0,screenParams);
Screen('DrawTexture', window, Test, [], TestPosition, 0);
Screen('DrawTexture', window, Standard, [], StandardPosition, 0);
Screen('Flip',window);
WaitForResponseV7('noMax');

%% Draw Black Fixation and Wait for Response

DrawFixationV7(0,screenParams);
Screen('Flip',window);
WaitForResponseV7('noMax');

%%
line1 = '\n Now you will do some practice trials to get';
line2 = '\n\n used to the timing. First you will see a trial';
line3 = '\n\n in real time, then you will practice on trials';
line4 = '\n\n with slower timing.';
line5 = '\n\n\n\n\n (press the space bar to continue)';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2 line3 line4 line5], 'center', 'center', 0);
Screen('Flip', window);

WaitForResponseV7('noMax');

%% One trial, real time

% premask, prime, postmask, stims
TrialStructureV7(ConditionP(31),1,screenParams,Timing, ifi);

%%

line1 = '\n Now we will slow down the timing';
line2 = '\n\n\n\n\n (press the space bar to continue)';


Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2], 'center', 'center', 0);
Screen('Flip', window);

WaitForResponseV7('noMax');

%% 10 trials, time 1

TimingSlowest = [Timing(1) Timing(2) (Timing(3)*2) (Timing(4)*2)]; % premask, prime, postmask, stims
ConditionP1 = ConditionP(1:10);
ConditionP1 = randsample(ConditionP1,10);
TrialStructureV7(ConditionP1,10,screenParams,TimingSlowest, ifi);

%%


line1 = '\n Now we will speed up the timing';
line2 = '\n\n\n\n\n (press the space bar to continue)';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2], 'center', 'center', 0);
Screen('Flip', window);
WaitForResponseV7('noMax');

%% 10 trials, time 2

TimingSlower = [Timing(1) Timing(2) (Timing(3)*1.5) (Timing(4)*1.5)];% premask, prime, postmask, stims
ConditionP2 = ConditionP(11:20);
ConditionP2 = randsample(ConditionP2,10);
TrialStructureV7(ConditionP2,10,screenParams,TimingSlower, ifi);

%%


line1 = '\n Now we will speed up the timing';
line2 = '\n\n This will be the actual timing of the experiment.';
line3 = '\n\n\n\n\n (press the space bar to continue)';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2 line3], 'center', 'center', 0);
Screen('Flip', window);

WaitForResponseV7('noMax');

%% 10 trials, time 3
ConditionP3 = ConditionP(21:30);
ConditionP3 = randsample(ConditionP3,10);
TrialStructureV7(ConditionP3,10,screenParams,Timing, ifi);

%%
line1 = '\n The practice trials are over, please press the';
line2 = '\n\n space bar to start the experiment';
line3 = '\n\n\n\n\n (press the space bar to continue)';

Screen('TextSize', window, 27);
Screen('TextStyle', window, 1);
DrawFormattedText(window, [line1 line2 line3], 'center', 'center', 0);
Screen('Flip', window);

WaitForResponseV7('noMax');

%% Clear Textures

Screen('Close', [Test Standard]);
Screen('Flip', window);

end

