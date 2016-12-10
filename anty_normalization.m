function [ old] = anty_normalization( matrix, srednia_wierszy)
% NORMALIZATION - funkcja, która mnozy wiersze macierzy przez liczbe
    
    anty_norm_matrix = zeros(size(matrix));

    for i= 1:length(matrix(:,1))
        anty_norm_matrix(i, :) = matrix(i,:).*srednia_wierszy(i);
    end
    
    old = anty_norm_matrix;

end

