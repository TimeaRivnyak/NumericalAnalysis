function CubicSplineInt(f, num_of_knots, discrete_unit)
    d = zeros(1, (num_of_knots-1));
    h = 1/num_of_knots;
    for i = 1:(num_of_knots-1)
        x_prev = (i-1)/num_of_knots;
        x_act = i/num_of_knots;
        x_next = (i+1)/num_of_knots;
        d(i) = 6*(((f(x_next)-f(x_act))/h)-((f(x_act)-f(x_prev))/h));
    end
    sigma = ThomasAlgorithm(h, d, num_of_knots);
    sigma = [0 sigma 0];
    alpha = zeros(1, num_of_knots);
    beta = zeros(1, num_of_knots);
    for i = 1:num_of_knots
        x_prev = (i-1)/num_of_knots;
        x_act = i/num_of_knots;
        a = (1/h)*f(x_act) - (1/6)*sigma(i+1)*h;
        b = (1/h)*f(x_prev) - (1/6)*sigma(i)*h;
        alpha = [alpha, a];
        beta = [beta, b];
    end
    for i = 1:num_of_knots
        x_prev = (i-1)/num_of_knots;
        x_act = i/num_of_knots;
        X = x_prev:discrete_unit:x_act;
        s = @(x) (((x_act-x).^3)/(6*h))*sigma(i) + (((x-x_prev).^3)/(6*h))*sigma(i+1) + alpha(i)*(x-x_prev) + beta(i)*(x_act-x);
        plot(X, s(X));
    end
end

