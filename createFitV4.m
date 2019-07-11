function [fitresult, gof] = createFitStimXPrimeV4(StimLevels, Acc, Name)
%CREATEFIT(STIMLEVELS,V4_S16_STIM2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : StimLevels
%      Y Output: V4_s16_stim2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 13-Feb-2017 16:28:00


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( StimLevels, Acc );

% Set up fittype and options.
ft = fittype( 'guess + (1 - guess - lapse)*(1/(1+exp(-beta*(x-alpha))))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 0];
opts.StartPoint = [7 1 0.01 0.01];
opts.Upper = [Inf Inf 1 1];

% Fit model to data.
[fitresult, gof] = fit(xData, yData, ft, opts);

% Plot fit with data.
figure( 'Name', Name );
h = plot( fitresult, xData, yData );
% legend( h, 'V4_s16_stim2 vs. StimLevels', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel StimLevels
ylabel ChoseTest
legend('off')
axis([3 11 0 1]);
grid on

saveName = strcat(Name,'_Results_Fig');
savefig(saveName);

end

