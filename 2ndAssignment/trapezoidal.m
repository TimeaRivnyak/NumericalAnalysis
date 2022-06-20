function result = trapezoidal(f, a, b, n)
    h = (b - a) / n;
    result = 0;
    for i = 1:(n+1)
       x = (i - 1) * h;
       if i == 1 || i == (n+1)
           w = h / 2;
       else
           w = h;
       end
       result = result + f(x) * w;
       %If we set all w equal to h:
       %result = result + f(x) * h;
       %The convergence rate will converge to 1 from below
       %instead of converge to 2 from above.
    end
end

