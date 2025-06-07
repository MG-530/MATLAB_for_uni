%% ========================================================================
%% PROBLEM 5: SURFACE PLOTTING WITH CONTOURS
%% ========================================================================

fprintf('========== PROBLEM 5: SURFACE PLOTTING ==========\n');

% Define the function
f5 = @(x, y) cos(x) .* cos(y) .* exp(-sqrt(x.^2 + y.^2)/4);

% Create grid
x = linspace(-2*pi, 2*pi, 100);
y = linspace(-2*pi, 2*pi, 100);
[X, Y] = meshgrid(x, y);
Z = f5(X, Y);

% Method 1: Standard surface plot with contours
figure(51);
subplot(2,2,1);
surf(X, Y, Z);
shading interp;
colorbar;
title('Surface Plot: cos(x)cos(y)e^{-\sqrt{x^2+y^2}/4}');
xlabel('x'); ylabel('y'); zlabel('f(x,y)');

% Method 2: Contour plot
subplot(2,2,2);
contour(X, Y, Z, 20);
colorbar;
title('Contour Plot');
xlabel('x'); ylabel('y');
axis equal;

% Method 3: Filled contour plot
subplot(2,2,3);
contourf(X, Y, Z, 30);
colorbar;
title('Filled Contour Plot');
xlabel('x'); ylabel('y');
axis equal;

% Method 4: 3D contour plot
subplot(2,2,4);
contour3(X, Y, Z, 15);
title('3D Contour Plot');
xlabel('x'); ylabel('y'); zlabel('f(x,y)');

% Advanced visualization
figure(52);

% Method 5: Surface with projected contours
subplot(2,2,1);
surf(X, Y, Z);
hold on;
contour3(X, Y, Z, [0, 0], 'k', 'LineWidth', 2); % Zero contour
shading interp;
colorbar;
title('Surface with Zero Contour');

% Method 6: Gradient field
subplot(2,2,2);
[Gx, Gy] = gradient(Z, x(2)-x(1), y(2)-y(1));
contour(X, Y, Z, 15);
hold on;
quiver(X(1:5:end, 1:5:end), Y(1:5:end, 1:5:end), ...
       Gx(1:5:end, 1:5:end), Gy(1:5:end, 1:5:end), 'r');
title('Contours with Gradient Field');
xlabel('x'); ylabel('y');

% Method 7: Multiple contour levels with labels
subplot(2,2,3);
[C, h] = contour(X, Y, Z, [-0.5:0.1:0.5]);
clabel(C, h);
title('Labeled Contour Lines');
xlabel('x'); ylabel('y');

% Method 8: Cross-sections
subplot(2,2,4);
plot(x, f5(x, 0), 'b-', 'LineWidth', 2, 'DisplayName', 'y = 0');
hold on;
plot(x, f5(0, x), 'r-', 'LineWidth', 2, 'DisplayName', 'x = 0');
plot(x, f5(x, x), 'g-', 'LineWidth', 2, 'DisplayName', 'y = x');
grid on;
title('Cross-sections of the Function');
xlabel('x or y');
ylabel('f(x,y)');
legend('Location', 'best');

% Statistical analysis of the function
fprintf('Function statistics over [-2π, 2π] × [-2π, 2π]:\n');
fprintf('Maximum value: %.6f\n', max(Z(:)));
fprintf('Minimum value: %.6f\n', min(Z(:)));
fprintf('Mean value: %.6f\n', mean(Z(:)));
fprintf('Standard deviation: %.6f\n', std(Z(:)));

% Find critical points (approximate)
[max_val, max_idx] = max(Z(:));
[max_row, max_col] = ind2sub(size(Z), max_idx);
fprintf('Approximate maximum at: (%.3f, %.3f) = %.6f\n', ...
        X(max_row, max_col), Y(max_row, max_col), max_val);

[min_val, min_idx] = min(Z(:));
[min_row, min_col] = ind2sub(size(Z), min_idx);
fprintf('Approximate minimum at: (%.3f, %.3f) = %.6f\n', ...
        X(min_row, min_col), Y(min_row, min_col), min_val);
