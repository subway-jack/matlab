%初始化
clc;
clear;
close all;

R = xlsread("t_1_data.xlsx","白葡萄分组","S2:S29");%读取数据
Y = pdist(R);
Z = linkage(Y,'single');
dendrogram(Z); %画图

title("白葡萄酒聚类图");
xlabel("组别");
ylabel("距离");