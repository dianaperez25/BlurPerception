clear;
NumSubs = 63;
discards = [];
StimLevels = [3 4 5 6 7 8 9 10 11];
count = 1;

for s = [4 8 12 13 14 15 20 23 27 28 31 32 35 42 43 51 54 55 62 63]
    if any(s == discards);
    else
       for stim = 1:2
           
    filename = strcat('V9A_s',num2str(s),'_stim',num2str(stim));
    savefile = strcat('V9A_s',num2str(s),'_stim',num2str(stim),'_Results');
            
    Acc = load('AccuraciesV9A',filename);
    Acc = struct2cell(Acc);
    
    [fitresult, gofStim] = createFitV9A(StimLevels, Acc{1,1}, filename);
    CI = confint(fitresult);
    
    save(savefile, 'fitresult', 'gofStim');
   
    
    Results{count,1} = s;
    Results{count,2} = stim;
    Results{count,3} = fitresult.a1;
    Results{count,4} = CI(1,1);
    Results{count,5} = CI(2,1);
    Results{count,6} = fitresult.b1;
    Results{count,7} = CI(1,2);
    Results{count,8} = CI(2,2);
    Results{count,9} = fitresult.c1;
    Results{count,10} = CI(1,3);
    Results{count,11} = CI(2,3);    
    Results{count,12} = gofStim.sse;
    Results{count,13} = gofStim.rsquare;
    Results{count,14} = gofStim.dfe;
    Results{count,15} = gofStim.adjrsquare;
    Results{count,16} = gofStim.rmse;
    
    count = count+1;
    
    clearvars Acc CI filename fitresult gofStim savefile;
    
        end
     
    end
end

ResultsLabels = {'Subject', 'Stim', 'A1', 'ACI1', 'ACI2', 'B1', 'BCI1',...
        'BCI2', 'C1', 'CCI1', 'CCI2', 'sse', 'rsquare',...
        'dfe', 'adjrsquare', 'rmse'};
    
    Results = [ResultsLabels;Results];
save('V9AFittedResults', 'Results')

xlswrite('V9AFittedResults',Results);
