    
% Clear the workspace27
clear all;    
sca;  
  
%Collect Subject Number
subNum = subNum_V8();

%Setup PsychToolbox
[window,xCenter,yCenter, ifi, topPriorityLevel] = PsychToolboxSetupV8;
 screenParams = [window,xCenter,yCenter];

%%
%Setup Variables  
load('ConditionPV8');
load('ConditionV8');
% randomly choose the condition number
Condition = randsample(ConditionV8,length(ConditionV8));

Timing = [.180]; % premask, prime, postmask, stims

%%  
%Instructions
InstructionsV8(ConditionPV8,screenParams, Timing, ifi);

%% Start Experiment
[Condition, times] = TrialStructureV8(Condition,length(Condition),screenParams, Timing, ifi);
% [Condition, times] = TrialStructureV8(Condition,10,screenParams, Timing, ifi);
% Clear the screen
sca;


subNum = subNum{1};
timing = ['timing_' subNum];
save (subNum, 'Condition');
save(timing , 'times');



