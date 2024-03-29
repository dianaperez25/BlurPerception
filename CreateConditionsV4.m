
clear all;

Stim = {'lamp intact.BMP', 'Lamp PR.BMP'}; % 1 = intact, 2 = PR
Position = {'left', 'right'}; % 1 = left, 2 = right
Prime = {'lamp' 'hawk' 'xxxx'; 'pole' 'chin' 'xxxx'}; % 1 = related, 2 = unrelated, 3 = none
TestBlur = [3, 4, 5, 6, 7, 8, 9, 10, 11];
Example = [1, 2, 3, 4, 5, 6, 7, 8];
ConditionV4 = struct('test', 'a', 'standard', 'a1', 'testPosition', 'b',...
    'prime', 'c', 'preMask', 'g', 'postMask', 'g', 'testBlur', 'd', 'example', 'e', 'ItemNum', 'f');


Test = Stim;
Standard = fliplr(Stim);

count = 1;

for a = 1:length(Stim)
    for b = 1:length(Position)
        for c = 1:length(Prime)
            for d = 1:length(TestBlur)
                for e = 1:length(Example)
                    ConditionV4(count).test = cell2mat(Test(a));                    
                    A = num2str(a);
                    ConditionV4(count).standard = cell2mat(Standard(a));
                    if a == 1;
                        A1 = '2';
                    else A1 = '1';
                    end;
                    ConditionV4(count).testPosition = cell2mat(Position(b));
                    B = num2str(b);
                    if a == 1
                        ConditionV4(count).prime = cell2mat(Prime(1,c));
                    elseif a == 2
                        ConditionV4(count).prime = cell2mat(Prime(2,c));
                    end
                    C = num2str(c);
                    ConditionV4(count).testBlur = TestBlur(d);
                    D = num2str(d);
                    ConditionV4(count).example = Example(e);
                    E = num2str(e);
                    ConditionV4(count).ItemNum = [A,A1,B,C,D,E];                    
                    count = count+1;            
                end
            end
        end
    end
end

%% add postmask

load('preMaskV4');
load('postMaskV4');

for y = 1:length(ConditionV4);    
    ConditionV4(y).preMask = cell2mat(preMaskV4(y));
    ConditionV4(y).postMask = cell2mat(postMaskV4(y));    
end


%%
%Create Practice Conditions
load('preMaskPV4');
load('postMaskPV4');

ConditionPV4(1) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,1), 'preMask', preMaskPV4(1), 'postMask',...
    postMaskPV4(1), 'testBlur', TestBlur(1),'ItemNum', '1111');
ConditionPV4(2) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,2), 'preMask', preMaskPV4(2), 'postMask',...
    postMaskPV4(2),  'testBlur', TestBlur(3),'ItemNum', '1123');
ConditionPV4(3) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,3), 'preMask', preMaskPV4(3), 'postMask',...
    postMaskPV4(3),  'testBlur', TestBlur(5),'ItemNum', '1135');
ConditionPV4(4) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(2), 'prime', Prime(2,1), 'preMask', preMaskPV4(4), 'postMask',...
    postMaskPV4(4),  'testBlur', TestBlur(7),'ItemNum', '1111');
ConditionPV4(5) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(2), 'prime', Prime(2,2), 'preMask', preMaskPV4(5), 'postMask',...
    postMaskPV4(5),  'testBlur', TestBlur(9),'ItemNum', '1229');
ConditionPV4(6) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(1), 'prime', Prime(2,3), 'preMask', preMaskPV4(6), 'postMask',...
    postMaskPV4(6),  'testBlur', TestBlur(1),'ItemNum', '2131');
ConditionPV4(7) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(1), 'prime', Prime(1,1), 'preMask', preMaskPV4(7), 'postMask',...
    postMaskPV4(7),  'testBlur', TestBlur(3),'ItemNum', '2113');
ConditionPV4(8) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(2,2), 'preMask', preMaskPV4(8), 'postMask',...
    postMaskPV4(8),  'testBlur', TestBlur(5),'ItemNum', '2225');
ConditionPV4(9) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(1,3), 'preMask', preMaskPV4(9), 'postMask',...
    postMaskPV4(9),  'testBlur', TestBlur(7),'ItemNum', '2237');
ConditionPV4(10) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(2,1), 'preMask', preMaskPV4(10), 'postMask',...
    postMaskPV4(10),  'testBlur', TestBlur(9),'ItemNum', '2219');

ConditionPV4(11) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,1), 'preMask', preMaskPV4(11), 'postMask',...
    postMaskPV4(11), 'testBlur', TestBlur(1),'ItemNum', '1111');
ConditionPV4(12) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,2), 'preMask', preMaskPV4(12), 'postMask',...
    postMaskPV4(12),  'testBlur', TestBlur(3),'ItemNum', '1123');
ConditionPV4(13) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,3), 'preMask', preMaskPV4(13), 'postMask',...
    postMaskPV4(13),  'testBlur', TestBlur(5),'ItemNum', '1135');
ConditionPV4(14) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(2), 'prime', Prime(2,1), 'preMask', preMaskPV4(14), 'postMask',...
    postMaskPV4(14),  'testBlur', TestBlur(7),'ItemNum', '1111');
ConditionPV4(15) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(2), 'prime', Prime(2,2), 'preMask', preMaskPV4(15), 'postMask',...
    postMaskPV4(15),  'testBlur', TestBlur(9),'ItemNum', '1229');
ConditionPV4(16) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(1), 'prime', Prime(2,3), 'preMask', preMaskPV4(16), 'postMask',...
    postMaskPV4(16),  'testBlur', TestBlur(1),'ItemNum', '2131');
ConditionPV4(17) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(1), 'prime', Prime(1,1), 'preMask', preMaskPV4(17), 'postMask',...
    postMaskPV4(17),  'testBlur', TestBlur(3),'ItemNum', '2113');
ConditionPV4(18) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(2,2), 'preMask', preMaskPV4(18), 'postMask',...
    postMaskPV4(18),  'testBlur', TestBlur(5),'ItemNum', '2225');
ConditionPV4(19) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(1,3), 'preMask', preMaskPV4(19), 'postMask',...
    postMaskPV4(19),  'testBlur', TestBlur(7),'ItemNum', '2237');
ConditionPV4(20) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(2,1), 'preMask', preMaskPV4(20), 'postMask',...
    postMaskPV4(20),  'testBlur', TestBlur(9),'ItemNum', '2219');

ConditionPV4(21) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,1), 'preMask', preMaskPV4(21), 'postMask',...
    postMaskPV4(21), 'testBlur', TestBlur(1),'ItemNum', '1111');
ConditionPV4(22) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,2), 'preMask', preMaskPV4(22), 'postMask',...
    postMaskPV4(22),  'testBlur', TestBlur(3),'ItemNum', '1123');
ConditionPV4(23) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1,3), 'preMask', preMaskPV4(23), 'postMask',...
    postMaskPV4(23),  'testBlur', TestBlur(5),'ItemNum', '1135');
ConditionPV4(24) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(2), 'prime', Prime(2,1), 'preMask', preMaskPV4(24), 'postMask',...
    postMaskPV4(24),  'testBlur', TestBlur(7),'ItemNum', '1111');
ConditionPV4(25) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(2), 'prime', Prime(2,2), 'preMask', preMaskPV4(25), 'postMask',...
    postMaskPV4(25),  'testBlur', TestBlur(9),'ItemNum', '1229');
ConditionPV4(26) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(1), 'prime', Prime(2,3), 'preMask', preMaskPV4(26), 'postMask',...
    postMaskPV4(26),  'testBlur', TestBlur(1),'ItemNum', '2131');
ConditionPV4(27) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(1), 'prime', Prime(1,1), 'preMask', preMaskPV4(27), 'postMask',...
    postMaskPV4(27),  'testBlur', TestBlur(3),'ItemNum', '2113');
ConditionPV4(28) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(2,2), 'preMask', preMaskPV4(28), 'postMask',...
    postMaskPV4(28),  'testBlur', TestBlur(5),'ItemNum', '2225');
ConditionPV4(29) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(1,3), 'preMask', preMaskPV4(29), 'postMask',...
    postMaskPV4(29),  'testBlur', TestBlur(7),'ItemNum', '2237');
ConditionPV4(30) = struct('test', Stim(2), 'standard', Stim(1), 'testPosition',...
    Position(2), 'prime', Prime(2,1), 'preMask', preMaskPV4(30), 'postMask',...
    postMaskPV4(30),  'testBlur', TestBlur(9),'ItemNum', '2219');

ConditionPV4(31) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(1), 'preMask', preMaskPV4(31), 'postMask',...
    postMaskPV4(31), 'testBlur', TestBlur(1),'ItemNum', '1111');
ConditionPV4(32) = struct('test', Stim(1), 'standard', Stim(2), 'testPosition',...
    Position(1), 'prime', Prime(2), 'preMask', preMaskPV4(32), 'postMask',...
    postMaskPV4(32),  'testBlur', TestBlur(3),'ItemNum', '1123');


save('ConditionV4', 'ConditionV4');
save('ConditionPV4', 'ConditionPV4');

