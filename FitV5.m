clear;
discards = [5 15];
StimLevels = [3 4 5 6 7 8 9 10 11];
count = 1;

for s = 1:24
    if any(s == discards);
    else
       for stim = 1:2
           for prime = 1:3
           
    filename = strcat('V5_s',num2str(s),'_stim',num2str(stim),'prime',num2str(prime));
    savefile = strcat('V5_s',num2str(s),'_stim',num2str(stim),'prime',num2str(prime),'_Results');
            
    Acc = load('AccuraciesV5',filename);
    Acc = struct2cell(Acc);
    
    [fitresult, gofStim] = createFitV5(StimLevels, Acc{1,1}, filename);
    CI = confint(fitresult);
    
    save(savefile, 'fitresult', 'gofStim');
   
    
    Results{count,1} = s;
    Results{count,2} = stim;
    Results{count,3} = prime;
    Results{count,4} = fitresult.alpha;
    Results{count,5} = CI(1,1);
    Results{count,6} = CI(2,1);
    Results{count,7} = fitresult.beta;
    Results{count,8} = CI(1,2);
    Results{count,9} = CI(2,2);
    Results{count,10} = fitresult.guess;
    Results{count,11} = CI(1,3);
    Results{count,12} = CI(2,3);
    Results{count,13} = fitresult.lapse;
    Results{count,14} = CI(1,4);
    Results{count,15} = CI(2,4);
    Results{count,16} = gofStim.sse;
    Results{count,17} = gofStim.rsquare;
    Results{count,18} = gofStim.dfe;
    Results{count,19} = gofStim.adjrsquare;
    Results{count,20} = gofStim.rmse;
    
    count = count+1;
    
    clearvars Acc CI filename fitresult gofStim savefile;
           end
        end
     
    end
end

ResultsLabels = {'Subject', 'Stim', 'Prime', 'Alpha', 'ACI1', 'ACI2', 'Beta', 'BCI1',...
        'BCI2', 'Guess', 'GCI1', 'GCI2', 'Lapse', 'LCI1', 'LCI2', 'sse', 'rsquare',...
        'dfe', 'adjrsquare', 'rmse'};
    
    Results = [ResultsLabels;Results];
save('V5FittedResults', 'Results')

xlswrite('V5FittedResults',Results);
