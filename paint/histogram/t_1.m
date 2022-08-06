%%
clc;
clear;
%确定图片的位置和大小，[x y width height]
figure('visible','on','position',[350,200,800,550]); 
%准备数据
yw_data=readtable("t_1_data.xlsx","Sheet","白葡萄分组");     %读入一维数据样本到yw_data矩阵
xx=yw_data.pre_score;
X = xx;
clus=4;
[idx,c]=kmeans(xx,clus);
%每个柱子的颜色设置
color = [223, 230, 233;178, 190, 195;99, 110, 114;45, 52, 54]/255;  
hold on
% 添加柱子，facecolor用来修改颜色  
cc1=[];
yy1=[];
cc2=[];
yy2=[];
cc3=[];
yy3=[];
cc4=[];
yy4=[];
[n,m]=size(xx);
for i=1:n
    if idx(i)==1
        cc1=[cc1;xx(i)];
        yy1=[yy1;i];
    elseif idx(i)==2
        cc2=[cc2;xx(i)];
        yy2=[yy2;i];
    elseif idx(i)==3
        cc3=[cc3;xx(i)];
        yy3=[yy3;i];
     elseif idx(i)==4
        cc4=[cc4;xx(i)];
        yy4=[yy4;i];
    end
end
b1 = bar(yy1,cc1,'stacked','DisplayName',"第一组");
set(b1,'facecolor',color(1,:))
b2 = bar(yy2,cc2,'stacked','DisplayName',"第二组");
set(b2,'facecolor',color(2,:))
b3 = bar(yy3,cc3,'stacked','DisplayName',"第三组");
set(b3,'facecolor',color(3,:))
b4 = bar(yy4,cc4,'stacked','DisplayName',"第四组");
set(b4,'facecolor',color(4,:))
  


box on

%x轴每个柱子的横坐标
%Xlabel = {'A1','A2','A3','A4','A5'};
set(gca,'XTick',1:size(xx,1));
%设置柱状图每个柱子的横坐标
%set(gca,'XTickLabel',Xlabel);
%设置小标签字体
set(gca,'FontSize',10,'Fontname','Times New Roman');
%设置纵坐标的数值范围
set(gca,'YLim',[60 90]);
%修改大标签
ylabel('综合分数','Fontname','宋体','FontSize',14) 
xlabel('组别','Fontname','宋体','FontSize',14) 

legend('第一组','第二组','第三组','第四组');
title('酿酒白葡萄分组结果');