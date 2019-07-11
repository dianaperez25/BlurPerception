    
% Clear the workspace27
clear all;    
sca;  
  
%Collect Subject Number
subNum = subNum_V9B();

%Setup PsychToolbox
[window,xCenter,yCenter, ifi, topPriorityLevel] = PsychToolboxSetupV9B;
 screenParams = [window,xCenter,yCenter];

%%
%Setup Variables  
load('ConditionPV9B');
load('ConditionV9B');
% randomly choose the condition number
Condition = randsample(ConditionV9B,length(ConditionV9B));

Timing = [.180]; 
%%  1
%Instructions
InstructionsV9B(ConditionPV9B,screenParams, Timing, ifi);

%% Start Experiment
[Condition, times] = TrialStructureV9B(Condition,length(Condition),screenParams, Timing, ifi);
%[Condition, times] = TrialStructureV9B(Condition,10,screenParams, Timing, ifi);
% Clear the screen
sca; 


subNum = subNum{1};
timing = ['timing_' subNum];
save (subNum, 'Condition');
save(timing , 'times');

