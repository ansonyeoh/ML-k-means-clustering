%% Task3.m
close all; clear all; clc;
%% Load data
load cbt2data;
%% Deal with healthy subject's data
H = zeros(90);
for a = 1:20 % 20 subjects' data
    h = diseased(:,:,a);
    h = h'; % change the format to 90*200(time points are attributes)
    K = 10; % Value K
    [cluster_means,ClusterIndex] = kmeans_cluster2(h,K); % get the means and index cluster under K
    % For the community matrix
    for i =1:90
        for j = 1:90
            if ClusterIndex(i) == ClusterIndex(j) % Judge if the assigned clusters are the same
                H(i,j)=H(i,j)+1; % Accumulate the times that regions were moved
            end
        end
    end
end
%% Plot community matrix
H = H/20; % The number of movement divides the number of subjects
% Plot community matrix with colorbar
imagesc(H),colorbar;
