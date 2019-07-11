clear all;
%%
% define values

letters = {'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q',...
    'r', 's', 't', 'v', 'w', 'x', 'y', 'z'};

mask = cell(1,2224);


%%
% create pre an post masks

for x = 1:2224
    A = cell2mat(datasample(letters,1));
    B = cell2mat(datasample(letters,1));
    C = cell2mat(datasample(letters,1));
    D = cell2mat(datasample(letters,1));
    mask{x} = [A,B,C,D];
end

%remove duplicates
u = unique(mask);
while length(u) < length(mask);
   for x = 1:(2224-length(u))
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

% %%
% % create postmasks for hawk
% for x = 1:363
%     A = cell2mat(datasample(asc,1));
%     B = cell2mat(datasample(median,1));
%     C = cell2mat(datasample(median,1));
%     D = cell2mat(datasample(asc,1));
%     hawk{x} = [A,B,C,D];
% end
% 
% %remove duplicates
% u = unique(hawk);
% while length(u) < length(hawk);
%    for x = 1:(363-length(u))
%         A = cell2mat(datasample(asc,1));
%         B = cell2mat(datasample(median,1));
%         C = cell2mat(datasample(median,1));
%         D = cell2mat(datasample(desc,1));
%         u{length(u)+1} = [A,B,C,D];        
%    end
%    hawk = u;
%      u = unique(hawk);
% end
% hawk = randsample(hawk,length(hawk));
% 
% %% 
% % postmasks for xxxx
% 
% 
% for x = 1:363
%     A = cell2mat(datasample(median,1));
%     B = cell2mat(datasample(median,1));
%     C = cell2mat(datasample(median,1));
%     D = cell2mat(datasample(median,1));
%     xxxx{x} = [A,B,C,D];
% end
% 
% %remove duplicates
% u = unique(xxxx);
% while length(u) < length(xxxx);
%    for x = 1:(363-length(u))
%         A = cell2mat(datasample(asc,1));
%         B = cell2mat(datasample(median,1));
%         C = cell2mat(datasample(median,1));
%         D = cell2mat(datasample(desc,1));
%         u{length(u)+1} = [A,B,C,D];        
%    end
%    xxxx = u;
%      u = unique(xxxx);
% end
% xxxx = randsample(xxxx,length(xxxx));

%% 
% separate masks
preMaskPV4(1:32) = mask(1:32);
postMaskPV4(1:32) = mask(33:64);
preMaskV4(1:1080) = mask(65:1144);
postMaskV4(1:1080) = mask(1145:2224);

save('preMaskPV4','preMaskPV4');
save('postMaskPV4','postMaskPV4');
save('preMaskV4','preMaskV4');
save('postMaskV4', 'postMaskV4');

