%% 灰色分析
%提取数据 

x(:,1) = S2.VarName4;
x(:,2) = S2.VarName5;
x(:,3) = S2.VarName6;
x(:,4) = S2.VarName7;
x(:,5) = S2.VarName8;
x(:,6) = S2.VarName9;
x(:,7) = S2.VarName10;
x(:,8) = S2.VarName11;
x(:,9) = S2.VarName12;
disp("读取完成");


num = size(x,1);
%%

for i = 1:num
    x(i,:) = x(i,:)/x(i,1);
end

%%
data = x;
n = size(data,1);
ck = data(1,:);m1 = size(ck,1);
bj = data(2:n,:);m2 = size(bj,1);
for i = 1:m1
    for j = 1:m2
        t(j,:) = bj(j,:) - ck(i,:);
    end
    jc1 = min(min(abs(t')));jc2 = max(max(abs(t')));
    rho = 0.5;
    ksi = (jc1 + rho*jc2)./(abs(t)+rho*jc2);
    rt = sum(ksi')/size(ksi,2);
    r(i,:) = rt;
end

[rs,rind] = sort(r,'descend');
disp(transpose(r))
disp("完成");





