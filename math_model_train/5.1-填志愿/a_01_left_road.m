%模拟函数
lp_zx = polyfit(lz,lx,1); % 多项式z前面的系数 关于x
lx_out= polyval(lp_zx,lz); 
lp_zy = polyfit(lz,ly,32); % 多项式z前面的系数 关于y
ly_out = polyval(lp_zy,lz);
ly_out(1) = ly_out(2); %改变NAN

plot3(lx,lz,ly,'yo',lx_out,lz,ly_out,'r*');
xlabel('x');
ylabel('z');
zlabel('y');

%error = sum((ly-ly_out).^2)/length(ly_out);
grid on;

%求总长度
syms z;
lp_zy_1 = polyder(lp_zy);
lp_zx_1 = polyder(lp_zx);
F = sqrt(poly2sym(lp_zy_1,z)^2+poly2sym(lp_zx_1,z)^2+1);
%my_answer = vpa(int(F,z,-1672,349)); %2142.1873091091949875509394931779
my_point = [1:21;1:21];

%% 
%标白点
temp_z=349;
min = 3000;
pre_i = 0;
next_i = 0;
for cout = 1:21
    pre_i = temp_z;
    next_i = pre_i-100;
    while(pre_i-next_i>1)
        mid = (pre_i+next_i)/2;
        temp1 = abs(vpa(int(F,z,349,mid)))-cout*100;
        if temp1<0
            pre_i = mid;
        else
            next_i = mid;
        end
        disp(pre_i);
        disp(next_i);
    end
   %二分法 在(i,i+1)区间内求最小值
    i = pre_i;
    while(pre_i-next_i>0.01)
        temp = abs(vpa(int(F,z,349,i)))-cout*100;
        disp(temp);
        disp(i);
        if(abs(temp)<min)
            min = abs(temp);
            temp_z = i;
        end
        if(temp<0)
            pre_i = i;
            i = (i+next_i)/2;
        else
            next_i = i;
            i = (i+pre_i)/2;
        end
    end
    my_point(1,cout) = temp_z;
end















