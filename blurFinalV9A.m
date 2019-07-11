    
% Clear the workspace27
clear all;    
sca;  
  
%Collect Subject Number
subNum = subNum_V9A();

%Setup PsychToolbox
[window,xCenter,yCenter, ifi, topPriorityLevel] = PsychToolboxSetupV9A;
 screenParams = [window,xCenter,yCenter];

%%
%Setup Variables  
load('ConditionPV9A');
load('ConditionV9A');
% randomly choose the condition number
Condition = randsample(ConditionV9A,length(ConditionV9A));

Timing = [.180]; % premask, prime, postmask, stims
 
%%  1
%Instructions
InstructionsV9A(ConditionPV9A,screenParams, Timing, ifi);

%% Start Experiment
[Condition, times] = TrialStructureV9A(Condition,length(Condition),screenParams, Timing, ifi);
%%[Condition, times] = TrialStructureV9A(Condition,10,screenParams, Timing, ifi);
% Clear the screen
sca; 


subNum = subNum{1};
timing = ['timing_' subNum];
save (subNum, 'Condition');
save(timing , 'times');  

