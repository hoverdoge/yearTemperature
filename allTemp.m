clf;clear; hold off;

%%% setting variables and reading in data %%%
data = csvread("sio.m", 1, 0); % csvreads 'sio' to 'data' matrix
meanV = []; medianV = []; stdV1 = []; stdV2 = [];
counter = 1;

%%% puts required data into respective vectors %%%
for year = 1916:2018 
    meanV = [meanV, mean(data(data(:,1) == year, 4))]; 
    medianV = [medianV, median(data(data(:,1) == year, 4))];
    stdV1 = [stdV1, meanV(counter) + mean(std(data(data(:,1) == year, 4)))];
    stdV2 = [stdV2, meanV(counter) - mean(std(data(data(:,1) == year, 4)))];
    counter++;
endfor

%%% plots all values according to their year %%%
yearV = 1916:2018;
plot(yearV, meanV, "linewidth", 1.1);
hold on;
plot(yearV, medianV, "linewidth", 1.1);
plot(yearV, stdV1, "linewidth", 1.1, "color", [0.6, 0.6, 0.6]);
plot(yearV, stdV2, "linewidth", 1.1, "color", [0.6, 0.6, 0.6]);

%%% formats plot to look nice %%%
xlabel("Year"); ylabel("Temperature"); title("Temperature from 1916-2018");
legend("Mean", "Median", "Standard Deviation", "Standard Deviation", "location", "North");
xlim([1916 2018]);
