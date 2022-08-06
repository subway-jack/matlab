

%灰色预测步骤
%输入前期小样本数据
% 做AGO累加处理
%输入预测个数
%运行
clc,clear,close all
y = [1 2 3 4 5 6 7.5 8 9.1 10];
n=length(y);
yy=ones(n,1);
yy(1)=y(1);
for i=2:n
    yy(i)=yy(i-1)+y(i);
end
B=ones(n-1,2);
for i=1:(n-1)
    B(i,1)=-(yy(i)+yy(i+1))/2;
    B(i,2)=1;
end
BT=B';
for j=1:(n-1)
    YN(j)=y(j+1);
end;
YN=YN';
A=inv(BT*B)*BT*YN;
a=A(1);
u=A(2);
t=u/a;
t_test=5  % input('请输入需要预测的个数');
i=1:t_test+n;
yys(i+1)=(y(1)-t).*exp(-a.*i)+t;
yys(1)=y(1);
for j=n+t_test:-1:2;
    ys(j)=yys(j)-yys(j-1);
end
x=1:n;
xs=2:n+t_test;
yn=ys(2:n+t_test);
plot(x,y,'^r',xs,yn,'*-b');
det=0;
for i=2:n
    det=det+abs(yn(i)-y(i));
end
det=det/(n-1);
disp(['百分比误差为：',num2str(det),'%']);
disp(['预测值为：',num2str(ys(n+1:n+t_test))]);
disp('预测数据');ys
disp('绝对误差');err1 = y - ys(1:n)
disp('相对误差');err2 = err1./y
disp('原始数据均值');xavg = mean(y)
disp('绝对误差均值');errlavg = sum(err1)/(n-1)
disp('x0的方差');s1sqrt = std(y,1)
disp('残差的方差');s2sqrt = std(err1)
disp('后检验比值');Cval = s2sqrt./s1sqrt
disp('P检验值');pval = sum(abs(err1-errlavg)<0.6745*s1sqrt)/n

