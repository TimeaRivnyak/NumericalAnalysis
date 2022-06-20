function [x, iteration] = single_it(f, x0, L)
    iteration = 0;
    x = f(x0);
    finaliteration = log(abs(x0 - x)) - log(eps * (1 - L));
    finaliteration = floor(finaliteration / log(1 / L)) + 1;
    
    while iteration < finaliteration
        iteration = iteration + 1;  
        x = f(x0);
        x0 = x;
    end
end