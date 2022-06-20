function [y] = crankitup(f, y0, T, N)
h=T/N;
t=h;
n=0;
fd=@(t,y) 1-3*y^2; 
while n<N && t<T
    t=t+h;
    n=n+1;

    y1=newtonsmethod(y0,f,fd,t,0.01);
    y=y0+0.5*h*f(t,y0)+0.5*h*f(t+h,y1);
    y0=y;
end

end