   
% Clear the workspace
clear;    
sca; 

%Collect Subject Number
subNum = subNum_V5();

%Setup PsychToolbox
[window,xCenter,yCenter, ifi, topPriorityLevel] = PsychToolboxSetupV5;
screenParams = [window,xCenter,yCenter];

%%
%Setup Variables
load('ConditionPV5');
load('ConditionV5');
% randomly choose the condition number
Condition = randsample(ConditionV5,length(ConditionV5));

Timing = [.350 .050 .070 .180]; % premask, prime, postmask, stims

%%  
%Instructions
InstructionsV5(ConditionPV5,screenParams, Timing, ifi);

%% Start Experiment
[Condition, times] = TrialStructureV5(Condition,length(Condition),screenParams, Timing, ifi);

% Clear the screen
sca;


subNum = subNum{1};
timing = ['timing_' subNum];
save (subNum, 'Condition');
save(timing , 'times');

