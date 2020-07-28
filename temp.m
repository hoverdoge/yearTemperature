clear;clf;


%%% Vector to plot %%%
yt = [];


%%% Gets all temps for a given year %%%
function [yt] = findYearTemps(year)
    data = csvread("sio.m", 1, 0); % csvreads 'sio' to 'data' matrix
    yt = data(data(:,1) == year, 4); % gets all temps for year
endfunction


%%% Gets year and stores inside variable %%%
inp = input("What year do you want to plot?\n"); 


%%% Checks for invalid input
if (inp < 1916) || (inp > 2018)
    error(sprintf("Input of %i is not a year inside the data\n", inp));
endif


%%% Calls function %%%
[yt] = findYearTemps(inp); 


%%% Plots temperature and stats %%% 
plot(yt) 
hold on;

meanV = repmat(mean(yt),length(yt),1);
plot(meanV, "linewidth", 1.5);

medianV = repmat(median(yt),length(yt),1);
plot(medianV, "linewidth", 1.5);

stdV1 = repmat(mean(yt) + std(yt),length(yt),1); 
plot(stdV1, "linewidth", 1.5, "color", "k");
% std is plotted above and below mean
stdV2 = repmat(mean(yt) - std(yt),length(yt),1);
plot(stdV2, "linewidth", 1.5, "color", "k");


%%% Formats Plot %%%
legend("Temperature", "Mean", "Median", "Standard Deviation1", "Standard Deviation2", "Location", "northwest");
xlabel("Days"); ylabel("Celsius");
xlim([0 length(yt)]);


%%% Changes title based on input %%%
msg = sprintf("Temperature in %i", inp);
title(msg);
