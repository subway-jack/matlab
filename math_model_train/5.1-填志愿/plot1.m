clear
x = 0:0.5:4*pi;
y = sin(x);h = cos(x); w = 1./(1+exp(-x));
g=(1/(2*pi*2)^0.5).*exp((-1*(x-2*pi).^2)./(2*2^2));
plot(x,y,'bd-',x,h,'gp:',x,w,'ro-',x,g,'c^-');
legend('sin(x)','cos(x)','Sigmoid','Gauss function');
title('Function Plots of funciton(x)');
xlabel('t = 0 to 2\pi');
ylabel('values of function(t)');
str = '$$ \int_{0}^{2} x^2\sin(x) dx $$';
text(0.25,2.5,str,'Interpreter','latex');
annotation('arrow','x',[0.32,0.5],'Y',[0.6,0.4]);



