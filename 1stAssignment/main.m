clc;
clear;

p = 10^(-4);

%first task: Fibonacci
disp('Exercise 2')

f1 = @(x) x^3 + 2 * x^2 + 10 * x - 20;
fd1 = @(x) 3 * x^2 + 4 * x + 10;

[nm_result1, nm_iteration_number1] = newtonsmethod(f1, fd1, 1, p)
[sm_result1, sm_iteration_number1] = secantmethod(f1, 1, 2, p)
[bm_result1, bm_iteration_number1] = bisectionmethod(f1, 1, 2, p)

%Second task: equation
disp('Exercise 3')

f2 = @(x) tanh(x);
fd2 = @(x) 1 / (cosh(x)^2);

[nm_result2, nm_iteration_number2] = newtonsmethod(f2, fd2, -5, p)
[sm_result2, sm_iteration_number2] = secantmethod(f2, -5, -4, p)
[bm_result2_1, bm_iteration_number2_1] = bisectionmethod(f2, -5, 1, p)
[bm_result2_2, bm_iteration_number2_2] = bisectionmethod(f2, 5, 10, p)

%Third task: rewrite
disp('Exercise 4')

g = @(x) 20 / (x^2 + 2 * x + 10);
fv = @(g) g^3 + 2 * g^2 + 10 * g - 20;
