
clear all;

Stim = {'anchor intact.BMP', 'anchor pr.BMP'}; % 1 = intact, 2 = PR
Position = {'left', 'right'}; % 1 = left, 2 = right
Prime = {'lamp' 'hawk' 'xxxx'; 'pole' 'chin' 'xxxx'}; % 1 = related, 2 = unrelated, 3 = none
TestBlur = [3, 4, 5, 6, 7, 8, 9, 10, 11];
Example = [1, 2, 3, 4, 5, 6, 7, 8];
ConditionV9A = struct('test', 'a', 'standard', 'a1', 'testPosition', 'b',...
    'prime', 'c', 'testBlur', 'd', 'example', 'e', 'ItemNum', 'f');


Test = Stim;
Standard = fliplr(Stim);

count = 1;

for a = 1:length(Stim)
    for b = 1:length(Position)
        for c = 1:length(Prime)
            for d = 1:length(TestBlur)
                for e = 1:length(Example)
                    ConditionV9A(count).test = cell2mat(Test(a));                    
                    A = num2str(a);
                    ConditionV9A(count).standard = cell2mat(Standard(a));
                    if a == 1;
                        A1 = '2';
                    else A1 = '1';
                    end;
                    ConditionV9A(count).testPosition = cell2mat(Position(b));
                    B = num2str(b);
                    if a == 1
                        ConditionV9A(count).prime = cell2mat(Prime(1,c));
                    elseif a == 2
                        ConditionV9A(count).prime = cell2mat(Prime(2,c));
                    end
                    C = num2str(c);
                    ConditionV9A(count).testBlur = TestBlur(d);
                    D = num2str(d);
                    ConditionV9A(count).example = Example(e);
                    E = num2str(e);
                    ConditionV9A(count).ItemNum = ['A',A,A1,B,C,D,E];                   
                    count = count+1;
                end
            end
        end
    end
end



%%
%Create Practice Conditions


ConditionPV9A = struct('test', 'a', 'standard', 'a1', 'testPosition', 'b',...
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
    ConditionPV9A(n).test = cell2mat(Test(PresOrder(1,n)));
    ConditionPV9A(n).standard = cell2mat(Standard(PresOrder(2,n)));
    ConditionPV9A(n).testPosition = cell2mat(Position(PresOrder(3,n)));
    if strcmp(ConditionPV9A(n).test,'anchor intact.BMP')
        ConditionPV9A(n).prime = cell2mat(Prime(1,(PresOrder(4,n))));
    else ConditionPV9A(n).prime = cell2mat(Prime(2,(PresOrder(4,n))));
    end
    ConditionPV9A(n).testBlur = TestBlur(PresOrder(5,n));
end

ConditionPV9A(33).test = cell2mat(Test(2));
ConditionPV9A(33).standard = cell2mat(Standard(2));
ConditionPV9A(33).testPosition = cell2mat(Position(2));
ConditionPV9A(33).testBlur = TestBlur(1);




save('ConditionV9A', 'ConditionV9A');
save('ConditionPV9A', 'ConditionPV9A');









