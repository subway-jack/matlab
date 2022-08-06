clear 
x = 1:0.1:2;
y = sin(2*pi.*x); h = x.^2;
h = plot(x,y,'r-',x,h,'bl-');get(h)
title("Mini Assignment #1");
xlabel("Time(ins)");
ylabel("f(t)");
legend("t^2","sin(2\pi t)",Location="northwest");
