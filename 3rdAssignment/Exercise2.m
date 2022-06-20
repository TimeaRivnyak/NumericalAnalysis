clc 
clear

num_of_knots = 50;

discrete_unit = 0.001;
X = 0:discrete_unit:1;
s_unit = 0.02;
Xs = 0:s_unit:1;

% f1 = figure('Name', 'Linear');
% for j = 1:num_of_knots
%     clf
%     t = j/num_of_knots;
%     syms x
%     f = sin(5*pi*x) * cos(10*pi*t) + 2 * sin(7*pi*x) * cos(14*pi*t);
%     hold on;
%     plot(X, f(X), 'k');
%     LinearSplineInt(f, num_of_knots, discrete_unit);
%     drawnow
%     pause(0.5)
%     hold off;
% end
% close(f1)

% f2 = figure('Name', 'Natural Cubic');
% for j = 1:num_of_knots
%     clf
%     t = j/num_of_knots;
%     f = @(x) sin(5*pi*x) * cos(10*pi*t) + 2 * sin(7*pi*x) * cos(14*pi*t);
%     hold on;
%     plot(X, f(X), 'k');
%     %CubicSplineInt(f, num_of_knots, discrete_unit);
%     csi = csape(Xs, f(Xs), 'variational');
%     fnplt(csi, '-', 0.5);
%     drawnow
%     pause(0.5)
%     hold off;
% end
% close(f2)

f3 = figure('Name', 'Hermite');
for j = 1:num_of_knots
    clf
    t = j/num_of_knots;
    syms f(x)
    f(x) = sin(5*pi*x) * cos(10*pi*t) + 2 * sin(7*pi*x) * cos(14*pi*t);
    df = diff(f, x);
    hold on;
    plot(X, f(X), 'k');
    HermiteCubicSplineInt(f, df, num_of_knots, discrete_unit);
    drawnow
    pause(0.5)
    hold off;
end
close(f3)