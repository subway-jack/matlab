%%

%读取数据 city
city_name = S1.VarName1; %城市名称
city_gdp = S1.GDP2; %城市GDP
city_gdp_v = S1.GDP1; %城市GDP增速
city_people = S1.VarName4; %城市人口

%读取数据 schoole+learning ->gale
learning_l_name = S2.VarName1;
learning_s_name = S2.VarName2;
learning_ls_gale = S2.VarName3;

%读取数据 schoole ->gale
schoole_gale = S3.VarName2;
schoole_name = S3.VarName3;

%读取数据 
temp_get_p = Untitled.VarName1;  %录取概率
temp_schoole_name = Untitled.VarName2; %学校名称
temp_city_name = Untitled.VarName3; %城市名称
temp_l_name = Untitled.VarName4; %专业名称
temp_l_gale = Untitled.VarName7; %利用率
disp("完成");
%%

%处理数据

%1.得到每个学校专业的平均分
schoole_l_avg_gale = containers.Map();
temp = containers.Map();
s_cout = 1;
t_cout = 0;
for i = 1:learning_s_name.length
    if(isKey(schoole_l_avg_gale,learning_s_name(i,1)))
        s_cout = s_cout +1;
        temp(learning_s_name(i,1)) = temp(learning_s_name(i,1))+1;
        schoole_l_avg_gale(learning_s_name(i,1)) = schoole_l_avg_gale(learning_s_name(i,1))+learning_ls_gale(i,1);
    else
        t_cout = t_cout + 1;
        temp(learning_s_name(i,1)) = 1;
        schoole_l_avg_gale(learning_s_name(i,1)) = 0+learning_ls_gale(i,1);
    end
end

for i = 1:learning_s_name.length
    if(temp(learning_s_name(i,1)) == 1)
    else
        schoole_l_avg_gale(learning_s_name(i,1)) = schoole_l_avg_gale(learning_s_name(i,1))/temp(learning_s_name(i,1));
        temp(learning_s_name(i,1)) = 1;
    end
    disp(learning_s_name(i,1));
    disp(schoole_l_avg_gale(learning_s_name(i,1)));
end
disp("完成");
%%


RI = 1.12;

a = [1 2 3 6 9];

num = length(a);

for i = 1:num
    for j = 1:num
        if(i<j)
            A(i,j) = a(j-i+1);
        else
            A(i,j) = 1/a(i-j+1);
        end
    end
end

[V,B] = eig(A);
lamdamax = vpa(B(1,1),6);
W1 = V(:,1)./sum(V(:,1));
CI = (lamdamax-num)/(num-1);
CR = CI/RI;
disp(CR);

disp("完成");
%%
%合成一个表格
for i = 1:length(temp_city_name)
    t_s_name = temp_schoole_name(i,1);
    t_l_name = temp_l_name(i,1);
    
    %获取专业分数 第一列
    sum_datas(i,1) = 0;
    for j = 1:length(learning_ls_gale)
        if(learning_s_name(i,1) == t_s_name && learning_l_name(i,1) == t_l_name)
            sum_datas(i,1) = learning_ls_gale(j,1);
            break;
        end
    end
    if(sum_datas(i,1) == 0)
        disp("subway");
        sum_datas(i,1) = schoole_l_avg_gale(string(t_s_name));
    end

    %获得录取概率 第三列
    for j = 1:length(temp_schoole_name)
        sum_datas(i,3) = temp_get_p(i,1);
    end

    %获得分数利用率 第二列
    for j = 1:length(temp_schoole_name)
        sum_datas(i,2) = temp_l_gale(i,1);
    end


    %获得学校的分数 第四列
    for j = 1:length(schoole_name)
        if(schoole_gale(j,1)==t_s_name)
            sum_datas(i,4) = schoole_name(j,1);
            break;
        end
    end

    %获得城市GDP 第五列
    for j = 1:length(temp_schoole_name)
        t_city_name = temp_city_name(i,1);
        for k = 1:length(city_name)
            if(city_name(k,1)==t_city_name)
                sum_datas(i,5) = city_gdp(k,1);
                break;
            end
        end
    end
end
disp("完成");

%%

for k = 1:num
    for i = 1:length(temp_city_name)
        for j = 1:length(temp_city_name)
            B(i,j,k) = sum_datas(i,k)/sum_datas(j,k);
        end
    end
end
W2 = [];
for k = 1:num
    [V,L] = eig(B(:,:,k));
    BB = eig(B(:,:,k));
    s = find(BB==max(BB));
    W2 = [W2 V(:,s)/sum(V(:,s))];
end
W = (W2*W1).*10000;
disp("完成");































