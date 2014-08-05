function A = remove_loops(B)
    A = B - diag(diag(B));
end