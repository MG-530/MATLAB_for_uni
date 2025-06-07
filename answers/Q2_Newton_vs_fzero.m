%% ========================================================================
%% PROBLEM 2: NEWTON'S METHOD - ln(x) + x^2 = 3
%% ========================================================================

fprintf('========== PROBLEM 2: NEWTON''S METHOD ==========\n');

% Define function and its derivative
f2 = @(x) log(x) + x^2 - 3;
df2 = @(x) 1/x + 2*x;
% Second derivative for Halley's method
d2f2 = @(x) -1/x^2 + 2;

% Apply all methods
tol = 1e-5;
x0 = 1; % Initial guess

[root2_newton, iter2_newton, hist2_newton] = newton_method(f2, df2, x0, tol);
[root2_halley, iter2_halley] = halley_method(f2, df2, d2f2, x0, tol);
root2_fzero = fzero(f2, x0);

fprintf('Standard Newton:    Root = %.5f, Iterations = %d\n', root2_newton, iter2_newton);
fprintf('Halley Method:      Root = %.5f, Iterations = %d\n', root2_halley, iter2_halley);
fprintf('MATLAB fzero:       Root = %.5f\n', root2_fzero);

% Plot function and convergence
figure(2);
subplot(1,2,1);
x_plot2 = 0.1:0.01:3;
y_plot2 = arrayfun(f2, x_plot2);
plot(x_plot2, y_plot2, 'b-', 'LineWidth', 2);
hold on;
plot(x_plot2, zeros(size(x_plot2)), 'k--');
plot(root2_newton, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
grid on;
title('Function: ln(x) + x^2 - 3');
xlabel('x'); ylabel('f(x)');

subplot(1,2,2);
plot(0:iter2_newton, hist2_newton, 'ro-', 'LineWidth', 2);
grid on;
title('Newton Method Convergence');
xlabel('Iteration'); ylabel('x value');

% Method 1: Standard 6's Method
function [root, iterations, x_history] = newton_method(func, dfunc, x0, tol, max_iter)
    if nargin < 5, max_iter = 100; end
    
    x = x0;
    iterations = 0;
    x_history = x0;
    
    for i = 1:max_iter
        fx = func(x);
        dfx = dfunc(x);
        
        if abs(dfx) < eps
            error('Derivative too small, method may not converge');
        end
        
        x_new = x - fx/dfx;
        iterations = iterations + 1;
        x_history(end+1) = x_new;
        
        if abs(x_new - x) < tol
            root = x_new;
            return;
        end
        x = x_new;
    end
    root = x;
    warning('Maximum iterations reached');
end

% Method 2: Modified Newton's (Halley's Method)
function [root, iterations] = halley_method(func, dfunc, d2func, x0, tol, max_iter)
    if nargin < 6, max_iter = 100; end

    x = x0;
    iterations = 0;
    
    while iterations < max_iter
        fx = func(x);
        dfx = dfunc(x);
        d2fx = d2func(x);
        
        % Halley's formula
        denominator = dfx - (fx * d2fx)/(2 * dfx);
        x_new = x - fx/denominator;
        iterations = iterations + 1;
        
        if abs(x_new - x) < tol
            root = x_new;
            return;
        end
        x = x_new;
    end
    root = x;
end

