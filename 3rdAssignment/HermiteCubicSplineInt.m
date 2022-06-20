function HermiteCubicSplineInt(f, df, num_of_knots, discrete_unit)
    for i = 1:num_of_knots
        x_prev = (i-1)/num_of_knots;
        x_act = i/num_of_knots;
        h = x_act - x_prev;
        H0 = @(x) (((x-x_act).^2)/(h^2)).*(1 + (2/h)*(x-x_prev));
        K0 = @(x) (((x-x_act).^2)/(h^2)).*(x-x_prev);
        H1 = @(x) (((x-x_prev).^2)/(h^2)).*(1 - (2/h)*(x-x_act));
        K1 = @(x) (((x-x_prev).^2)/(h^2)).*(x-x_act);
        s = @(x) H0(x).*f(x_prev) + df(x_prev).*K0(x) + f(x_act).*H1(x) + df(x_act).*K1(x);
        X = x_prev:discrete_unit:x_act;
        plot(X, s(X));
    end
end

