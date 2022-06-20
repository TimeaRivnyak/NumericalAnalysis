function [x, iteration] = newtonsmethod(f, fd, x0, p)
    x = x0;
    iteration = 1;
    
    while abs(f(x)) >= p
        x = x - f(x) / fd(x);
        
        if iteration == 10000
            disp('Out of iteration, no convergance in the force!')
            break;
        end
        
        if x == Inf || x == (-Inf)
            fprintf('Infinit x value!\n');
            return;
        end
        
        iteration = iteration + 1;
    end
end