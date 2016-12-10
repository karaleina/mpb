function [ out, srednia_wierszy ] = normalization( matrix)
% NORMALIZATION - funkcja, która dzieli wiersze macierzy przez średnią
% każdego wiersza
    matrix2 = matrix;
    matrix2(isnan(matrix2)) = 0;
    srednia_wierszy = mean(matrix2');

    norm_matrix = zeros(size(matrix));
    
    for i= 1:length(matrix(:,1))
        norm_matrix(i, :) = matrix(i,:)./srednia_wierszy(i);
    end
    
    out = norm_matrix;

end

