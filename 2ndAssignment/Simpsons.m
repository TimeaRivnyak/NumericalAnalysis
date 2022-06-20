function result = Simpsons(f, a, b, n)
    h = (b - a) / n;
    result = 0;
    for i = 1:(2*n + 1)
        x = (i - 1) * (h / 2);
        if i == 1 || i == (2*n + 1)
            w = h / 6;
        elseif mod(i, 2) == 0
            w = (4 * h) / 6;
        elseif mod(i, 2) ~= 0
            w = (2 * h) / 6;
        end
        result = result + f(x) * w;
    end
end

