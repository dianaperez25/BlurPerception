clear all;

discards = [6 15];
for s = 1:24
   
    if any(s == discards);
    else
    filename = strcat('Version4_s',num2str(s),'.mat');
    filename2 = strcat('Version4_s',num2str(s));
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
    end
    end
    
    xlswrite(filename2,Condition2);
   
end
