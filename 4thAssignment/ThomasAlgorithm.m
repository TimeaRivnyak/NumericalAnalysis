function x = ThomasAlgorithm(A, d)
    [m, ~] = size(A);
    a = zeros(1, m);
    b = zeros(1, m);
    c = zeros(1, m);
    for i = 1:m
        b(i) = A(i,i);
        if i > 1
            a(i) = A(i, i-1);
        end
        if i < m
            c(i) = A(i, i+1);
        end
    end
    
    n = length(d);
    v = zeros(1, n);
    x = v;
    w = b(1);
    x(1) = d(1)/w;
    for i = 2:n
        v(i-1) = c(i-1)/w;
        w = b(i) - a(i)*v(i-1);
        x(i) = (d(i) - a(i)*x(i-1))/w;
    end
    for j = (n-1): (-1) : 1
        x(j) = x(j) - v(j)*x(j+1);
    end
end