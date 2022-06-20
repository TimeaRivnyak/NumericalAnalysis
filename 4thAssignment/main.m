clc;
clear;
n=10;
A=2*eye(n);
A(1,2)=-1;
A(n,n-1)=-1;
for i=2:(n-1)
    A(i,i-1)=-1;
    A(i,i+1)=-1;
end
A=A.*((n+1)^2);
eigen=eigein_val_calc(A)
lambda=@(k,n) 4*(n+1)^2*sin((k*pi)/(2*(n+1))).^2; 
k=1:n;
ground_truth=lambda(k,n);
eigen = sort(eigen);
ground_truth = sort(ground_truth);
differnece=abs(eigen-ground_truth)
v = InverseIteration(A,eigen(1))
% f_ev = @(k,n) sin((pi*k)/(n+1));
% eigen_vec = f_ev(k, n)
[V,~] = eig(A);
V(1,:)
