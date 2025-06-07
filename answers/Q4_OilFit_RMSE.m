%% ========================================================================
%% PROBLEM 4: POLYNOMIAL FITTING - JAPAN OIL CONSUMPTION
%% ========================================================================

fprintf('========== PROBLEM 4: POLYNOMIAL FITTING ==========\n');

% Data
months = 1:12;
oil_consumption = [6.224, 6.665, 6.241, 5.302, 5.073, 5.127, 4.994, 5.012, 5.108, 5.377, 5.510, 6.372];

% Normalize months to improve numerical stability
x_mean = mean(months);
x_std = std(months);
months_norm = (months - x_mean) / x_std;

% Multiple fitting approaches
degrees = 1:10;
rmse_values = zeros(size(degrees));
polynomials = cell(length(degrees), 1);

% Standard polynomial fitting with normalization
for d = degrees
    p = polyfit(months_norm, oil_consumption, d);
    polynomials{d} = p;
    y_fit = polyval(p, months_norm);
    rmse_values(d) = sqrt(mean((oil_consumption - y_fit).^2));
end

fprintf('RMSE for different polynomial degrees:\n');
fprintf('Degree\tRMSE\n');
for d = 1:10
    fprintf('%d\t%.6f\n', d, rmse_values(d));
end

% Create comprehensive plots
figure(41);
for d = 1:10
    subplot(2, 5, d);
    
    % Plot original data
    plot(months, oil_consumption, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
    hold on;
    
    % Generate smooth curve for plotting
    x_smooth = linspace(1, 12, 100);
    x_smooth_norm = (x_smooth - x_mean) / x_std;
    y_smooth = polyval(polynomials{d}, x_smooth_norm);
    plot(x_smooth, y_smooth, 'r-', 'LineWidth', 2);
    
    % Plot fitted points
    y_fit = polyval(polynomials{d}, months_norm);
    plot(months, y_fit, 'ro', 'MarkerSize', 6);
    
    grid on;
    title(sprintf('Degree %d (RMSE=%.4f)', d, rmse_values(d)));
    xlabel('Month');
    ylabel('Oil Consumption');
    legend('Data', 'Fit', 'Fitted Points', 'Location', 'best');
    axis([1 12 4.5 7]);
end

% Additional analysis plot
figure(42);
subplot(1,2,1);
plot(degrees, rmse_values, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
title('RMSE vs Polynomial Degree');
xlabel('Polynomial Degree');
ylabel('RMSE');

% Cross-validation analysis with normalization
subplot(1,2,2);
cv_errors = zeros(10, 1);
for d = 1:10
    cv_error = 0;
    for i = 1:length(months)
        train_months = months([1:i-1, i+1:end]);
        train_oil = oil_consumption([1:i-1, i+1:end]);
        test_month = months(i);
        test_oil = oil_consumption(i);
        
        % Normalize training and test data
        train_mean = mean(train_months);
        train_std = std(train_months);
        train_norm = (train_months - train_mean) / train_std;
        test_norm = (test_month - train_mean) / train_std;
        
        p_cv = polyfit(train_norm, train_oil, d);
        pred_oil = polyval(p_cv, test_norm);
        cv_error = cv_error + (test_oil - pred_oil)^2;
    end
    cv_errors(d) = sqrt(cv_error / length(months));
end

plot(1:10, cv_errors, 'mo-', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
title('Cross-Validation Error');
xlabel('Polynomial Degree');
ylabel('CV RMSE');
