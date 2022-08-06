%%
%读取数据

num1 = 4;

sum_datas(:,1) = S2.VarName12;
sum_datas(:,2) = S2.VarName13;
sum_datas(:,3) = S2.VarName14;
sum_datas(:,4) = S2.VarName15;



disp("完成");

%%

x = 0:100;
mf11 = @(x) trapmf(x, [0,0,30,50]); % 右梯形
subplot(2,2,1)
plot(x, mf11(x), 'linewidth', 2)
xlabel('差') %40
ylim([-0.05 1.05]), grid on
set(gca,'YTick',0:0.25:1);

mf12 = @(x) trapmf(x, [0,30,70,90]); 
subplot(2,2,2)
plot(x, mf12(x), 'linewidth', 2)
xlabel('中') %60
ylim([-0.05 1.05]), grid on
set(gca,'YTick',0:0.25:1);

mf13 = @(x) trapmf(x, [30,50,100,100]); 
subplot(2,2,3)
plot(x, mf13(x), 'linewidth', 2)
xlabel('优') %90
ylim([-0.05 1.05]), grid on
set(gca,'YTick',0:0.25:1);

%%


RI = 1.6587;

a = [1 1.1 1.1 1.1 1.1 1.2 1.3 1.4 2 2 4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5];
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
disp(num);



%%

for i = 1:num1
    for j = 1:num
        temp = sum_datas(j,i);
        t_k(j,1) = mf11(temp);
        t_k(j,2) = mf12(temp);
        t_k(j,3) = mf13(temp);
    end
    t_result(i,:) = transpose(W1)*t_k;
end

for i = 1:num1
    result(i) = t_result(i,1)*3 + t_result(i,2)*6+t_result(i,3)*9;
end


disp("完成");









