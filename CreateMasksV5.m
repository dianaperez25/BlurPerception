clear all;
%%
% define values

letters = {'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q',...
    'r', 's', 't', 'v', 'w', 'x', 'y', 'z'};
mask = cell(1,896);

%%
% create pre and post masks

for x = 1:length(mask)
    A = cell2mat(datasample(letters,1));
    B = cell2mat(datasample(letters,1));
    C = cell2mat(datasample(letters,1));
    D = cell2mat(datasample(letters,1));
    mask{x} = [A,B,C,D];
end

%remove duplicates
u = unique(mask);
while length(u) < length(mask);
   for x = 1:(length(mask)-length(u))
        A = cell2mat(datasample(letters,1));
        B = cell2mat(datasample(letters,1));
        C = cell2mat(datasample(letters,1));
        D = cell2mat(datasample(letters,1));
        u{length(u)+1} = [A,B,C,D];        
   end
   mask = u;
     u = unique(mask);
end

mask = randsample(mask,length(mask));

%% 
% separate masks
postMaskPV5(1:32) = mask(1:32);
postMaskV5(1:864) = mask(33:896);

save('postMaskPV5','postMaskPV5');
save('postMaskV5', 'postMaskV5');

