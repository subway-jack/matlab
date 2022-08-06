clc;
clear;
y = [6.052707615000000   6.111204297000000   6.249562064000000   6.474179872000000   6.653505231000000 6.820288378000000   7.025521663000000   7.823715606000000   8.121950753000000];
x = y;
count = 5;
resulkt_t(1,1) = 1;
for i = 1:count

    sizexd2 = length(x);
    x1(1) = x(1);
    for k = 2:sizexd2
        x1(k) = x1(k-1) + x(k);
        z1(k-1) = -0.5*(x1(k)+x1(k-1));
        yn1(k-1) = x(k);
    end
    z2 = z1';z3 = ones(1,sizexd2-1)';B = [z2 z3];
    au0 = inv(B'*B)*B'*yn1';au = au0';
    afor = au(1);ufor = au(2);ua = au(2)./au(1);
    constant1 = x(1) - ua;afor1 = -afor;
    disp(afor1);
    nfinal = sizexd2 + 1;
    for k3 = 1:nfinal
        x31facast(k3) = constant1 *1.1^(afor1*(k3-1+10))+ua;
    end
    x31facast(1) = x(1);
    for k = 2:nfinal
        x31facast(k) = x31facast(k) - x31facast(k-1);
    end
    disp('预测数据');x31facast
    disp('绝对误差');err1 = x - x31facast(1:sizexd2);
    disp('相对误差');err2 = err1./x;
    disp('原始数据均值');xavg = mean(x);
    disp('绝对误差均值');errlavg = sum(err1)/(sizexd2-1);
    disp('x0的方差');s1sqrt = std(x,1);
    disp('残差的方差');s2sqrt = std(err1);
    disp('后检验比值');Cval = s2sqrt./s1sqrt;
    disp('P检验值');pval = sum(abs(err1-errlavg)<0.6745*s1sqrt)/sizexd2;
    result_t(1,i) = i;
    result_t(2,i) = xavg;
    result_t(3,i) = errlavg;
    result_t(4,i) = s1sqrt;
    result_t(5,i) = s2sqrt;
    result_t(6,i) = Cval;
    result_t(7,i) = pval;
    x = x31facast;
end

disp("预测结果:")













