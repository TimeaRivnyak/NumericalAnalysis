clc;
clear;

a=-5;
b=5;
n=[2,4,6,8,10,12,14,16,18,20,22,24];
syms x
f=@(x) 1./(1+x.^2);

disp('A) Exercise')
%a.) x are given by n+1 points btw [a, b]
interval=[];
result=[];
for i=1:size(n,2)
   interval=linspace(a,b,(n(i)+1)); 
   pn=lagrange(f,interval);
   points=a:0.1:b;
   temp=abs(pn(points)-f(points));  
   result=[result,norm(temp,Inf)];   
end
%it should convegre to 0, but due to phenomenom (eqvidistance interpolation
%points in [a,b])it converges to infinite. 
fmt = ['For n= : [', repmat('%g, ', 1, numel(n)-1), '%g]\n'];
fprintf(fmt, n)
fprintf('The values are: ')
fprintf('%g ', result)
fprintf('\n')


%b) enpoint based on item (c)
disp('B) Exercise')

result=[];
for i=1:size(n,2)
   interval=cos(pi.*(2.*(1:n(i))-1)./(2.*(n(i))));
   interval=0.5*(b-a).*interval+0.5.*(b+a);
   sort(interval);
   pn=lagrange(f,interval);
   points=a:0.1:b;
   temp=abs(pn(points)-f(points));
   result=[result,norm(temp,Inf)];
end
%Choosing non eqvidistance interpolation points, now it converges to 0
fprintf('The values are: ')
fprintf('%g ', result)
fprintf('\n')
 
