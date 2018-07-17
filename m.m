%%
clear all; close all; clc;

%% Load the data
load cbt2data;
%% Plot the data

for i = 1:20
    D = healthy(:,:,i); % 20 subjects
    x = 0:1:89; % 90 brain regions
    y = 0:1:199; % 200 times 
    [X, Y] = meshgrid(x,y);
    disp(D);
    figure(1); hold on
    set(gca,'YDir','reverse');
    pcolor(X, Y, D);
    colorbar;
    title("Healthy sample :" + i );
end