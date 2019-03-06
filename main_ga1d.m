% Coding and Minimizing a Fitness Function Using the Genetic Algorithm
% https://kr.mathworks.com/help/gads/examples/coding-and-minimizing-a-fitness-function-using-the-genetic-algorithm.html

%% GA 1D: Matlab
FitnessFunction = @simple_fitness;
numberOfVariables = 1;
[x,fval] = ga(FitnessFunction,numberOfVariables)

%% GA 1D: Custom code

% Decides whether initial population has a random seed or the same (for fidelity)
testing = 1;
% Initial population
n_pop = 10;  % has to be even
if testing == 1
    rng('default')
    pop = rand(1,n_pop);
else
    rng('shuffle');
    pop = rand(1,n_pop);
end

max_generation = 100;
generation = 0;
float_precision = 2;  % 10^float_precision
num_bits_per_sample = 16;
num_children = 2;
mutation_prob = 0.1;
% M + N + num_children == n_pop
% N + M == n_pop/2
N = round(n_pop/(num_children*2));  % n_pop=10, N=3
M = round(n_pop/num_children - N);  % n_pop=10, M=2
% Check criteria
while generation <= max_generation
    % Fitness
    FitnessFunction = @simple_fitness;
    y = FitnessFunction(pop);
    
    % Selection: rank population by lowest y score (minimization problem)
    [y_sorted, index] = sort(y, 'ascend');
    pop_sorted = pop(index);
    
    if generation < max_generation
        best_sample = [1:1:N];
        lucky_few = randi([N, n_pop], [1, M]);
        next_parents = breeders_selection(pop_sorted, best_sample, lucky_few);  % n_pop=10, next_pop=5

        % Crossover (reproduction)
        % n_pop=10 -> p(5)xp(1), p(4)xp(2), p(3)xp(3), p(2)xp(4), p(1)xp(5)
        % Each producing 2 new children for the new population
        new_pop = [];
        for i=1:round(n_pop/2)
            parent1 = next_parents(i);
            parent2 = next_parents(length(next_parents) - i + 1);
            for j=1:1:num_children
                new_pop = [new_pop, create_child(parent1, parent2,...
                    float_precision, num_bits_per_sample, mutation_prob)];
            end
        end

        pop = new_pop;
    end
    generation = generation + 1;
end

disp(['best_x: ', num2str(pop_sorted(1)), ', best_y: ', num2str(y_sorted(1))])
