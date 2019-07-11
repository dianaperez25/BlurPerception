clear;
discards = [6, 11, 16, 19, 21, 28];
StimLevels = [3 4 5 6 7 8 9 10 11];
count = 1;

for s = 1:29
    if any(s == discards);
    else
       for stim = 1:2
           for prime = 1:3
           
    filename = strcat('V7_s',num2str(s),'_stim',num2str(stim),'prime',num2str(prime));
    savefile = strcat('V7_s',num2str(s),'_stim',num2str(stim),'prime',num2str(prime),'_Results');
            
    Acc = load('AccuraciesV7',filename);
    Acc = struct2cell(Acc);
    
    [fitresult, gofStim] = createFitV7(StimLevels, Acc{1,1}, filename);
    CI = confint(fitresult);
    
    save(savefile, 'fitresult', 'gofStim');
   
    
    Results{count,1} = s;
    Results{count,2} = stim;
    Results{count,3} = prime;
    Results{count,4} = fitresult.a1;
    Results{count,5} = CI(1,1);
    Results{count,6} = CI(2,1);
    Results{count,7} = fitresult.b1;
    Results{count,8} = CI(1,2);
    Results{count,9} = CI(2,2);
    Results{count,10} = fitresult.c1;
    Results{count,11} = CI(1,3);
    Results{count,12} = CI(2,3);
    Results{count,13} = gofStim.sse;
    Results{count,14} = gofStim.rsquare;
    Results{count,15} = gofStim.dfe;
    Results{count,16} = gofStim.adjrsquare;
    Results{count,17} = gofStim.rmse;

    
    count = count+1;
    
    clearvars Acc CI filename fitresult gofStim savefile;
           end
        end
     
    end
end

ResultsLabels = {'Subject', 'Stim', 'Prime', 'A1', 'ACI1', 'ACI2', 'B1', 'BCI1',...
        'BCI2', 'C1', 'CCI1', 'CCI2', 'sse', 'rsquare',...
        'dfe', 'adjrsquare', 'rmse'};
    
    Results = [ResultsLabels;Results];
save('V7FittedResults', 'Results')

xlswrite('V7FittedResults',Results);
