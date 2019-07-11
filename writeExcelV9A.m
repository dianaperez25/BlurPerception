clear all;

%numSubjects = 63;
discards = [];

for s = [4 8 12 13 14 15] 
   
    if any(s == discards);
    else
    filename = strcat('Version9_sA',num2str(s),'.mat');
    filename2 = strcat('Version9_sA',num2str(s));
    load(filename);
       
    for n = 1:length(Condition)
        Condition2{n,1} = Condition(n).test;
        Condition2{n,2} = Condition(n).standard;
        Condition2{n,3} = Condition(n).testPosition;
        Condition2{n,4} = Condition(n).testBlur;
        Condition2{n,5} = Condition(n).example;
        Condition2{n,6} = Condition(n).ItemNum;
        Condition2{n,7} = Condition(n).Response;
        Condition2{n,8} = Condition(n).reactionTime;
    end
    end
    
    xlswrite(filename2,Condition2);
   
end

for s = [20 23 27 28 31 32 35 42 43 51 54 55 62 63] 
   
    if any(s == discards);
    else
    filename = strcat('Version9_sA',num2str(s),'.mat');
    filename2 = strcat('Version9_sA',num2str(s));
    load(filename);
       
    for n = 1:length(Condition)
        Condition2{n,1} = ConditionA(n).test;
        Condition2{n,2} = ConditionA(n).standard;
        Condition2{n,3} = ConditionA(n).testPosition;
        Condition2{n,4} = ConditionA(n).testBlur;
        Condition2{n,5} = ConditionA(n).example;
        Condition2{n,6} = ConditionA(n).ItemNum;
        Condition2{n,7} = ConditionA(n).Response;
        Condition2{n,8} = ConditionA(n).reactionTime;
    end
    end
    
    xlswrite(filename2,Condition2);
   
end
