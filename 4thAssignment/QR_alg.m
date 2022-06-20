function[Q,R]=QR_alg(A)
[n,~]=size(A);
Q=eye(n);
R=A;
for i=1:n
   nor=norm(R(i:n,i));   
   sgn=-sign(R(i,i));
   if i==n
       sgn=sgn*-1;
   end
   u=R(i,i)-sgn*nor;
   w=R(i:n,i)/u;
   w(1)=1;
   t=-sgn*u/nor;
   R(i:n,:)=R(i:n,:)-(t*w)*(w'*R(i:n,:));
   Q(:,i:n)=Q(:,i:n)-((Q(:,i:n)*w)*(t*w'));
end
end