function [y, iteration] = newtonsmethod(y0,f, fd, t, p)
    iteration = 1;
    y=y0;
    while abs(f(t,y)) >= p
        y = y0 - f(t,y) / fd(t,y);
        
        if iteration == 10000
            disp('Out of iteration, no convergance in the force!')
            break;
        end
        
        if y == Inf || y == (-Inf)
            fprintf('Infinit x value!\n');
            return;
        end
        
        iteration = iteration + 1;
    end
end
