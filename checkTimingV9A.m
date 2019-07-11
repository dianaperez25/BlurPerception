%% Enter in discards and number of subjects

clear all;
discards = [];
numSubjects = 48;
%preMaskErrors = cell(numSubjects,1);
%postMaskErrors = cell(numSubjects,1);
%primeErrors = cell(numSubjects,1);
stimErrors = cell(numSubjects,1);

errorTrials = zeros(numSubjects,864);

for s = [4 8 12 13 14 15 20 23 27 28 31 32 35 42 43 51 54 55 62 63]
    if any(s == discards)
    else
        filename = strcat('timing_Version9_sA',num2str(s),'.mat');
        load(filename);
        
        a = 1;
        b = 1;
        c = 1;
        d = 1;        
        
        % round the display times for each trial
        % report any errors (trial,display time)
        
        for trial = 1:length(times)
            roundedTimes(1,trial) = round(1000*(times(2,trial)-times(1,trial)));
            if roundedTimes(1,trial) ~= 180;
                stimErrors{s,a} = [trial roundedTimes(1,trial)];
                a = a+1;
                errorTrials(s,trial) = 1;
            end
            
%             roundedTimes(1,trial) = round(1000*(times(2,trial)-times(1,trial)));
%             if roundedTimes(1,trial) ~= 350;
%                 preMaskErrors{s,a} = [trial roundedTimes(1,trial)];
%                 a = a+1;
%                 errorTrials(s,trial) = 1;
%             end
%             
%             roundedTimes(2,trial) = round(1000*(times(3,trial)-times(2,trial)));
%             if roundedTimes(2,trial) ~= 50
%                 primeErrors{s,b} = [trial roundedTimes(2,trial)];
%                 b = b+1;
%                 errorTrials(s,trial) = 1;
%             end
%             
%             roundedTimes(3,trial) = round(1000*(times(4,trial)-times(3,trial)));
%             if roundedTimes(3,trial) ~= 70
%                 postMaskErrors{s,c} = [trial roundedTimes(3,trial)];
%                 c = c+1;
%                 errorTrials(s,trial) = 1;
%             end
%             
%             roundedTimes(4,trial) = round(1000*(times(5,trial)-times(4,trial)));
%             if roundedTimes(4,trial) ~= 180
%                 stimErrors{s,d} = [trial roundedTimes(4,trial)];
%                 d = d+1;
%                 errorTrials(s,trial) = 1;
%             end
            
        end
    end
end


save('errorTrialsV9A','errorTrials');
save('timingErrors','stimErrors');
%save('timingErrors','stimErrors', 'preMaskErrors', 'postMaskErrors','primeErrors');    
    
    