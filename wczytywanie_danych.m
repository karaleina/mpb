 clear all; close all; clc;

%% Parametr dla użytkownika
percent = 0.03;

%% Wczytywanie
[a, Leukemia2] = xlsread('Leukemia_500.xls');

[rows,columns] = size(Leukemia2);
old_matrix = str2double(Leukemia2(3:rows,2:columns));

matrix = str2double(Leukemia2(3:rows,2:columns));
[r,c] = size(matrix);

allCells = r*c;
 


number_of_gaps = int64(allCells*percent);

%% Pętla while zapewniająca odpowiedni procent NaNów w macierzy 

while matrix_size(size(find(isnan(matrix)))) ~= number_of_gaps
    r1 = randi(r);
    r2 = randi(c); 
    matrix(r1, r2) = NaN;
end

%% Normalizacja wartości (dzielenie przez średnią wierszy)
[norm_matrix, srednia_wierszy] = normalization(matrix);