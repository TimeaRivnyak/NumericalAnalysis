function LinearSplineInt(f, num_of_knots, discrete_unit)
    for i = 1:num_of_knots
        x_prev = (i-1)/num_of_knots;
        x_act = i/num_of_knots;
        X = x_prev:discrete_unit:x_act;
        s = @(x) (((x_act-x)/(x_act-x_prev))*f(x_prev)+((x-x_prev)/(x_act-x_prev))*f(x_act));
        plot(X, s(X));
    end
end

