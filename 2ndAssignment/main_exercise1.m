clear
clc

f = @(x) sin(x);
a = 0;
b = 1;
N = 2;

figure
hold on;
x = linspace(a, b);

subplot(3, 1, 1);
hold on;
xlim([0 1])

subplot(3, 1, 2);
hold on;
xlim([0 1])

subplot(3, 1, 3);
hold on;
xlim([0 1])

for i = 0:5
    integral_f = integral(f, a, b);
    n = N^i;
    h = (b - a) / n;
    
    %midpoint
    result_midpoint = midpoint(f, a, b, n);
    error_midpoint_h = abs(integral_f - result_midpoint);
    error_midpoint_h2 = abs(integral_f - midpoint(f, a, b, 2*n));
    r_midpoint = log2(error_midpoint_h / error_midpoint_h2)
    
    subplot(3, 1, 1);
    loglog(h, r_midpoint, 'o');
    
    %trapezoidal
    result_trapezoidal = trapezoidal(f, a, b, n);
    error_trapezoidal_h = abs(integral_f - result_trapezoidal);
    error_trapezoidal_h2 = abs(integral_f - trapezoidal(f, a, b, 2*n));
    r_trapezoidal = log2(error_trapezoidal_h / error_trapezoidal_h2)
    
    subplot(3, 1, 2);
    loglog(h, r_trapezoidal, 'o');
    
    %Simpsons
    result_Simpsons = Simpsons(f, a, b, n);
    error_Simpsons_h = abs(integral_f - result_Simpsons);
    error_Simpsons_h2 = abs(integral_f - Simpsons(f, a, b, 2*n));
    r_Simpsons = log2(error_Simpsons_h / error_Simpsons_h2)
    
    subplot(3, 1, 3);
    loglog(h, r_Simpsons, 'o');
end
subplot(3, 1, 1);
hold off;
subplot(3, 1, 2);
hold off;
subplot(3, 1, 3);
hold off;
hold off;
