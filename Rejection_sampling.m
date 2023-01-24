function [X] = Rejection_sampling(f,g,M,N,range)
    rng(42)
    n = 0;
    X = zeros(N,1);
    c = 0;
    a = range(1);
    b = range(2);
    while n < N && c < 1000
        trial_x = range(1) + rand(2*N,1)*(b-a);
        gM = M*g;
        accepted_x = trial_x(gM < f(trial_x));
        if isempty(accepted_x)
            error('No Points Sampled')
        end
        X(n+1:min([n+length(accepted_x),N])) = accepted_x(1:min([length(accepted_x),N - n]));
        n = n + length(accepted_x);
        c = c+1;
    end
end
