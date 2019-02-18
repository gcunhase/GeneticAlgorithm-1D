function y = simple_fitness(x)

    % y = x(:).^2 + 1;
    y = x(:).^4-10*x(:).^3-5*x(:).^2+4;
