   
% Clear the workspace
clear all;    
sca; 
 
%Collect Subject Number
subNum = subNum_V7();

%Setup PsychToolbox
[window,xCenter,yCenter, ifi, topPriorityLevel] = PsychToolboxSetupV7;
 screenParams = [window,xCenter,yCenter];

%%
%Setup Variables
load('ConditionPV7');
load('ConditionV7');
% randomly choose the condition number
Condition = randsample(ConditionV7,length(ConditionV7));

Timing = [.350 .050 .070 .180]; % premask, prime, postmask, stims

%%  
%Instructions
InstructionsV7(ConditionPV7,screenParams, Timing, ifi);

%% Start Experiment
[Condition, times] = TrialStructureV7(Condition,length(Condition),screenParams, Timing, ifi);
% [Condition, times] = TrialStructureV7(Condition,10,screenParams, Timing, ifi);
% Clear the screen
sca;


subNum = subNum{1};
timing = ['timing_' subNum];
save (subNum, 'Condition');
save(timing , 'times');

