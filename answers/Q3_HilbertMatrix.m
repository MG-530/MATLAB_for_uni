
%% ========================================================================
%% PROBLEM 3: HILBERT MATRIX ANALYSIS
%% ========================================================================

fprintf('========== PROBLEM 3: HILBERT MATRIX ANALYSIS ==========\n');

n = 5;
% Generate Hilbert matrix
H = hilb(n);
b = ones(n, 1);

% Method 1: Direct solution
x_direct = H \ b;

% Method 2: LU decomposition
[L, U, P] = lu(H);
y = L \ (P * b);
x_lu = U \ y;

% Method 3: QR decomposition
[Q, R] = qr(H);
x_qr = R \ (Q' * b);

% Method 4: SVD method
[U_svd, S, V] = svd(H);
x_svd = V * (S \ (U_svd' * b));

fprintf('Solution methods comparison:\n');
fprintf('Direct (\\):     [%.6f, %.6f, %.6f, %.6f, %.6f]\n', x_direct);
fprintf('LU decomp:      [%.6f, %.6f, %.6f, %.6f, %.6f]\n', x_lu);
fprintf('QR decomp:      [%.6f, %.6f, %.6f, %.6f, %.6f]\n', x_qr);
fprintf('SVD method:     [%.6f, %.6f, %.6f, %.6f, %.6f]\n', x_svd);

% Characteristic polynomial
char_poly = poly(H);
fprintf('\nCharacteristic polynomial coefficients:\n');
disp(char_poly);

% Eigenvalues and eigenvectors
[eigenvectors, eigenvalues] = eig(H);
eigenvalues_diag = diag(eigenvalues);

fprintf('Eigenvalues:\n');
for i = 1:n
    fprintf('λ_%d = %.8f\n', i, eigenvalues_diag(i));
end

fprintf('\nCondition number: %.2e\n', cond(H));
fprintf('Determinant: %.2e\n', det(H));
