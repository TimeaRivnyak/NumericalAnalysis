function [x, iteration] = secantmethod(f, x0, x1, p)
    y0 = f(x0);
    y1 = f(x1);
    x = x1 - (x1 - x0) * y1 / (y1 - y0);
    y = f(x);
    iteration = 1;
    
    while abs(y) >= p
        x = x1 - (x1 - x0) * y1 / (y1 - y0);
        y = f(x);
        x0 = x1;
        y0 = y1;
        x1 = x;
        y1 = y;
        
        if iteration == 10000
            disp('Out of iteration, no convergance in the force!')
            break;
        end
        
        if x == Inf|| x == (-Inf)
            fprintf('Infinit x value!\n');
            return
        end
        
        iteration = iteration + 1;
    end
end