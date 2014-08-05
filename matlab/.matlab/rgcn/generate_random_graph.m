function B = generate_random_graph(A)
    n = length(A);
    p = 2*log(n)/n;
    B = logical(A);
    for i = 1:floor(n/1000)
        disp(i);
        row = logical(random('bino', 1, p, [1000 (n-i)]));
        B((i-1)*1000:(i-1)*1000+1000,:) = [zeros(1000, i) row];
    end
    
    rest = mod(n,1000);
    row = logical(random('bino', 1, p, [rest (n-floor(n/1000))]));
    B(((floor(n/1000))*1000 +1):((floor(n/1000))*1000+rest),:) = [zeros(rest, floor(n/1000)) row];
end