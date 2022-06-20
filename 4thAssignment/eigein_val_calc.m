function [eigen]=eigein_val_calc(A)
eigen=[];
[n,~]=size(A);
th=10^-4;
e=0.01;
while n>2
   iter=0;
   while (iter<1000 && abs(A(n,n-1))>th)
       mu=A(n,n)+e;
       temp=A-mu*eye(n);
       [Q, R]=QR_alg(temp);
       A=R*Q+mu*eye(n);
       iter=iter+1;     
   end
   eigen=[eigen,A(n,n)];
   A(:,end) = [];
   A(end,:) = [];
   [n,~]=size(A);

end
a=1;
b=-(A(1,1)+A(2,2));
c=A(1,1)*A(2,2)-A(1,2)*A(2,1);
d=sqrt(b^2-4*a*c);
e1=(-b+d)/(2*a);
e2=(-b-d)/(2*a);
eigen=[eigen,e1,e2];
end