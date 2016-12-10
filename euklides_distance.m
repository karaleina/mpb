function [ odleglosc ] = euklides_distance( x, y)
%EUKLIDES_DISTANCE
%   1) x i y to wektory poziome o tych samych wymiarach
%   2) w funkcji obliczana jest odległość euklidesową pod warunkiem, 
%   że elementy wektorów x i y nie są NaNami

    M = x - y;
    M(isnan(M)) = 0;
    K = M * M';
    
    odleglosc = (sum(K))^(1/2); 
    
end

