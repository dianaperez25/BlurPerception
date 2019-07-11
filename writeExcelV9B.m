clear all;

numSubjects = 64;
discards = [];

for s = [7 10 18]
   
    if any(s == discards);
    else
    filename = strcat('Version9_sB',num2str(s),'.mat');
    filename2 = strcat('Version9_sB',num2str(s));
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

for s = [25 26 29 30 33 39 41 44 45 48 52 53 56 57 60 61 64]
   
    if any(s == discards);
    else
    filename = strcat('Version9_sB',num2str(s),'.mat');
    filename2 = strcat('Version9_sB',num2str(s));
    load(filename);
       
    for n = 1:length(Condition)
        Condition2{n,1} = ConditionB(n).test;
        Condition2{n,2} = ConditionB(n).standard;
        Condition2{n,3} = ConditionB(n).testPosition;
        Condition2{n,4} = ConditionB(n).testBlur;
        Condition2{n,5} = ConditionB(n).example;
        Condition2{n,6} = ConditionB(n).ItemNum;
        Condition2{n,7} = ConditionB(n).Response;
        Condition2{n,8} = ConditionB(n).reactionTime;
    end
    end
    
    xlswrite(filename2,Condition2);
   
end
