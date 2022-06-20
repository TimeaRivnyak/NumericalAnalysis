function Lag = lagrange(funki,xj)
n = length(xj);
Lag= @(x)0;
for i=1:n
    l=@(x)1;
    for j=1:n
        if(i~=j)
            l=@(x) l(x).*(x-xj(j))./(xj(i)-xj(j));
        end
    end
    Lag=@(x) Lag(x)+l(x).*funki(xj(i));
end
end
