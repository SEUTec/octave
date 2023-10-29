x = linspace(0,1,100);
y = rand(1,100)-0.5;
x0= zerocrossing(x,y);
y0 = interp1(x,y,x0);
plot(x,y,x0,y0,'x')