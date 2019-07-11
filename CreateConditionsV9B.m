
clear all;

Stim = {'woman intact.BMP', 'woman pr.BMP'}; % 1 = intact, 2 = PR
Position = {'left', 'right'}; % 1 = left, 2 = right
Prime = {'lamp' 'hawk' 'xxxx'; 'pole' 'chin' 'xxxx'}; % 1 = related, 2 = unrelated, 3 = none
TestBlur = [3, 4, 5, 6, 7, 8, 9, 10, 11];
Example = [1, 2, 3, 4, 5, 6, 7, 8];
ConditionV9B = struct('test', 'a', 'standard', 'a1', 'testPosition', 'b',...
    'prime', 'c', 'testBlur', 'd', 'example', 'e', 'ItemNum', 'f');


Test = Stim;
Standard = fliplr(Stim);

count = 1;

for a = 1:length(Stim)
    for b = 1:length(Position)
        for c = 1:length(Prime)
            for d = 1:length(TestBlur)
                for e = 1:length(Example)
                    ConditionV9B(count).test = cell2mat(Test(a));                    
                    A = num2str(a);
                    ConditionV9B(count).standard = cell2mat(Standard(a));
                    if a == 1;
                        A1 = '2';
                    else A1 = '1';
                    end;
                    ConditionV9B(count).testPosition = cell2mat(Position(b));
                    B = num2str(b);
                    if a == 1
                        ConditionV9B(count).prime = cell2mat(Prime(1,c));
                    elseif a == 2
                        ConditionV9B(count).prime = cell2mat(Prime(2,c));
                    end
                    C = num2str(c);
                    ConditionV9B(count).testBlur = TestBlur(d);
                    D = num2str(d);
                    ConditionV9B(count).example = Example(e);
                    E = num2str(e);
                    ConditionV9B(count).ItemNum = [A,A1,B,C,D,E];                   
                    
                    count = count+1;
                end
            end
        end
    end
end


%%
%Create Practice Conditions


ConditionPV9B = struct('test', 'a', 'standard', 'a1', 'testPosition', 'b',...
    'prime', 'c', 'testBlur', 'd');

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
    ConditionPV9B(n).test = cell2mat(Test(PresOrder(1,n)));
    ConditionPV9B(n).standard = cell2mat(Standard(PresOrder(2,n)));
    ConditionPV9B(n).testPosition = cell2mat(Position(PresOrder(3,n)));
    if strcmp(ConditionPV9B(n).test,'woman intact.BMP')
        ConditionPV9B(n).prime = cell2mat(Prime(1,(PresOrder(4,n))));
    else ConditionPV9B(n).prime = cell2mat(Prime(2,(PresOrder(4,n))));
    end
    ConditionPV9B(n).testBlur = TestBlur(PresOrder(5,n));
end

ConditionPV9B(33).test = cell2mat(Test(2));
ConditionPV9B(33).standard = cell2mat(Standard(2));
ConditionPV9B(33).testPosition = cell2mat(Position(2));
ConditionPV9B(33).testBlur = TestBlur(1);




save('ConditionV9B', 'ConditionV9B');
save('ConditionPV9B', 'ConditionPV9B');









