function [ x ] = mean_squares( matrix1)
% MEAN_SQUARES jako argument przyjmuje macierz matrix1 będącąm różnicą dwóch macierzy;
% oblicza średnią kwadratową elementów macierzy niebędących zerami
    suma = 0;
    liczbaNaN = 0;
    for i=1:length(matrix1(:, 1))
        for j=1:length(matrix1(1,:))
            if (matrix1(i,j)~= 0)
                suma = suma + matrix1(i, j)^2; 
                liczbaNaN = liczbaNaN + 1; 
            end
        end
    end
    x = (suma/liczbaNaN)^2;
end

