                                        
 %Clear the workspace
clear;    
sca; 

%Collect Subject Number
subNum = subNum_V4();

%Setup PsychToolbox
[window,xCenter,yCenter, ifi, topPriorityLevel] = PsychToolboxSetupV4;
 screenParams = [window,xCenter,yCenter];

%%
%Setup Variables
load('ConditionPV4');
load('ConditionV4');
% randomly choose the condition number
Condition = randsample(ConditionV4,length(ConditionV4));

Timing = [.350 .040 .080 .180]; % premask, prime, postmask, stims

%%  
%Instructions
InstructionsV4(Condition,screenParams, Timing, ifi);

%% Start Experiment
[Condition, times] = TrialStructureV4(Condition,length(Condition),screenParams, Timing, ifi);

% Clear the screen
sca;

subNum = subNum{1};
timing = ['timing_' subNum];
save (subNum, 'Condition');
save(timing , 'times');

