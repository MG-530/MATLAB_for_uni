%% ========================================================================
%% PROBLEM 1: BISECTION METHOD - cos(x/2) + 6 = x
%% ========================================================================

fprintf('========== PROBLEM 1: BISECTION METHOD ==========\n');

% Define the function f(x) = cos(x/2) + 6 - x
f1 = @(x) cos(x/2) + 6 - x;

% Find initial interval by plotting
x_plot = 0:0.1:10;
y_plot = arrayfun(f1, x_plot);
tol = 1e-5;

% Find root using both methods
[root1_bisection, iter1_bisection, error_hist1] = bisection_method(f1, 0, 10, tol);
root1_fzero = fzero(f1, 6);

fprintf('Bisection Method 1: Root = %.5f, Iterations = %d\n', root1_bisection, iter1_bisection);
fprintf('MATLAB fzero:       Root = %.5f\n', root1_fzero);
fprintf('Difference from fzero: %.2e\n\n', abs(root1_bisection - root1_fzero));

% Plot
figure(1);
subplot(2,2,1);
plot(x_plot, y_plot, 'b-', 'LineWidth', 2);
hold on;
plot(x_plot, zeros(size(x_plot)), 'k--', 'LineWidth', 1);
plot(root1_bisection, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
grid on;
title('Function: cos(x/2) + 6 - x');
xlabel('x'); ylabel('f(x)');

subplot(2,2,2);
semilogy(1:iter1_bisection, error_hist1, 'ro-', 'LineWidth', 2);
grid on;
title('Bisection Convergence');
xlabel('Iteration'); ylabel('Error (log scale)');

% Method 1: Standard Bisection Implementation
function [root, iterations, error_history] = bisection_method(func, a, b, tol)
    if func(a) * func(b) > 0
        error('Function values at endpoints must have opposite signs');
    end
    
    iterations = 0;
    error_history = [];
    
    while abs(b - a) > tol
        c = (a + b) / 2;
        iterations = iterations + 1;
        error_history(iterations) = abs(b - a);
        
        if func(c) == 0
            root = c;
            return;
        elseif func(a) * func(c) < 0
            b = c;
        else
            a = c;
        end
    end
    root = (a + b) / 2;
end
