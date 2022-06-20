clear
clc
%A


syms t
func= @(t,y) y-y^3;
N=100;
T=5;
y0=0.1;
result_euler=euler(func,y0,T,N)
result_back_euler=back_euler(func,y0,T,N)
result_crank=crankitup(func, y0, T, N)
%B
y0=0.1;
T=1;
rate=0.01;
y= @(t) y0/sqrt((y0^2)-((y0^2)-1)*exp(-2*t));
my_compare(func,y,T,rate,y0);



