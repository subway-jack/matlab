l22 = 1:100, l21 = l22, l20 = l21;
name20 = Book1.name20;
name21 = Book1.name21;
name22 = Book1.name22;

newmap = containers.Map();

%%


for i = 1:100
    if(isKey(newmap,sum_name_1(i,1)))
        newmap(sum_name_1(i,1)) = (newmap(sum_name_1(i,1))+sum_gale_1(i,1))/2;
    end
end
disp("完成");
%%
sum_name(1,1) = "1";
sum_gale(1,1) = 1;
name = keys(temp);
for i = 1:temp.length
    t1 = name(i);
    sum_name(i,1) = t1{1};
    sum_gale(i,1) = temp(t1{1});
end
disp("完成");



%%

name = keys(temp);
for i = 1:temp.length
    t1 = name(i);
    if(temp(t1{1})>50)
        disp(t1{1});
    end
end


%%

name = temp.name;

%评价因素的权重 r_u (1*m)
r_u = [1 2 3 4 5];
%评价结果的权重 r_v (1*n)
r_v = [100 80 60 40];
for i = 1:name.length
    temp = 1;
    A(i,1) = {name(i,1)};
    %评价因素*评价结果的二维矩阵 r_uv(m*n)
    A(i,2) = {temp};
end

for i = 1:name.length
    %总分 G = r_b * r_v (1*1) 模糊向量 r_b = r_u * r_uv =  (1*n)
    A(i,3) = {r_u*A(i,2)*transpose(r_v)};
end


























