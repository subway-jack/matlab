function I = path_integral(F,vars,t,a,b)
%path_integral
%第一类曲线积分
%   I = path_integral(f, [x,y], t, t_m, t_M)
%   I = path_integral(f, [x,y,z], t, t_m, t_M)
%  Examples:
%  计算int_l(z^2/(x^2+y^2))ds, l是如下定义的螺线
%  x=acost, y=asint, z=at, 0<=t<=2*pi, a>0
%  MATLAB求解语句
%  syms t; syms a positive;
%  x=a*cos(t); y=a*sin(t); z=a*t;
%  f=z^2/(x^2+y^2);
%  I=path_integral(f,[x,y,z],t,0,2*pi)
%
%第二类曲线积分
%   I = path_integral([P,Q], [x,y], t, a, b)
%   I = path_integral([P,Q,R], [x,y,z], t, a, b)
%   I = path_integral(F, v, t, a, b)
%  Examples:
%  曲线积分int_l( (x+y)/(x^2+y^2)*dx - (x-y)/(x^2+y^2)*dy ),
%  l为正向圆周x^2+y^2=a^2
%  正向圆周的参数函数描述： x=acost, y=asint, (0<=t<=2pi)
%  MATLAB求解语句
%  syms t; syms a positive;
%  x=a*cos(t); y=a*sin(t);
%  F=[ (x+y)/(x^2+y^2), -(x-y)/(x^2+y^2) ];
%  I=path_integral(F,[x,y],t,2*pi,0)
 
if length(F)==1
    I = int(F*sqrt(sum(diff(vars,t).^2)),t,a,b);
else
    F = F(:).';
    vars = vars(:);
    I = int(F*diff(vars,t),t,a,b);
end