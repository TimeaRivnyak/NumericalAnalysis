function v = InverseIteration(A, eigen_value)
    v = zeros(size(A, 1), 1);
    v_old = zeros(size(A, 1), 1);
    v(1) = 1;
    threshold = 10^-4;
    i = 0;
    while norm(v-v_old) > threshold && i < 1000
        eq = A-eigen_value * eye(size(A, 1));
        w = ThomasAlgorithm(eq, v);
        v_old = v;
        v = w / norm(w);
        i = i + 1;
    end
end

