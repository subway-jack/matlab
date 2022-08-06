%模拟函数
rp_zx = polyfit(rz,rx,1); % 多项式z前面的系数 关于x
rx_out= polyval(rp_zx,rz); 
rp_zy = polyfit(rz,ry,32); % 多项式z前面的系数 关于y
ry_out = polyval(rp_zy,rz);
ry_out(1) = ry_out(2); %改变NAN

plot3(rx,rz,ry,'yo',rx_out,rz,ry_out,'r*');
xlabel('x');
ylabel('z');
zlabel('y');
%error = sum((ry-ry_out).^2)/length(ry_out);
grid on;

%求白点
syms z;
rp_zy_1 = polyder(rp_zy);
rp_zx_1 = polyder(rp_zx);
F = sqrt(poly2sym(rp_zy_1,z)^2+poly2sym(rp_zx_1,z)^2+1);
%my_answer = vpa(int(F,z,-1672,349)); %2142.1873091091949875509394931779

%% 
%标白点
temp_z=357;
min = 3000;
pre_i = 0;
next_i = 0;
for cout = 1:21
    pre_i = temp_z;
    next_i = pre_i-100;

    while(pre_i-next_i>1)
        mid = (pre_i+next_i)/2;
        temp1 = abs(vpa(int(F,z,357,mid)))-cout*100;
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
        temp = abs(vpa(int(F,z,357,i)))-cout*100;
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
    min = 3000;
    my_point(2,cout) = temp_z;
end