clear all;
discards = [6, 11, 16, 19, 21, 28];
preMaskErrors = cell(24,1);
postMaskErrors = cell(24,1);
primeErrors = cell(24,1);
stimErrors = cell(24,1);

errorTrials = zeros(24,864);

for s = 1:29
    if any(s == discards)
    else
        filename = strcat('timing_Version7_s',num2str(s),'.mat');
        load(filename);
        
        a = 1;
        b = 1;
        c = 1;
        d = 1;        
        
        % round the display times for each trial
        % report any errors (trial,display time)
        
        for trial = 1:length(times)
            roundedTimes(1,trial) = round(1000*(times(2,trial)-times(1,trial)));
            if roundedTimes(1,trial) ~= 350;
                preMaskErrors{s,a} = [trial roundedTimes(1,trial)];
                a = a+1;
                errorTrials(s,trial) = 1;
            end
            
            roundedTimes(2,trial) = round(1000*(times(3,trial)-times(2,trial)));
            if roundedTimes(2,trial) ~= 50
                primeErrors{s,b} = [trial roundedTimes(2,trial)];
                b = b+1;
                errorTrials(s,trial) = 1;
            end
            
            roundedTimes(3,trial) = round(1000*(times(4,trial)-times(3,trial)));
            if roundedTimes(3,trial) ~= 70
                postMaskErrors{s,c} = [trial roundedTimes(3,trial)];
                c = c+1;
                errorTrials(s,trial) = 1;
            end
            
            roundedTimes(4,trial) = round(1000*(times(5,trial)-times(4,trial)));
            if roundedTimes(4,trial) ~= 180
                stimErrors{s,d} = [trial roundedTimes(4,trial)];
                d = d+1;
                errorTrials(s,trial) = 1;
            end
            
        end
    end
end


save('errorTrialsV7','errorTrials');
save('timingErrors','postMaskErrors','preMaskErrors','primeErrors','stimErrors');
    
    
    