% This file implement the simulation for ELEC 4700 PA5 

% Define dimension
% nx = 50;  % number of element in the x direction
% ny = 50;  % number of elemnent in the y direction
nx = 5;
ny = 5;
m = nx*ny;

% Declare the G matrix
G = zeros(m, m);

% Loop to construct the G matrix
for iRow = 1:m
    for iCol = 1:m
        % Calculate the mapping index for diagonal value
        n = mappingEq(iRow, iCol, ny);
        % Setup the values for diagonal value
        G(n, n) = -2;
        % Setup the values for the interial
        if iRow ~= 1 && iRow ~= m && iCol ~= 1 && iRow ~= m
            % Calculate the mapping index
            nxm = mappingEq(iRow-1, iCol, ny);
            nxp = mappingEq(iRow+1, iCol, ny);
            nym = mappingEq(iRow, iCol-1, ny);
            nyp = mappingEq(iRow, iCol+1, ny);
            % Setup the values
            G(n, nxm) = 1;
            G(n, nxp) = 1;
            G(n, nym) = 1;
            G(n, nyp) = 1;
        end
    end
end

% Plot the G matrix
figure(1)
spy(G);

% Get the eigenvectors and values
[E, D] = eigs(G, 9, 'SM');

% Map the eigenvectors back to the matrix
% EMatrix = reshape(E(:,1),nx, ny)';
% Plot the EMatrix
% figure(2)
% surf(EMatrix)

