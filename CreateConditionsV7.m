
clear all;

Stim = {'lamp intact.BMP', 'lamp PR.BMP'}; % 1 = intact, 2 = PR
Position = {'left', 'right'}; % 1 = left, 2 = right
Prime = {'lamp' 'hawk' 'xxxx'; 'pole' 'chin' 'xxxx'}; % 1 = related, 2 = unrelated, 3 = none
TestBlur = [3, 4, 5, 6, 7, 8, 9, 10, 11];
Example = [1, 2, 3, 4, 5, 6, 7, 8];
ConditionV7 = struct('test', 'a', 'standard', 'a1', 'testPosition', 'b',...
    'prime', 'c', 'preMask', 'g', 'postMask', 'g', 'testBlur', 'd', 'example', 'e', 'ItemNum', 'f');
load('postMaskV7');

Test = Stim;
Standard = fliplr(Stim);

count = 1;

for a = 1:length(Stim)
    for b = 1:length(Position)
        for c = 1:length(Prime)
            for d = 1:length(TestBlur)
                for e = 1:length(Example)
                    ConditionV7(count).test = cell2mat(Test(a));                    
                    A = num2str(a);
                    ConditionV7(count).standard = cell2mat(Standard(a));
                    if a == 1;
                        A1 = '2';
                    else A1 = '1';
                    end;
                    ConditionV7(count).testPosition = cell2mat(Position(b));
                    B = num2str(b);
                    if a == 1
                        ConditionV7(count).prime = cell2mat(Prime(1,c));
                    elseif a == 2
                        ConditionV7(count).prime = cell2mat(Prime(2,c));
                    end
                    C = num2str(c);
                    ConditionV7(count).testBlur = TestBlur(d);
                    D = num2str(d);
                    ConditionV7(count).example = Example(e);
                    E = num2str(e);
                    ConditionV7(count).ItemNum = [A,A1,B,C,D,E];                   
                    ConditionV7(count).preMask = '####';
                    ConditionV7(count).postMask = cell2mat(postMaskV7(count));
                    count = count+1;
                end
            end
        end
    end
end

% %% add postmask
% 
% 
% 
% for y = 1:length(Condition);    
%     Condition(y).postMask = cell2mat(postMask(y));    
% end
% 

%%
%Create Practice Conditions
load('postMaskPV7');

ConditionPV7 = struct('test', 'a', 'standard', 'a1', 'testPosition', 'b',...
    'prime', 'c', 'preMask', 'g', 'postMask', 'g', 'testBlur', 'd');

% Practice Balancing
T =             [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
                 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]; % Test
             
S =             [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
                 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]; %Standard
             
tP =            [1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, ...
                 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2];%testPosition
             
P =             [3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3,...
                 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1];%Prime
             
B =             [1, 2, 3, 4, 6, 7, 8, 9, 1, 2, 3, 4, 6, 7, 8, 9,...
                 1, 2, 3, 4, 6, 7, 8, 9, 1, 2, 3, 4, 6, 7, 8, 9]; %Blur

PresOrder = [T; S; tP; P; B];

for n = 1:32;
    ConditionPV7(n).test = cell2mat(Test(PresOrder(1,n)));
    ConditionPV7(n).standard = cell2mat(Standard(PresOrder(2,n)));
    ConditionPV7(n).testPosition = cell2mat(Position(PresOrder(3,n)));
    if strcmp(ConditionPV7(n).test,'lamp intact.BMP')
        ConditionPV7(n).prime = cell2mat(Prime(1,(PresOrder(4,n))));
    else ConditionPV7(n).prime = cell2mat(Prime(2,(PresOrder(4,n))));
    end
    ConditionPV7(n).testBlur = TestBlur(PresOrder(5,n));
    ConditionPV7(n).preMask = '####';
    ConditionPV7(n).postMask = cell2mat(postMaskPV7(n));
end

ConditionPV7(33).test = cell2mat(Test(2));
ConditionPV7(33).standard = cell2mat(Standard(2));
ConditionPV7(33).testPosition = cell2mat(Position(2));
ConditionPV7(33).testBlur = TestBlur(1);





save('ConditionV7', 'ConditionV7');
save('ConditionPV7', 'ConditionPV7');









