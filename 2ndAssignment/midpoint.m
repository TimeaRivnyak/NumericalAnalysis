function result = midpoint(f, a, b, n)
    h = (b - a) / n;
    result = 0;
    for i = 1:n
       x = (i - 0.5) * h;
       result = result + f(x) * h;
    end
end

