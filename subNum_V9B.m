function [subNum] = subNum_V5( )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% %Create prompt asking for s#
prompt = 'Subject Number:';
input = strcat('Version9_sB', inputdlg(prompt), '.mat');


currDir = pwd;
mylist = dir(currDir);


for i = 1:length(mylist);
    if isempty(input);
        exit(code);
    elseif strcmp(mylist(i).name, input) == 1
        prompt = 'This number already exists, please enter another'
        input = inputdlg(prompt);
    else subNum = input;
    end
end 

end 


