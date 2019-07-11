clear all;

numSubjects = 48;
discards = [2 7 8 9 18 19 20 22 23 24 25 27 31 40 42 44 45 46 47];

for s = 1:numSubjects
   
    if any(s == discards);
    else
    filename = strcat('Version8_s',num2str(s),'.mat');
    filename2 = strcat('Version8_s',num2str(s));
    load(filename);
       
    for n = 1:length(Condition)
        Condition2{n,1} = Condition(n).test;
        Condition2{n,2} = Condition(n).standard;
        Condition2{n,3} = Condition(n).testPosition;
        Condition2{n,4} = Condition(n).prime;
        Condition2{n,5} = Condition(n).preMask;
        Condition2{n,6} = Condition(n).postMask;
        Condition2{n,7} = Condition(n).testBlur;
        Condition2{n,8} = Condition(n).example;
        Condition2{n,9} = Condition(n).ItemNum;
        Condition2{n,10} = Condition(n).Response;
        Condition2{n,11} = Condition(n).reactionTime;
    end
    end
    
    xlswrite(filename2,Condition2);
   
end
