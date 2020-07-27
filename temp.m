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

%%% Plots and formats %%%
plot(yt) 
xlabel("Celsius"); ylabel("Days");

%%% Changes title based on input %%%
msg = sprintf("Temperature in %i", inp);
title(msg);
