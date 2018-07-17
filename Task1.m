%% Task1.m
close all; clear all; clc
%% loda data
load cbt2data;
%% pick subject data
s =1; 
d1 = diseased(:,:,s);
%% Plot Clusters
d1 = d1'; % Transfer the data into the right format
figure(1); 
title("clusters of the brain regions");
cluster= [];
K = 10; % Value K
[cluster_means,ClusterIndex] = kmeans_cluster2(d1,K); % Calculate the means and assign cluster label
% Find regions in each cluster and plot
for k=1:K
    cluster = d1(find(ClusterIndex==k),:);    
    for b = 1:size(cluster,1)
        subplot(5,2,k), plot(cluster(b,:)), hold on; 
    end
end
