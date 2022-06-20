function x = ThomasAlgorithm(h, d, num_of_knots)
    a = zeros(1, num_of_knots-1);
    b = zeros(1, num_of_knots);
    c = zeros(1, num_of_knots-1);
    b(1) = 1;
    c(1) = 0;
    for i = 1:(num_of_knots-2)
        a(i) = h;
        b(i+1) = 4*h;
        c(i+1) = h;
    end
    a(num_of_knots-1) = 0;
    b(num_of_knots) = 1;
    
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

