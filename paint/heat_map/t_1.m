%% 导入数据
clc;
clear;
close all;
str = '单宁 总酚 酒总黄酮 白藜芦醇 DPPH半抑制体积 L*(D65) a*(D65) b*(D65)';
x1 = regexp(str, ' ', 'split');
str = '氨基酸总量 蛋白质 VC含量 花色苷鲜重 酒石酸 苹果酸 柠檬酸 多酚氧化酶活力 褐变度 DPPH自由基 总酚 单宁 葡萄总黄酮 白藜芦醇 黄酮醇 总糖 还原糖 PH值 固酸比 干物质含量 果穗质量 百粒质量 果梗比 出汁率 果皮质量 果皮颜色 a*(+红；-绿) b*（+黄;-蓝)';
y1 = regexp(str, ' ', 'split');

str = '花色苷 单宁 总酚 酒总黄酮 白藜芦醇 DPPH半抑制体积 L*(D65) a*(D65) b*(D65)';
x2 = regexp(str, ' ', 'split');
y2 = y1;
R1 = xlsread("Q3.xlsx","白葡萄","N2:U29");
R2 = xlsread("Q3.xlsx","红葡萄","N2:V29");
h = heatmap(x1,y1,R1);
h.CellLabelFormat = '%0.2f';
% h.CellLabelColor = 'none';
colormap(gca, 'parula')
title("白葡萄与酒的相关系数")
%% 处理数据
clc;
clear;
close all;
str = '单宁 总酚 酒总黄酮 白藜芦醇 DPPH半抑制体积 L*(D65) a*(D65) b*(D65)';
x1 = regexp(str, ' ', 'split');
str = '氨基酸总量 蛋白质 VC含量 花色苷鲜重 酒石酸 苹果酸 柠檬酸 多酚氧化酶活力 褐变度 DPPH自由基 总酚 单宁 葡萄总黄酮 白藜芦醇 黄酮醇 总糖 还原糖 PH值 固酸比 干物质含量 果穗质量 百粒质量 果梗比 出汁率 果皮质量 果皮颜色 a*(+红；-绿) b*（+黄;-蓝)';
y1 = regexp(str, ' ', 'split');

str = '花色苷 单宁 总酚 酒总黄酮 白藜芦醇 DPPH半抑制体积 L*(D65) a*(D65) b*(D65)';
x2 = regexp(str, ' ', 'split');
y2 = y1;
R1 = xlsread("Q3.xlsx","白葡萄","B2:I29");
R2 = xlsread("Q3.xlsx","红葡萄","B2:J29");
bubblechart(x1,y1,R1);
title("红葡萄与酒的相关系数")