% This file implement the simulation for ELEC 4700 PA5 part 2 ix
% Change the ‘−4’ in the G matrix diagonal to ‘−2’ for a region of space
% (say i > 10 & i < 20 & j > 10 & j < 20)

% Define dimension
nx = 50;  % number of element in the x direction
ny = 50;  % number of elemnent in the y direction
numSol = 9;  % Number of eigenvectors solution

% Declare the G matrix
G = zeros(nx*ny, nx*ny);

% Loop to construct
for iRow = 1:nx
    for jCol = 1:ny
        n = mappingEq(iRow, jCol, ny);
        if iRow == 1 || iRow == nx || jCol==1 || jCol == ny
            G(n, n)=1;
        elseif iRow>10 && iRow<20 && jCol>10 && jCol<20
            G(n, n) = -2;
            % Calculate the mapping index
            nxm = mappingEq(iRow-1, jCol, ny);
            nxp = mappingEq(iRow+1, jCol, ny);
            nym = mappingEq(iRow, jCol-1, ny);
            nyp = mappingEq(iRow, jCol+1, ny);
            % Setup the values
            G(n, nxm) = 1;
            G(n, nxp) = 1;
            G(n, nym) = 1;
            G(n, nyp) = 1;
        else
            G(n, n) = -4;
            % Calculate the mapping index
            nxm = mappingEq(iRow-1, jCol, ny);
            nxp = mappingEq(iRow+1, jCol, ny);
            nym = mappingEq(iRow, jCol-1, ny);
            nyp = mappingEq(iRow, jCol+1, ny);
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
title("G matrix")

% Get the eigenvectors and eigenvalues
[E, D] = eigs(G, numSol, 'SM');

% Plot for the EMatrix
figure(2)
% Loop to plot all eigenvectors solutions
for iSol = 1:numSol
    % Map the eigenvectors back to the matrix
    subplot(3,3,iSol)
    EMatrix = reshape(E(:,iSol),ny, nx)';
    surf(EMatrix)
    title("Mode: " + (iSol-1))
end





