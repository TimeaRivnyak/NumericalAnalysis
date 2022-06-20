function [y] = euler(f, y0, T, N)
%yn+1=yn+h*f(tn, yn) n=0,1,2...
h=T/N;
t=h;
n=1;
y=f(t, y0);
while n<N && t<T
    t=t+h;
    n=n+1;
    y0=y;
    y=y0+h*f(t,y0);   
end


end