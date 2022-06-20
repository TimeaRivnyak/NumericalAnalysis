function [x, iteration] = bisectionmethod(f, x_left, x_right, p)
    x = (x_left + x_right)/2;
    
    if f(x_left) * f(x_right) > 0
        disp('No zero point between the upper and lower x values!')
        x = NaN;
        iteration = 0;
        return;
    end
    
    iteration = 1;
    
    while abs(f(x)) >= p
        
        if(f(x) * f(x_right)) < 0
            x_left = x;
        else
            x_right = x;
        end
        
        x = (x_left + x_right)/2;
        
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