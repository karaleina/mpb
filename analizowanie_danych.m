% UWAGA: Ten skrypt wymaga wcześniejszego wczytania danych za pomocą skryptu
% 'wczytywanie_danych.m'.

% Parametr dla użytkownika
neighbours = 30;

%% Macierz odległości

% Trójkątna macierz odległości
D_trojkatne = zeros(length(norm_matrix(:,1)));

for index=1:r
    for sasiad_index=1:r
        if sasiad_index == index
            break;
        else
            biezaca_odleglosc = euklides_distance(norm_matrix(index, :),norm_matrix(sasiad_index, :));
            D_trojkatne(index, sasiad_index) = biezaca_odleglosc;
        end
    end
end

% Pełna macierz odległości
D = D_trojkatne + D_trojkatne';

%% Sortowanie sąsiadow dla każdego wiersza

sorted_D = zeros(size(D));
for index=1:r
    temp_matrix=[1:1:r; D(index,:)];
    
    %robimy magie zeby sort dzialal jak trzeba
    %[d1,d2] = sort(A(1,:));
    % A(:,d2)
    [d1, d2] = sort(temp_matrix(2, :));
    
    sorted_D(index, :) = temp_matrix(1, d2);
end

%% Metoda k-najbliższych sąsiadów

new_matrix_euklides = norm_matrix;

for i=1:r
    for j=1:c
       if isnan(new_matrix_euklides(i, j))
           k = 0;
           aproks_wartosc = 0;
           index_sasiada = 1;
           suma_wag = 0;
           while(k ~= neighbours)
               
               index_sasiada = index_sasiada + 1;
               
               % Obliczamy nowego NaNa, zakladajac, ze bedzie to srednia
               % wazona z k- najblizszych sasiadow
               
               if(~isnan(matrix(sorted_D(index_sasiada), j)))
                   waga = 1/D(i, index_sasiada);
                   aproks_wartosc = aproks_wartosc + waga*norm_matrix(sorted_D(index_sasiada), j);
                   k = k + 1;
                   suma_wag = suma_wag + waga;
               end
            end
           
           new_matrix_euklides(i, j) = aproks_wartosc/suma_wag;
       end
    end
end

roznica_euklides = anty_normalization(new_matrix_euklides, srednia_wierszy) - old_matrix;
blad_sredniokwadratowy_odleglosc_euklidesowa = mean_squares(roznica_euklides)

%% Prosta metoda uzupelniania zerami

matrix_zera = matrix;
matrix_zera(isnan(matrix_zera)) = 0;
blad_sredniokwadratowy_wstawianie_zer = mean_squares(matrix_zera - old_matrix)

%% Prosta metoda uzupelniania srednia wierszy

matrix_srednie = matrix;
for i=1:r
    for j=1:c
        if isnan(matrix_srednie(i,j))
            matrix_srednie(i, j) = srednia_wierszy(i);
        end
    end
end

blad_sredniokwadratowy_srednia_wierszy = mean_squares(matrix_srednie - old_matrix)


